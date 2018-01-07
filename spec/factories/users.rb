FactoryBot.define do
  factory :user do
    sequence(:first_name) {|n| "FirstName#{n}"}
    sequence(:last_name) {|n| "LastName#{n}"}
    password "MyString"
    sequence(:uid)  {|n| "#{n}#{n}#{n}"}
    sequence(:token)  {|n| "abc#{n}#{n}#{n}"}
    sequence(:email)  {|n| "#{n}@example.com"}
  end
end
