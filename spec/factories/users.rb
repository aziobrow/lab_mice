FactoryBot.define do
  factory :user do
    sequence(:first_name) {|n| "FirstName#{n}"}
    sequence(:last_name) {|n| "LastName#{n}"}
    password_digest "MyString"
  end
end
