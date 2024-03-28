local ne = MiniTest.expect.no_error
local e = MiniTest.expect.error
local child = MiniTest.new_child_neovim()

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      child.restart({ "-u", "tests/init.lua" })
      child.lua([[P = require('charm-freeze')]])
    end,
    -- Stop once all test cases are finished
    post_once = child.stop,
  },
})

-- We need to allow no options to be passed
T["no_options"] = function()
  ne(function()
    child.lua([[P.setup({})]])
  end)
end

-- These are invalid options, errors should be thrown by these
T["invalid_options.string"] = function()
  e(function()
    child.lua([[P.setup({command = 1})]])
  end)
end

T["invalid_options.number"] = function()
  e(function()
    child.lua([[P.setup({line_height = "chesee"})]])
  end)
end

T["invalid_options.boolean"] = function()
  e(function()
    child.lua([[P.setup({line_numbers = "chesee"})]])
  end)
end

T["invalid_options.table"] = function()
  e(function()
    child.lua([[P.setup({border = {1, 2, 3}})]])
  end)
end

T["invalid_options.array"] = function()
  e(function()
    child.lua([[P.setup({padding = { "l" = "something", "r" = "something"}})]])
  end)
end

T["invalid_options.function"] = function()
  e(function()
    child.lua([[P.setup({padding = function() return "./" .. os.date("%Y-%m-%d") .. "_freeze.png" end})]])
  end)
end

T["invalid_options.unknown"] = function()
  e(function()
    child.lua([[P.setup({unknown = 1})]])
  end)
end

-- Check valid options, no errors should be thrown by these
T["vaild_options.string"] = function()
  ne(function()
    child.lua([[P.setup({theme = "charm"})]])
  end)
end

T["valid_options.number"] = function()
  ne(function()
    child.lua([[P.setup({line_height = 1.2})]])
  end)
end

T["valid_options.boolean"] = function()
  ne(function()
    child.lua([[P.setup({line_numbers = false})]])
  end)
end

T["valid_options.array"] = function()
  ne(function()
    child.lua([[P.setup({padding = {20, 40, 20, 20}})]])
  end)
end

T["valid_options.table"] = function()
  ne(function()
    child.lua([[P.setup({border = {radius = 8}})]])
  end)
end

T["valid_options.function"] = function()
  ne(function()
    child.lua([[P.setup({output = function() return "./" .. os.date("%Y-%m-%d") .. "_freeze.png" end})]])
  end)
end

return T
