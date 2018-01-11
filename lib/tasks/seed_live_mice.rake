namespace :seed do
  desc "load live mice"
  task :live_mice => :environment do
    10.times do
      num3 = rand(1..9)
      num4 = rand(1..9)
      Mouse.create!(original_id: "49#{num3}#{num4}-1", trisomic: ['true', 'false'].sample, diet: ['rapamycin', 'control'].sample, date_of_birth: Date.today, experiment_start_date: Date.today, harvest_date: Date.today, group_number: "6", status: 'live')
    end
  end
end
