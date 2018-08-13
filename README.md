# Kivotal


To run the application on your development machine, you must have ruby installed.

First clone/download the project from here.

Assuming you have Rails environment set up on your machine, go to the project directory in console (Kivotal)
and run these commands:

rake db:migrate
rake db:seed

The above commands will create enough data for you to be able to explore/test the application.

Next run:

rails s 

And start browsing the applicatio through url:  localhost:3000

The application has two major user roles: Manager and Developer

For manager role use following login credentials:

email:     manager@kivotal.com
password:  Kivotal1

For developer role use:

email:    developer@kivotal.com
password: Kivotal1

Note: A manager can un-assign a previously assigned task, in that case the task will still remain referenced to the previous developer for the purpose of maintaining history. 




