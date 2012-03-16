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
