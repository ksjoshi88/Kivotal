FactoryBot.define do

  sequence :email do |n|
    "user#{n}@kivotal.com"
  end


  factory :user do
    first_name 'John'
    last_name  'Doe'
    email
    password 'kivotal'
    password_confirmation 'kivotal'
  end

end
