local config
do
  local _table_0 = require("lapis.config")
  config = _table_0.config
end
return config("development", function()
  port(8080)
  return postgresql_url("postgres://pascal:@127.0.0.1/techempower")
end)
