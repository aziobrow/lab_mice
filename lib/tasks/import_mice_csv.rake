require './app/services/basic_attribute_csv_reader'
require './app/services/harvest_data_csv_reader'

namespace :import do
  desc "load stub protocol data into db"
  task :protocols => :environment do
    Protocol.create!(name: 'Protocol 1')
    Protocol.create!(name: 'Protocol 2')
    Protocol.create!(name: 'Protocol 3')
  end

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
