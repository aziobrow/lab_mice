
namespace :create do
  desc "create fake protocol data into dev"
  task :fake_protocols => :environment do
    3.times do |n|
      Protocol.create!(name: "Protocol #{n}")
    end
  end
  
end
