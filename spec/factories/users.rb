# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |num|
    "testing#{num}@example.org"
  end

  factory :user do
    username { Factory.next(:email).split('@').first }
    email { Factory.next(:email) }
    password "T35t1ng!"
    password_confirmation "T35t1ng!"
  end
end
