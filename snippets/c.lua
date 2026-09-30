local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta

-- "<buffer>", "<nowait>", "<silent>", "<script>", "<expr>" and "<unique>"
-- see :h map-modes
-- modes "" norm vis sel opr, "n" norm, "i" ins, "v" vis and select,
-- "x" vis, "!" ins and cmd, "s" select, "o" opr, "t" term
-- ia abbreviation in insert, "ca" abbr. cmdline, !a both

local snippets = {
  s(
    "@dox",
    fmta(
      [[
/**
 * @brief <>
 *
 * <>
 *
 * @param <> <>
 * @return <>
 */
<>
]],
      {
        i(1, "Brief description"),
        i(2, "Detailed description"),
        i(3, "param"),
        i(4, "Parameter description"),
        i(5, "Return description"),
        i(0),
      }
    )
  ),

  s(
    "@doxfile",
    fmta(
      [[
/**
 * @file <>
 * @brief <>
 *
 * <>
 *
 * @author <>
 * @date <>
 */
<>
]],
      {
        f(function()
          return vim.fn.expand "%:t"
        end),
        i(1, "File description"),
        i(2, "Detailed file description"),
        i(3, "Your Name"),
        f(function()
          return os.date "%Y-%m-%d"
        end),
        i(0),
      }
    )
  ),
}

local autosnippets = {}

return snippets, autosnippets
