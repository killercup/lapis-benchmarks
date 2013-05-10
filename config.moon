import config from require "lapis.config"

config "development", ->
  port 8080
  postgresql_url "postgres://pascal:@127.0.0.1/techempower"
