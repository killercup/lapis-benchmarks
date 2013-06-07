# Lapis Implementation for TechEmpower Web Framework Benchmarks

## Setup

You need to install [lapis](http://leafo.net/lapis/), of course.

```sh
$ moon **.moon
$ lapis server
```

For development, you may want to set `lua_code_cache off` in `nginx.conf`.

### Postgres

Specify your Postgres connection in `config.moon`.

Load inital DB content with `psql techempower < create-postgres.sql` (assuming your DB is called 'techempower').

## URLs

1. JSON serialization: `http://localhost:8080/json`
2. Single database query: `http://localhost:8080/db`
3. Multiple database queries: `http://localhost:8080/queries?queries=15`
4. Fortunes: `http://localhost:8080/fortunes`
5. Database updates: `http://localhost:8080/updates?queries=6`
6. Plaintext: `http://localhost:8080/plaintext`

## VS. Plain OpenResty

Test 1: The original JSON serialization test from openresty is avaiable under `http://localhost:8080/json2`.

Test 6: The plaintext test implemented with `content_by_lua` (in the nginx config) is available at `http://localhost:8080/plaintext2`.

Furthermore, `http://localhost:8080/luainfo` display the LuaJIT version used by Openresty (or `false` if you don't use LuaJIT).
