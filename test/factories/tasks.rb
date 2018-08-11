FactoryBot.define do

  sequence :todo do |n|
    "complete task#-#{n}"
  end

  factory :task do
    todo
    project
    developer
    status 'unassigned'

    trait :unassigned do
      status 'unassigned'
    end

    trait :assigned do
      status 'assigned'
    end

    trait :in_progress do
      status 'in_progress'
    end

    trait :done do
      status 'done'
    end

  end
end
