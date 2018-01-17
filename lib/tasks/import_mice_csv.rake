require './app/services/basic_attribute_csv_reader'

namespace :import do
  desc "load basic attribute data into db"
  task :mice_basic_attributes => :environment do
    reader = BasicAttributeCSVReader.new('app/data/mouse_attributes.csv')
    reader.csv_to_mice
  end
end
