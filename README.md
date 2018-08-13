# Kivotal

Kivotal is a project-tracking application developed using ruby on rails.

To run the application on your development machine, you must have the rails environment set up. No need to install any database as a sqllite instance is there in the application directory itself.

First clone/download the project from here.

Then go to the project directory in console (Kivotal) and run these commands:

rake db:migrate

rake db:seed

The above commands will create enough data for you to be able to explore/test the application. Next run:

rails s 

You can start browsing the application through url:  localhost:3000

The application has two major user roles: Manager and Developer

For manager role use the following login credentials:

email:     manager@kivotal.com

password:  Kivotal1

And for developer role:

email:    developer@kivotal.com

password: Kivotal1

Note: A manager can un-assign a previously assigned task, in that case the task will still remain referenced to the previous developer for the purpose of maintaining history. 




