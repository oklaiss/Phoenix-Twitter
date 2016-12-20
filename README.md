# Phoenix/Elixir Twitter API Search Client

## Setup
* Visit https://apps.twitter.com/ and add a new application, with callback http://127.0.0.1:4000/auth/twitter/callback. Click create API keys and leave the page open
* Use the API keys from the first step and paste the consumer key/secret and the access token/secret into apps/twitter/config/config.exs AS WELL AS apps/otpserver/config/confix.exs for both the Ueberauth and ExTwitter configs

## Start the Application
* Run `mix deps.get` and `npm install` to install packages for both applications
* Update your database credentials in apps/twitter/config/dev.exs (May not be needed since this application does not use a local DB)
* Run `mix phoenix.server` to start the application and visit to [`localhost:4000`](http://localhost:4000) in your browser

You should now be able to login through Twitter and search topics on twitter. Pressing the "Refresh your query!" button will refresh the results from Twitter.
