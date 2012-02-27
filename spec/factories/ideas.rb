# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:idea_text) do |num|
    "Idea Text ##{num}"
  end

  factory :idea do
    title { Factory.next(:idea_text) }
    body  { Factory.next(:idea_text) }
    association :user
  end
end
