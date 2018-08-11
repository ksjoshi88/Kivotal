FactoryBot.define do

  sequence :email do |n|
    "user#{n}@kivotal.com"
  end


  factory :user do
    first_name 'John'
    last_name  'Doe'
    email
    password 'Kivotal1'
    password_confirmation 'Kivotal1'
  end

  factory :manager, class: User do
    first_name 'Kevin'
    last_name  'Durant'
    email
    password 'Kivotal1'
    password_confirmation 'Kivotal1'
    roles { [ Role.find_or_create_by(name: 'manager') ] }
  end

  factory :developer, class: User do
    first_name 'Lebron'
    last_name  'James'
    email
    password 'Kivotal1'
    password_confirmation 'Kivotal1'
    roles { [ Role.find_or_create_by(name: 'developer') ] }
  end

end
