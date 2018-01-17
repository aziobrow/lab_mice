FactoryBot.define do
  factory :mouse do
    sequence(:lab_id)  {|n| "4587-#{n}"}
    ploidy "disomic"
    diet "Cont"
    color "Agouti"
    sex 0
    date_of_birth "6/19/2011"
    experiment_start_date "10/17/2011"
    group_number "6"
    harvest_status 1
    treatment_status 0
    active_status 0

    factory :mouse_trisomic_true do
      ploidy "trisomic"
    end

    factory :mouse_rapa_diet do
      diet "rapa"
    end

    factory :mouse_black do
      color "black"
    end

    factory :mouse_female do
      sex 1
    end

    factory :mouse_born_yesterday do
      date_of_birth Date.yesterday
    end

    factory :mouse_started_today do
      experiment_start_date Date.today
    end

    factory :mouse_group_twelve do
      group_number "12"
    end

    factory :mouse_live do
      harvest_status 0
    end
  end
end
