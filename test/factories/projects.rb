FactoryBot.define do

  sequence :title do |n|
    "project-#{n}"
  end

  factory :project do
    title
    manager
  end
end
