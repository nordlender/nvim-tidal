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

-- "<buffer>", "<nowait>", "<silent>", "<script>", "<expr>" and "<unique>"
-- see :h map-modes
-- modes "" norm vis sel opr, "n" norm, "i" ins, "v" vis and select, 
-- "x" vis, "!" ins and cmd, "s" select, "o" opr, "t" term 
-- ia abbreviation in insert, "ca" abbr. cmdline, !a both

---@alias modeChar
---|"n"|"v"|"x"|"s"|"o"|"i"|"l"|"c"|"t"|"!"
---@alias modeString string @A nonrepeating combination of modeChar letters


---@param mode_str modeString
local map_filter_args = function(mode_str)
	local collapse_v = mode_str:find("v") ~= nil or select(2, mode_str:gsub("[vsx]", "")) > 1
	local has_bang = mode_str:find("!") ~= nil

	local ret = mode_str:gsub("!", "")
	if collapse_v then
		ret = ret:gsub("[vsx]", "") .. "v"
	end
	if has_bang then
		ret = ret:gsub("[ic]", "") .. "ic"
	end
	return ret
end
---@param mode_str modeString
local map_format_modes = function(mode_str)
	local ret = ""
	if #mode_str > 1 then
		ret = "{ "
		mode_str:gsub(".", function(char)
			ret = ret .. string.format("'%s', ", char)
		end)
		ret = ret:gsub(".%s$", " }") -- remove last comma
	else
		ret = string.format("'%s'", mode_str)
	end
	return ret
end

local map_get_modes = function(_, snip)
	local mode_str = ""
	local cmode = snip.captures[1] -- capture modes
	local cbang = snip.captures[3] -- if [map] !
	cmode = (cmode ~= nil and cmode) or ""
	cbang = (cbang ~= nil and cbang) or ""

	if cmode == "" then
		mode_str = (cbang ~= "" and "ic") or "nvo"
	else
		local tmp = ""
		for _, char in ipairs({
			"n", "v", "x", "s", "o", "i", "l", "c", "t", "!"})
		do -- Removes duplicates
			tmp = string.match(cmode, char)
			tmp = tmp ~= nil and tmp or ""
			mode_str = mode_str .. tmp
		end
		mode_str = map_filter_args(mode_str)
	end
	return map_format_modes(mode_str)
end

local snippets = {
}


local autosnippets = {
	s({ trig = "^:([nvxsoilct!]*)(map)([!]?)%s", trigEngine = "pattern", name = ":map",
		desc = ":map to vim.keymap.set dynamic snippet" },
		fmta("vim.keymap.set(<mode>, '<lhs>', <rhs>, { <><><><><><><> })", {
			mode = f(map_get_modes, {}),
			lhs = i(1, "lhs"),
			rhs = i(2),
			c(3, { t(""), t("remap = true, ") }),
			c(4, { t(""), t("silent = true, ") }),
			c(5, { t(""), t("nowait = true, ") }),
			c(6, { t(""), t("expr = true, ")}),
			c(7, { t(""), t("unique = true, ")}),
			c(8, { t(""), sn(nil, {t("buffer = "), i(1, "true"), t(", ")})}),
			c(9, { sn(nil, {t("desc = '"), i(1), t("'")}), t("")}),
		})
	),
}

return snippets, autosnippets
