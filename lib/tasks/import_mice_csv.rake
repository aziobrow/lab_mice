require './app/services/basic_attribute_csv_reader'
require './app/services/harvest_data_csv_reader'

namespace :import do
  desc "load basic attribute data into db"
  task :mice_basic_attributes => :environment do
    reader = BasicAttributeCSVReader.new('app/data/mouse_attributes.csv')
    reader.csv_to_mice
  end

  desc "load harvest data into db"
  task :harvest_data => :environment do
    reader = HarvestCSVReader.new('app/data/mouse_attributes.csv')
    reader.csv_to_harvest
  end
end
