lapis = require "lapis"
math = require "math"
table = require "table"

import Model from require "lapis.db.model"

class World extends Model
class Fortune extends Model

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

  [test4: "/fortunes"]: =>
    @page_title = "Fortunes"
    db = require "lapis.db"
    fortunes, err = Fortune\select "*"

    table.insert fortunes, id: -1, message: "The answer, of course, is 42."
    table.sort fortunes, ((a,b) -> a.message < b.message)

    if @params.json
      return json: fortunes

    return @html ->
      h1 "Fortunes"
      element "table", ->
        element "tr", ->
          element "th", "ID"
          element "th", "Message"
        for i,f in pairs(fortunes)
          element "tr", ->
            element "td", f.id
            element "td", f.message

  [test5: "/updates"]: =>
    queries = tonumber @params.queries
    if queries ~= nil
      queries = 1 if queries < 1
      queries = 500 if queries > 500
    else
      queries = 1

    w = {}
    -- w = World\select "id = random() * 10000 LIMIT ?", queries
    for i = 1,queries
      w[i] = World\find id: math.random(1,10000)
      w[i]\update randomnumber: math.random(1,10000)

    json: w
