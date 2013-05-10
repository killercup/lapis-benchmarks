lapis = require "lapis"
math = require "math"
table = require "table"

import Model from require "lapis.db.model"

class World extends Model

class extends lapis.Application
  [test1: "/json"]: =>
    data = message: "Hello, World!"
    json: data

  [test2: "/db"]: =>
    w = World\find id: math.random(1,10000)
    json: w

  [test3: "/queries"]: =>
    queries = tonumber @params.queries
    if queries ~= nil
      queries = 1 if queries < 1
      queries = 500 if queries > 500
    else
      queries = 1

    w = {}
    for i = 1,queries
      w[i] = World\find id: math.random(1,10000)

    json: w
