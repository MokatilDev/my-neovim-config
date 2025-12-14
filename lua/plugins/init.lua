return {
	{
		"bjarneo/aether.nvim",
		name = "aether",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				-- Monotone shades (base00-base07)
				base00 = "#13131D", -- Default background
				base01 = "#434353", -- Lighter background (status bars)
				base02 = "#13131D", -- Selection background
				base03 = "#eac4cf", -- Comments, invisibles
				base04 = "#f1d8df", -- Dark foreground
				base05 = "#c8c8c8", -- Default foreground
				base06 = "#c8c8c8", -- Light foreground
				base07 = "#a1a2a7", -- Light background

				-- Accent colors (base08-base0F)
				base08 = "#EA90A8", -- Variables, errors, red
				base09 = "#eee4e2", -- Integers, constants, orange
				base0A = "#D18BA2", -- Classes, types, yellow
				base0B = "#a6b2c7", -- Strings, green
				base0C = "#919ab7", -- Support, regex, cyan
				base0D = "#7c7ca8", -- Functions, keywords, blue
				base0E = "#9f859f", -- Keywords, storage, magenta
				base0F = "#e3aebf", -- Deprecated, brown/yellow
			},
		},
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")

			-- Enable hot reload
			require("aether.hotreload").setup()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
  {
    "pmizio/typescript-tools.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      {
        "saghen/blink.cmp",
        lazy = false,
        priority = 1000,
      },
    },
  },

  {
    "razak17/tailwind-fold.nvim",
    opts = {
      min_chars = 50,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  },

  {
    "laytan/tailwind-sorter.nvim",
    cmd = {
      "TailwindSort",
      "TailwindSortOnSaveToggle",
    },
    keys = {
      { "<Leader>cS", "<CMD>TailwindSortOnSaveToggle<CR>", desc = "toggle Tailwind CSS classes sort on save" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
  },

  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },

  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        autotag = {
          enable = true,
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 35,
      },
    },
  },
  {
    "pcolladosoto/tinygo.nvim",
    opts = {},
    ft = { "go" },
  },
  "nvim-lua/plenary.nvim",

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvzone/volt",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "xml",
      "vue",
      "svelte",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
    opts = {
      log_level = vim.log.levels.INFO,
    },
    config = function()
      require("cord").setup {
        display = {
          theme = "atom",
          flavor = "accent",
          swap_fields = true,
        },
        editor = {
          tooltip = "Neovim",
          client = "neovim",
        },
        idle = {
          icon = "https://raw.githubusercontent.com/vyfor/icons/master/icons/atom/accent/keyboard.png",
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
        },
      }
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "ts_ls",
        "emmet_ls",
      },
    },
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
