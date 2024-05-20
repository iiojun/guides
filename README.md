# GUIDES: The General and Universal Image Data Evaluation System

## Installation
Prepare ruby 3.2.2, rails 7.0.8, and bundler 2.4.15 with SQLite3 database to implement this system.

You can use the system by following simple steps: 
1. git clone,
2. bundle update,
3. create a database and execute the database migration,
4. add 'config.hosts << "__your domain__"' to config/environments/development.rb, and
5. start the server with bin/rails server.

## How to use
Firstly, register your account using the sign-up function by clicking the 'person-add' icon at the upper right corner.

After logging in to the system, you can create your project to design your evaluation project with a bunch of images and two-dimensional measurements.
When you launch an experiment, six randomly selected images with two sliders appear on the screen.
The result page shows the differences between your and others' average scores.

It would be a good idea to deploy this system on your server running with Apache web server using Phusion Passenger to publish online.

Have fun!

## References
1. Hanagaki, T. and Iio, J., (2023) [Emotional Evaluation of Movie Posters](https://www.esociety-conf.org/wp-content/uploads/2023/03/2_ES2023_S_046_Hanagaki.pdf), *The 21st International Conference on e-Society (ES2023),* pp. 428-431, Lisbon, Portugal.
