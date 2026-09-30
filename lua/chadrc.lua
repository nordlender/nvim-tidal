-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  -- bearded-arc solarized_osaka flexoki everblush kanagawa
  -- gatekeeper hiberbee rosepine tokyodark

  -- hl_override = vim.tbl_deep_extend("force",
  --   hl_override_map[M.base46.theme],
  --   {
  --     -- Enter global override here
  --     Comments = { italic = true, },
  --   }
  -- ),

  hl_add = {
	-- TabLineFill = { link = "St_cwd_txt" },
	-- TabLineSel = { link = "St_cwd_bg" },
	-- TabLine = { link = "St_cwd_txt" },
    -- note to self :verbose hi yields more output
    Win0 =     { fg = "statusline_bg", bg = "#ff797c" }, -- #8b39ba
    Win1 =     { fg = "statusline_bg", bg = "#ffd35f" },
    Win2 =     { fg = "statusline_bg", bg = "#a1d34e" },
    Win3 =     { fg = "statusline_bg", bg = "#469acf" },
    Win4 =     { fg = "statusline_bg", bg = "#876da8" },
    Win5 =     { fg = "statusline_bg", bg = "#6da97e" },
    Win6 =     { fg = "statusline_bg", bg = "#42d4f4" },
    Win7 =     { fg = "statusline_bg", bg = "#e282c8" },
    Win0sep =  { fg = "#ff797c", bg = "statusline_bg" }, -- #8b39ba
    Win1sep =  { fg = "#ffd35f", bg = "statusline_bg" }, --
    Win2sep =  { fg = "#a1d34e", bg = "statusline_bg" },
    Win3sep =  { fg = "#469acf", bg = "statusline_bg" },
    Win4sep =  { fg = "#876da8", bg = "statusline_bg" },
    Win5sep =  { fg = "#6da97e", bg = "statusline_bg" },
    Win6sep =  { fg = "#42d4f4", bg = "statusline_bg" },
    Win7sep =  { fg = "#e282c8", bg = "statusline_bg" },
    Win0txt =  { fg = "#ff797c", bg = "one_bg" }, -- #8b39ba
    Win1txt =  { fg = "#ffd35f", bg = "one_bg" }, --
    Win2txt =  { fg = "#a1d34e", bg = "one_bg" },
    Win3txt =  { fg = "#469acf", bg = "one_bg" },
    Win4txt =  { fg = "#876da8", bg = "one_bg" },
    Win5txt =  { fg = "#6da97e", bg = "one_bg" },
    Win6txt =  { fg = "#42d4f4", bg = "one_bg" },
    Win7txt =  { fg = "#e282c8", bg = "one_bg" },
  },
}

M.nvdash = { load_on_startup = true }

M.ui = {
  tabufline = {
    enabled = true,
  },
  cmp = {
    style = "default",
    icons = true,
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  telescope = {
    style = "bordered",
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual

  -- for the  devs:  󰙱 󰓠 󰿗 󰱫
  -- for the dude:     
  -- for the french:   󰼾  󰡔  󰟈 󰊨
  -- for the italians:  󰡶
  -- for americans:   󰗏  󱥗󰞪 󰾆 󰾅 󰓅   󰚏 󰺛 󰜃    󰱱  
  --                    󱐚 󰴺  
  -- for zuck:  󰆘
  -- for the muslims: 󰥹     󱠫 󱀆
  -- btw 
  -- for the windows users:    󰜃 󰱬
  -- for the webdevs:   󱖁 󱙷
  -- for the zyn addicts:  
  --  lightning poo (icon is called poo-storm lol)
  --
  -- single glyph:            󰓛 󰹞  󱪽  󰅁  󰣏  
  -- double (space after): 󰙴 󰄛            
  --     󱓻               󰪥 
  -- 
  --my faves: 󰣏 
  virt_text = "󰣏",
  highlight = { hex = true, lspvars = true },
}

M.lsp = {
  signature = true,
}

M.term = {
  float = {
    border = "rounded",
    height = 0.5,
    width = 0.58,
    col = 0.2,
    row = 0.2,
  },
  sizes = {},
}

return M
