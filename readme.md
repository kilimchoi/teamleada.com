# Website for TeamLeada.com

## Setup

First, make a file for your environment variables:

    touch config/initializers/_environment_variables.rb

We're using Devise so you should set `Devise.secret_key` in the `environment_variables.rb` file.

Copy over the `database.yml` file from `config/sample/database.yml` to `config/database.yml`:

    cp config/sample/database.yml config/database.yml

Create the database using:

    rake db:create

Migrate the database:

    rake db:migrate

To seed the database, we have a rake task that loads users specifically for development purposes only.

    rake db:seed

Start the server:

    rails s

Happy developing!

## Heroku Deployment

There's a file, `/config/initializers/_environment_variables.rb`, which contains environment variables (mostly keys) that are not safe to upload to GitHub (added to .gitignore) so if you create this file, you can set your environment variables here easily.
For example:

    ENV['SECRET_KEY'] = 'secret-password'

Since we use Git to deploy to Heroku, this file won't be included, so you'll have to set the environment variables manually, and this can be done just once. The equivalent of the above on Heroku is:

    heroku config:set SECRET_KEY=secret-password

## Current Deployments at:
<a href="http://teamleada-stage.herokuapp.com" title="Deployment 1">Deployment 1</a>

<a href="http://teamleada-stage-t.herokuapp.com" title="Deployment 2">Deployment 2</a>
