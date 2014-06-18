# Website for TeamLeada.com

## Setup

First, make a file for your environment variables:

    touch config/initializers/_environment_variables.rb

We're using Devise so you should set `ENV['SECRET_KEY']` in the `_environment_variables.rb` file.

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

## Live Reload

We are currently using `livereload` so that when you edit views and assets, they are automatically updated on the web browser (no refreshing anymore).
To use this, download the chome extension [here](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)

To use, simply have two terminal windows open. In one window, run `guard` and in the other, run the normal `rails s`

## Heroku Deployment

There's a file, `/config/initializers/_environment_variables.rb`, which contains environment variables (mostly keys) that are not safe to upload to GitHub (added to .gitignore) so if you create this file, you can set your environment variables here easily.
For example:

    ENV['SECRET_KEY'] = 'secret-password'

Since we use Git to deploy to Heroku, this file won't be included, so you'll have to set the environment variables manually, and this can be done just once. The equivalent of the above on Heroku is:

    heroku config:set SECRET_KEY=secret-password

## Current Deployments at:
* [Production](http://teamleada.com)
* [Deployment Main](http://teamleada-stage.herokuapp.com)
* [Deployment (t)](http://teamleada-stage-t.herokuapp.com)
* [Deployment (b)](http://teamleada-stage-b.herokuapp.com)
* [Deployment (m)](http://teamleada-stage-m.herokuapp.com)

## To clear the db (be careful):

    heroku pg:reset DATABASE --app teamleada-stage
    heroku run rake db:setup --app teamleada-stage

## Environment Variables

The following environment variables need to be set:

    SECRET_KEY
    STRIPE_SECRET_KEY
    STRIPE_PUBLISHABLE_KEY
    NOREPLY_EMAIL
    NOREPLY_PASSWORD
    HOST
    GA_TRACKER
    S3_BUCKET_NAME
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY

