# README


## Introduction
This is a web application created for the Texas A&M Cultural Awareness and Diversity Expansion Team to keep track of member participation.


## Requirements
This code has been run and tested on:
- Ruby - 3.0.2
- Rails - 6.1.4
- Gems - listed in <code>Gemfile</code>
- PostgreSQL - 13.3
- Yarn - 1.22.4


## External Dependencies
- Docker - https://www.docker.com/products/docker-desktop
- Heroku CLI - https://devcenter.heroku.com/articles/heroku-cli
- Git - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git


## Installation

Download the required Docker container:
<code>docker pull dmartinez05/ruby_rails_postgresql:latest</code>

Make a directory called cadetmembertracker move into it (your code from the github repo goes here):
<code>mkdir cadetmembertracker; cd cadetmembertracker</code>


## Tests

Run the rspec test suite: <code>rspec ./spec</code>

Run the rubocop tests: <code>rubocop</code>

Run the brakeman tests: <code>brakeman</code>


## Execute Code

Run this code in the terminal for mac and in Powershell for windows.

For Mac:
<code>docker run --rm -it --volume "$(pwd):/cadetmembertracker" -e DATABASE_USER=cadet_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest</code>

For Windows:
<code>docker run --rm -it --volume "${PWD}:/cadetmembertracker" -e DATABASE_USER=cadet_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest</code>


In the Docker image, cd to the cadetmembertracker directory:
<code>cd cadetmembertracker</code>

Install all gems:
<code>bundle install</code>

Create the database:
<code>rails db:create</code>

Migrate the database:
<code>rails db:migrate</code>

Install webpacker
<code>rails webpacker:install</code>

Run the server:
<code>rails server --binding=0.0.0.0</code>

Check you browswer:
http://127.0.0.1:3000


## Environmental Variables/Files

Refer to <code>/config/environments/development.rb</code>


## Deployment

Be sure all your code changes are pushed and updated to the test and main branch first.

Now sign in to your heroku dashboard or create an account if needed

Click the "New" button in the top right and select "Create new pipeline"

Fill in the Pipeline name and owner then search for the github repo you are using.

Click "Connect" and then "Create pipeline."

Now that we have created a new pipline, under the Review App section Click "Enable Review Apps" and dont select any options

Click “New app” in Review Apps. Choose the test branch. After you click “Create”, Heroku will start deploying immediately. Every time you make changes to the test branch, it triggers automatic deployment.

To create an app for staging, click under the staging box "Create new app"

Now click on the new staging app and click Deploy using the main branch for Automatic Deploys.

Congrats you now have a deployment pipeling up and running that will update after any new push to the repo.


## CI/CD

Continuous Development is taken care of with our heroku deployment.

Each time the repository is updated. The heroku app will automatically be updated.

## User Support

Manuals are available to the admin throught the application itself.
