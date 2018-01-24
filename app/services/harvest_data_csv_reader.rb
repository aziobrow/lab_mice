require 'csv'

class HarvestCSVReader

  attr_reader :harvest_csv_file

  def initialize(harvest_csv_file)
    @harvest_csv_file = harvest_csv_file
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

  def convert_date(value)
    Date.strptime(value, '%m/%d/%Y')
  end

  def csv_to_harvest
    mice = (CSV.open"#{harvest_csv_file}", headers: true, header_converters: :symbol)

    count = 0
    mice.each do |mouse|
      puts "Harvest #{count} created"
      count += 1

      Harvest.create!(mouse: Mouse.find_by(lab_id: mouse[:id]),
                    date_of_harvest: convert_date(mouse[:harvest_date]),
                    weight_in_g: clean_weight(mouse[:weight_in_grams]),
                    protein_ug_per_ml: clean_protein(mouse[:protein_ug_per_ml]),
                    brain_temp: clean_brain_temp(mouse[:harvest_brain_temp])
                  )
    end
  end

end
