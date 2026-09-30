require "nvchad.mappings"

--vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--vim.keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
--vim.keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
--vim.keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
--vim.keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Toggles
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
vim.keymap.set("n", "<leader>lh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
vim.keymap.set("n", "<leader>dw", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle diagnostic virtual text" })


-- Windows
vim.keymap.set("n", "<C-L>", "<C-W>w", { desc = "Cycle windows" })
vim.keymap.del("n", "<C-J>")
vim.keymap.del("n", "<C-K>")
-- vim.keymap.set("n", "<Tab>", ":tabn<CR>", { silent = true, desc = "Next tab" })
-- vim.keymap.set('n', '<S-Tab>', ":tabp<CR>", { silent = true, desc = 'Previous tab' })
vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs" } )
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Viewing/screen/scroll
vim.keymap.set("n", "<C-J>", "<C-D>")
vim.keymap.set("n", "<C-K>", "<C-U>")
vim.keymap.set("n", "<C-C>", "z.", { desc = "Center window at cursor"})


-- Luasnip
vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- vim.keymap.set({ "i", "s" }, "<tab>", "<Plug>luasnip-jump-next", {})
vim.keymap.set({ "i", "s" }, "<tab>", function()
	if require("luasnip").jumpable(1) then
		vim.schedule(function() require("luasnip").jump(1) end)
	else
		return "<tab>"
	end
end, { silent = true, nowait = true, desc = "LuaSnip jump, otherwise tab" })

-- term
local term = require "nvchad.term"

vim.keymap.set("t", "<C-x>", "<C-\\><C-N>", { desc = "Term escape terminal mode" })
vim.keymap.set("t", "<A-x>", "<C-\\><C-n>:q<CR>", { desc = "Term close" })

vim.keymap.set({ "n", "t" }, "<A-v>", function()
  term.toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Term toggle vertical split" })

vim.keymap.set({ "n", "t" }, "<A-h>", function()
  term.toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Term toggle horizontal split" })

vim.keymap.set({ "n", "t" }, "<A-t>", function()
  term.toggle { pos = "float", id = "ftoggleTerm" }
end, { desc = "Term toggle float" })

vim.keymap.set({ "n", "t" }, "<C-A-l>", function()
  term.toggle {
    pos = "sp",
    id = "htoggleTermLoc",
    cmd = "cd " .. vim.fn.expand "%:p:h",
  }
end, { desc = "Term toggle horizontal split in buffer location" })

vim.keymap.set({ "n", "t" }, "<A-r>", function()
  vim.cmd("w")
  require("nvchad.term").runner {
    id = "py_runner",
    pos = "float",
    cmd = "python " .. vim.fn.expand("%"),
    clear_cmd = false,
  }
end, { desc = "Run current Python file in vertical split terminal" })


-- diff
-- DiffviewOpen has no CR after to allow adding arg
vim.keymap.set('n', '<leader>df', ":DiffviewOpen ", { desc = 'Diffview: open' })
vim.keymap.set('n', '<leader>dx', ":DiffviewClose<CR>", { desc = 'Diffview: close' })
vim.keymap.set('n', '<leader>dn', ":DiffviewToggleFiles<CR>", { desc = 'Diffview: toggle files' })


-- open config
vim.keymap.set("n", "<leader>cf", function()
  local api = require("nvim-tree.api")
  vim.cmd("cd ~/.config/nvim")           -- change working directory
  api.tree.open()
  api.tree.change_root("~/.config/nvim") -- change tree root
  --api.tree.expand_all("lua")
end, { desc = "Configure nvim" })


-- Disable Arrows
vim.keymap.set('n', '<Left>', ':echo "No left for you!"<CR>', { silent = true })
vim.keymap.set('v', '<Left>', ':<C-u>echo "No left for you!"<CR>', { silent = true })
vim.keymap.set('i', '<Left>', '<C-o>:echo "No left for you!"<CR>', { silent = true })

vim.keymap.set('n', '<Right>', ':echo "No right for you!"<CR>', { silent = true })
vim.keymap.set('v', '<Right>', ':<C-u>echo "No right for you!"<CR>', { silent = true })
vim.keymap.set('i', '<Right>', '<C-o>:echo "No right for you!"<CR>', { silent = true })

vim.keymap.set('n', '<Up>', ':echo "No up for you!"<CR>', { silent = true })
vim.keymap.set('v', '<Up>', ':<C-u>echo "No up for you!"<CR>', { silent = true })
vim.keymap.set('i', '<Up>', '<C-o>:echo "No up for you!"<CR>', { silent = true })

vim.keymap.set('n', '<Down>', ':echo "No down for you!"<CR>', { silent = true })
vim.keymap.set('v', '<Down>', ':<C-u>echo "No down for you!"<CR>', { silent = true })
vim.keymap.set('i', '<Down>', '<C-o>:echo "No down for you!"<CR>', { silent = true })
