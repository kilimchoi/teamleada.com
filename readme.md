# Website for TeamLeada.com

For more comprehensive docs, go [here.](http://docs.teamleada.com)

## Setup

First, make a file for your environment variables:

    touch config/initializers/_environment_variables.rb

We're using Devise so you should set `ENV['SECRET_KEY']` in the `_environment_variables.rb` file.

Copy over the `database.yml` file from `config/sample/database.yml` to `config/database.yml`:

    cp config/sample/database.yml config/database.yml

If you don't have postgres installed, install it now:

    brew install postgres

Create the database using:

    rake db:create

Migrate the database:

    rake db:migrate

To seed the database, we have a rake task that loads users specifically for development purposes only.

    rake db:seed

Start the server:

    rails s

Happy developing!

## Setting up the Scripts subtree

    git remote add scripts git@github.com:teamleada/scripts.git
    git subtree add --prefix=scripts scripts master

## Image Processing

You're going to have to install Imagemagick and Redis:

    brew install pkgconfig #in case imagemagick doesn't work on os X
    brew install imagemagickb
    brew install redis

## Redis on AWS

Install redis on ubuntu via:

    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    make
    sudo make install

In `redis.conf`, enable "daemonize yes". Then run:

    redis-server &

## Background jobs

To start Sidekiq, run the command from the project root directory (and make sure redis is running):

    sidekiq -d -L sidekiq.log -q uploads

## Install Nginx

To install nginx on Ubuntu, run the following:

    sudo apt-get install nginx
    sudo service nginx start
    ifconfig eth0 | grep inet | awk '{ print $2 }'
    update-rc.d nginx defaults

The last comand might yield a stdout return message stating that it already exists.

Then head to */etc/nginx/sites-available* and append the following

    server {
        listen 80;
        server_name beta-dev.teamleada.com;
        location / {
                proxy_pass http://localhost:3000/;
                proxy_redirect off;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
        }
    }

Lastly, add `localhost` and the `domain name` to */etc/hosts*

    127.0.0.1 beta-dev.teamleada.com

If you get a bad gateway, make sure rails is running. if nothing is rendering, it's not rerouting, make sure to restart nginx after you reconfigure via:

    sudo nginx -s stop
    sudo nginx

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

## Backup Database and Restore Locally

    heroku pgbackups:capture --app teamleada
    curl -o latest.dump `heroku pgbackups:url --app teamleada`

Then, we have to set up our local database to include any new changes you might have made:

    rake db:drop
    rake db:create

    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U mark -d teada_development latest.dump

    rake db:migrate
    rake db:seed

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
    LINKEDIN_ID
    LINKEDIN_SECRET

