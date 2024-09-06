return {
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
  {"akinsho/toggleterm.nvim", version = "*", config = true},
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- config.lsp.signature.enabled = false,
    opts = {
      --
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
{
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    config = function(_,_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, buffer)
            require("core.utils").load_mappings("lspconfig", { buffer = buffer })
            require("nvchad.signature").setup(client)
          end,
        },
      }
    end
},


},

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
