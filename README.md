Setup
-----

    $ bundle

Then set up your rvmrc (`.rvmrc`):

    # .rvmrc
    rvm use 1.9.3@bundy --create
    source .env

Then set up your environment config file (`.env`):

    # .env
    # Get an API key from: https://code.google.com/apis/console
    export GOOGLE_CLIENT_ID="id here"
    export GOOGLE_SECRET="secret here"

Set up your `config/database.yml` (see the example files). Here's the easiest way:

    $ cp config/database.sqlite config/database.yml

Invoke setup:

    $ rake db:setup

Start development env
---------------------

    $ source .env
    $ rails server

(Sourcing the .env file may not be needed if you use RVM)

Console tips
------------

Run the console on the production environment using:

    $ bundle exec heroku rails console

Here are some common commands:

``` ruby
# File a leave
User.find_by_name("Rico").time_logs.find_or_initialize_by_date("2012/03/15")
_.update_attributes leave_type: "vacation", leave_duration: 0.5
```
