# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#creating roles
Role.find_or_create_by(name: :manager)
Role.find_or_create_by(name: :developer)

#creating users with roles
user1 = User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'manager@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1')
user1.remove_role(:developer)
user1.add_role(:manager)

user2 = User.create(first_name: 'Calum',
                    last_name: 'Terry',
                    email: 'developer@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1')
user2.add_role(:developer)

