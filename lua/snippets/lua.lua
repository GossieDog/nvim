local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {

	-- ── Functions ─────────────────────────────────────────────────────────────

	-- local function
	s(
		"lf",
		fmt(
			[[
    local function {}({})
      {}
    end
  ]],
			{ i(1, "name"), i(2), i(3) }
		)
	),

	-- function (anonymous, assigned)
	s(
		"fn",
		fmt(
			[[
    local {} = function({})
      {}
    end
  ]],
			{ i(1, "name"), i(2), i(3) }
		)
	),

	-- method (colon syntax)
	s(
		"mf",
		fmt(
			[[
    function {}:{}({})
      {}
    end
  ]],
			{ i(1, "ClassName"), i(2, "method"), i(3), i(4) }
		)
	),

	-- return function (anonymous, inline)
	s(
		"rf",
		fmt(
			[[
    return function({})
      {}
    end
  ]],
			{ i(1), i(2) }
		)
	),

	-- ── Control Flow ──────────────────────────────────────────────────────────

	-- if
	s(
		"if",
		fmt(
			[[
    if {} then
      {}
    end
  ]],
			{ i(1, "cond"), i(2) }
		)
	),

	-- if/else
	s(
		"ife",
		fmt(
			[[
    if {} then
      {}
    else
      {}
    end
  ]],
			{ i(1, "cond"), i(2), i(3) }
		)
	),

	-- if/elseif/else
	s(
		"ifeie",
		fmt(
			[[
    if {} then
      {}
    elseif {} then
      {}
    else
      {}
    end
  ]],
			{ i(1, "cond"), i(2), i(3, "cond2"), i(4), i(5) }
		)
	),

	-- ── Loops ─────────────────────────────────────────────────────────────────

	-- numeric for
	s(
		"fori",
		fmt(
			[[
    for {} = {}, {} do
      {}
    end
  ]],
			{ i(1, "i"), i(2, "1"), i(3, "10"), i(4) }
		)
	),

	-- generic for (ipairs)
	s(
		"forin",
		fmt(
			[[
    for {}, {} in ipairs({}) do
      {}
    end
  ]],
			{ i(1, "i"), i(2, "v"), i(3, "tbl"), i(4) }
		)
	),

	-- generic for (pairs)
	s(
		"forp",
		fmt(
			[[
    for {}, {} in pairs({}) do
      {}
    end
  ]],
			{ i(1, "k"), i(2, "v"), i(3, "tbl"), i(4) }
		)
	),

	-- while
	s(
		"wh",
		fmt(
			[[
    while {} do
      {}
    end
  ]],
			{ i(1, "cond"), i(2) }
		)
	),

	-- repeat/until
	s(
		"ru",
		fmt(
			[[
    repeat
      {}
    until {}
  ]],
			{ i(1), i(2, "cond") }
		)
	),

	-- ── Tables ────────────────────────────────────────────────────────────────

	-- local table
	s(
		"lt",
		fmt(
			[[
    local {} = {{
      {}
    }}
  ]],
			{ i(1, "tbl"), i(2) }
		)
	),

	-- table.insert
	s(
		"ti",
		fmt(
			[[
    table.insert({}, {})
  ]],
			{ i(1, "tbl"), i(2, "val") }
		)
	),

	-- table.remove
	s(
		"tr",
		fmt(
			[[
    table.remove({}, {})
  ]],
			{ i(1, "tbl"), i(2, "idx") }
		)
	),

	-- ── OOP / Metatables ──────────────────────────────────────────────────────

	-- class boilerplate
	s(
		"class",
		fmt(
			[[
    local {} = {{}}
    {}.__index = {}

    function {}.new({})
      local self = setmetatable({{}}, {})
      {}
      return self
    end

    return {}
  ]],
			{
				i(1, "ClassName"),
				rep(1),
				rep(1), -- .__index =
				rep(1),
				i(2), -- .new(args)
				rep(1), -- setmetatable
				i(3), -- constructor body
				rep(1), -- return
			}
		)
	),

	-- ── Error Handling ────────────────────────────────────────────────────────

	-- pcall
	s(
		"pc",
		fmt(
			[[
    local {}, {} = pcall(function()
      {}
    end)
    if not {} then
      {}
    end
  ]],
			{ i(1, "ok"), i(2, "err"), i(3), rep(1), i(4) }
		)
	),

	-- xpcall
	s(
		"xpc",
		fmt(
			[[
    local {} = xpcall(function()
      {}
    end, function(err)
      {}
    end)
  ]],
			{ i(1, "ok"), i(2), i(3, "print(debug.traceback(err))") }
		)
	),

	-- ── Modules ───────────────────────────────────────────────────────────────

	-- module skeleton
	s(
		"mod",
		fmt(
			[[
    local M = {{}}

    {}

    return M
  ]],
			{ i(1) }
		)
	),

	-- require
	s(
		"req",
		fmt(
			[[
    local {} = require("{}")
  ]],
			{ i(1, "mod"), i(2) }
		)
	),

	-- ── Misc ──────────────────────────────────────────────────────────────────

	-- print
	s("pr", fmt([[print({})]], { i(1) })),

	-- string.format print
	s("prf", fmt([[print(string.format("{}", {}))]], { i(1, "%s"), i(2) })),

	-- local variable
	s("lv", fmt([[local {} = {}]], { i(1, "name"), i(2) })),

	-- assert
	s("as", fmt([[assert({}, "{}")]], { i(1, "cond"), i(2, "error message") })),

	-- type check guard
	s(
		"tc",
		fmt(
			[[
    if type({}) ~= "{}" then
      error(string.format("expected {}, got %s", type({})))
    end
  ]],
			{ i(1, "val"), i(2, "string"), rep(2), rep(1) }
		)
	),

	-- ternary idiom
	s(
		"ter",
		fmt(
			[[
    local {} = {} and {} or {}
  ]],
			{ i(1, "result"), i(2, "cond"), i(3, "trueval"), i(4, "falseval") }
		)
	),
}
