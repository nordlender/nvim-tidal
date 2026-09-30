local chad = require("nvchad.configs.lspconfig")

-- copy of nvchad.config.lspconfig.defaults()
dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    chad.on_attach(_, args.buf)
  end,
})

local lua_lsp_settings = {
  Lua = {
    runtime = { version = "LuaJIT" },
    workspace = {
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        "${3rd}/luv/library",
      },
    },
  },
}

-- Support 0.10 temporarily

if vim.lsp.config then
  vim.lsp.config("*", { capabilities = chad.capabilities, on_init = chad.on_init })
  vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
  vim.lsp.enable "lua_ls"
else
  require("lspconfig").lua_ls.setup {
    capabilities = chad.capabilities,
    on_init = chad.on_init,
    settings = lua_lsp_settings,
  }
end

local serverlist = {}
local servers = {
	html = {
		settings = {
			html = {
				format = { enable = true, wrapLineLength = 100 },
			},
		},
	},
	cssls = {
		settings = {
			css = { validate = true, lint = { unknownAtRules = "ignore" } },
			scss = { validate = true },
			less = { validate = true },
		},
	},
	ruff = {
		init_options = {
			settings = {
				-- reads pyproject.toml / ruff.toml automatically, override here if needed
				-- lineLength = 88,
			},
		},
	},
	pyright = {
		settings = {
			pyright = {
				-- let ruff own import sorting so they don't fight each other
				disableOrganizeImports = true,
			},
			python = {
				analysis = { typeCheckingMode = "basic" },
				venvPath = "./.venv/",
			},
		},
	},
	ts_ls = {

	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
	},
	jsonls = {
		settings = {
			json = {
				validate = { enable = true },
				format = { enable = true },
			}
		}
	}
}

for server, settings in pairs(servers) do
	vim.lsp.config(server, { settings = settings })
	table.insert(serverlist, server)
end

vim.lsp.enable(serverlist)
