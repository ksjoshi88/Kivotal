# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#creating roles
#
puts 'Creating seed data...'

Role.find_or_create_by(name: :manager)
Role.find_or_create_by(name: :developer)

print '.'

#creating users
user1 = User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'manager@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1',
                    as_manager: "1")

user2 = User.create(first_name: 'Calum',
                    last_name: 'Terry',
                    email: 'developer@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1',
                    as_manager: "0")
user3 = User.create(first_name: 'Milos',
                    last_name: 'Forman',
                    email: 'developer1@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1',
                    as_manager: "0")
user4 = User.create(first_name: 'Tim',
                    last_name: 'Albaugh',
                    email: 'developer2@kivotal.com',
                    password: 'Kivotal1',
                    password_confirmation: 'Kivotal1',
                    as_manager: "0")

developer_ids  = User.developers.pluck(:id)

print('.....')


#create some projects
Project.create(title: 'E-Rational', manager_id: user1.id)
Project.create(title: 'TSquare', manager_id: user1.id)
Project.create(title: 'Roman Camps', manager_id: user1.id)
Project.create(title: 'NCERT', manager_id: user1.id)

print '....'

project_ids = Project.all.pluck(:id)

#create tasks

todos = ["Create React modules", "Complete requirement analysis", "Test the consistancy", "Document errors", "Write unit test cases", "Complete integration testing", "Run deployment cycles"]
statuses = [0,1,2,3]
Project.all.each do |project|
    3.times do
      sample_status = statuses.sample
      if sample_status == 0
        Task.create(todo: todos.sample, status: sample_status, project_id: project.id, developer_id: nil)
      else
        Task.create(todo: todos.sample, status: sample_status, project_id: project.id, developer_id: developer_ids.sample)
      end
      print '.'
    end
end

puts 'Finished with creation of seed data.'







