heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
touch Procfile
echo "web: MIX_ENV=prod mix phx.server" > Procfile
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set POOL_SIZE=18
heroku config:set SECRET_KEY_BASE="JzUeN1bcHKkStxg6sFkyhj0Vur6usEEHdV4sXCeZTNr2A2QSFzSG04MKZPw0QLx0"
heroku config:set GUARDIAN_KEY="GvrDVE5bmhyfyu509+B0BPQXtmXnqOlWweaP8df9MN+KhJ3lR5JoC5jrc0MdIFhp"
heroku run "POOL_SIZE=2 mix ecto.migrate"

heroku config:set S3_BUCKET="aaa"
heroku config:set AWS_ACCESS_KEY="aaa"
heroku config:set AWS_SECRET_KEY="aaa"
