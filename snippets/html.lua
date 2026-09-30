
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta


local void_tags = {
	area = true, base = true, br = true, col = true,
	embed = true, hr = true, img = true, input = true,
	link = true, meta = true, source = true, track = true, wbr = true,
}

-- function: returns closing tag if not void
local function closing_tag(args, snip)
  local tag = snip.captures[1]
  if void_tags[tag] ~= nil then
    return ""
  else
    return "</" .. tag .. ">"
  end
end


local snippets = {
}


local autosnippets = {
  s({
  	desc = "HTML Tag autoexpand",
  	name = "tag",
    trig = "<(%w+)(.-)>", -- match <tag ...>
    regTrig = true,
    trigEngine =  "pattern",
    snippetType = "autosnippet",
  }, {
    f(function(_, snip) -- reconstruct full opening tag
      return "<" .. snip.captures[1] .. snip.captures[2] .. ">"
    end, {}),
    i(0), -- cursor inside
    f(closing_tag, {}), -- auto closing tag
  }),
}

return snippets, autosnippets
