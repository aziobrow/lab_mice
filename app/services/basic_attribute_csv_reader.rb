require 'csv'

class CSVReader

  attr_reader :attribute_csv_file

  def initialize(attribute_csv_file)
    @attribute_csv_file = attribute_csv_file
  end

  def clean_ploidy(value)
    ploidy_value = value.downcase
    if ploidy_value == "yes"
      return "trisomic"
    elsif ploidy_value == "no"
      return "disomic"
    else
      return nil
    end
  end

  def is_float?(value)
    true if Float(value) rescue false
  end

  def clean_protein(value)
    if is_float?(value)
      return value.to_f
    else
      return nil
    end
  end

  def clean_diet(value)
    diet_value = value.downcase
    if diet_value == 'rapa' || diet_value == "rapamycin"
      return "rapamycin"
    elsif diet_value == 'cont' || diet_value == "control"
      return "control"
    else
      return nil
    end
  end

  def clean_color(value)
    color_value = value.downcase
    if color_value == 'black' || color_value == 'agouti'
      return color_value
    else
      return nil
    end
  end

  def clean_gender(value)
    gender_value = value.downcase
    if gender_value == 'male'
      return 0
    elsif gender_value == 'female'
      return 1
    else
      return nil
    end
  end

  def clean_brain_temp(value)
    if is_float?(value)
      return value.to_f
    else
      return nil
    end
  end

  def clean_weight(value)
    if is_float?(value)
      return value.to_f
    else
      return nil
    end
  end

  def csv_to_mice
    mice = (CSV.open"#{csv_file}", headers: true, header_converters: :symbol)

    count = 0
    mice.each do |mouse|
      puts "Mouse #{count} created"
      count += 1

      Mouse.create!(lab_id: mouse[:id],
                    ploidy: clean_ploidy(mouse[:trisomic]),
                    diet: clean_diet(mouse[:diet]),
                    color: clean_color(mouse[:color]),
                    sex: clean_gender(mouse[:sex]),
                    date_of_birth: mouse[:date_of_birth],
                    experiment_start_date: mouse[:experiment_start_date],
                    group_number: mouse[:group_number],
                    harvest_status: 1,
                    active_status: 0
                  )
    end
  end

end
