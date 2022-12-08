FactoryBot.define do
  factory :note do
    sequence(:title) { |n| "title#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end