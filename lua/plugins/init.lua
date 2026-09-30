return {

	{
		"https://codeberg.org/MrReason/tidal.nvim",
		opts = require "configs.tidal",
		-- Recommended: Install TreeSitter parsers for Haskell 
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = { ensure_installed = { "haskell" } },
		},
	},
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink, this is normally done with
  -- { import = "nvchad.blink.lazyspec" },
  -- but this is simply copied from there
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    dependencies = {
      "rafamadriz/friendly-snippets",

      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
          end,
        },
        opts = {
          history = true,
          updateevents = "TextChanged,TextChangedI",
          enable_autosnippets = true,
        },
        config = function(_, opts)
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
        build = "make install_jsregexp",
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      },
    },

    opts_extend = { "sources.default" },

    opts = function()
      return require "configs.blink"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
    branch = "main",
  },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --   	{"rafamadriz/friendly-snippets",
  --   	config = function()
  -- 		require("luasnip.loaders.from_vscode").lazy_load()
  -- 		-- require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
  --   	end,
  --   	}
  --   },
  --   event = { "InsertEnter" },
  --   opts = {
  --   	history = true, updateevents = "TextChanged,TextChangedI",
  --   	enable_autosnippets = true,
  --   },
  --   config = function(_, opts)
  --     require("luasnip").config.set_config(opts)
  --     require "nvchad.configs.luasnip"
  --   end,
  --   build = "make install_jsregexp"
  -- },
}
