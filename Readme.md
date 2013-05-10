# Lapis Implementation for TechEmpower Web Framework Benchmarks

## Setup

You need to install on [lapis](http://leafo.net/lapis/), of course.

```shell
$ moon **.moon
$ lapis server
```

For development, you may want to set `lua_code_cache off` in `nginx.conf`.

### Postgres

Specify your Postgres connection in `config.moon`.

First two tests expect table `World` to exist:

```sql
CREATE TABLE World (id BIGSERIAL PRIMARY KEY, randomNumber INT);
INSERT INTO world VALUES (generate_series(1,10000), (random() * 99999999)::INTEGER);
```

## URLs

1. JSON serialization: `http://localhost:8080/json`
2. Single database query: `http://localhost:8080/db`
3. Multiple database queries: `http://localhost:8080/queries?queries=15`

The original JSON serialization test from openresty is avaiable under `http://localhost:8080/json2`.

Furthermore, `http://localhost:8080/luainfo` display the LuaJIT version used by Openresty (or `false` if you don't use LuaJIT).
