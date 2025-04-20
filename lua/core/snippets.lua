local ok, ls = pcall(require, "luasnip")
if not ok then
  vim.notify("LuaSnip not found! Run :Lazy sync", vim.log.levels.ERROR)
  return
end
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Helper to return Go imports
local go_imports = function()
	return t({ 'import "', i(1, 'package'), '"' })
end

-- Snippet Definitions
local go_snippets = {
	-- Struct definition
	s("struct", fmt([[
  type {} struct {{
      {}
  }}
  ]], { i(1, "MyStruct"), i(2) })),

	-- Method receiver
	s("meth", fmt([[
  func ({}) {}({}) {} {{
      {}
  }}
  ]], { i(1, "t *Type"), i(2, "MethodName"), i(3, "args"), i(4, "returnType"), i(5) })),

	-- Error handling
	s("err", fmt([[
  if err != nil {{
      return {}
  }}
  ]], { i(1, "err") })),
}

-- Register snippets
ls.add_snippets("go", go_snippets)
