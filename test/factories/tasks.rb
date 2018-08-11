FactoryBot.define do

  factory :task do
    todo "Add Module"
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
