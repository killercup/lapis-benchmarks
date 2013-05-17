local lapis = require("lapis")
local math = require("math")
local table = require("table")
local Model
do
  local _table_0 = require("lapis.db.model")
  Model = _table_0.Model
end
local World
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  if _parent_0 then
    setmetatable(_base_0, _parent_0.__base)
  end
  local _class_0 = setmetatable({
    __init = function(self, ...)
      if _parent_0 then
        return _parent_0.__init(self, ...)
      end
    end,
    __base = _base_0,
    __name = "World",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil and _parent_0 then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0 and _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  World = _class_0
end
local Fortune
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  if _parent_0 then
    setmetatable(_base_0, _parent_0.__base)
  end
  local _class_0 = setmetatable({
    __init = function(self, ...)
      if _parent_0 then
        return _parent_0.__init(self, ...)
      end
    end,
    __base = _base_0,
    __name = "Fortune",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil and _parent_0 then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0 and _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Fortune = _class_0
end
do
  local _parent_0 = lapis.Application
  local _base_0 = {
    [{
      test1 = "/json"
    }] = function(self)
      local data = {
        message = "Hello, World!"
      }
      return {
        json = data
      }
    end,
    [{
      test2 = "/db"
    }] = function(self)
      local w = World:find({
        id = math.random(1, 10000)
      })
      return {
        json = w
      }
    end,
    [{
      test3 = "/queries"
    }] = function(self)
      local queries = tonumber(self.params.queries)
      if queries ~= nil then
        if queries < 1 then
          queries = 1
        end
        if queries > 500 then
          queries = 500
        end
      else
        queries = 1
      end
      local w = { }
      for i = 1, queries do
        w[i] = World:find({
          id = math.random(1, 10000)
        })
      end
      return {
        json = w
      }
    end,
    [{
      test4 = "/fortunes"
    }] = function(self)
      self.page_title = "Fortunes"
      local db = require("lapis.db")
      local fortunes, err = Fortune:select("*")
      table.insert(fortunes, {
        id = -1,
        message = "The answer, of course, is 42."
      })
      table.sort(fortunes, (function(a, b)
        return a.message < b.message
      end))
      if self.params.json then
        return {
          json = fortunes
        }
      end
      return self:html(function()
        h1("Fortunes")
        return element("table", function()
          element("tr", function()
            element("th", "ID")
            return element("th", "Message")
          end)
          for i, f in pairs(fortunes) do
            element("tr", function()
              element("td", f.id)
              return element("td", f.message)
            end)
          end
        end)
      end)
    end,
    [{
      test5 = "/updates"
    }] = function(self)
      local queries = tonumber(self.params.queries)
      if queries ~= nil then
        if queries < 1 then
          queries = 1
        end
        if queries > 500 then
          queries = 500
        end
      else
        queries = 1
      end
      local w = { }
      for i = 1, queries do
        w[i] = World:find({
          id = math.random(1, 10000)
        })
        w[i]:update({
          randomnumber = math.random(1, 10000)
        })
      end
      return {
        json = w
      }
    end
  }
  _base_0.__index = _base_0
  if _parent_0 then
    setmetatable(_base_0, _parent_0.__base)
  end
  local _class_0 = setmetatable({
    __init = function(self, ...)
      if _parent_0 then
        return _parent_0.__init(self, ...)
      end
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil and _parent_0 then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0 and _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
