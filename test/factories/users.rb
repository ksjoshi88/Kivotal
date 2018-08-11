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

end
