require 'csv'

class CSVReader

  attr_reader :attribute_csv_file

  def initialize(attribute_csv_file)
    @attribute_csv_file = attribute_csv_file
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

end
