return {
  {
    "christoomey/vim-tmux-navigator",
    lazy=false
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {"nvimtools/none-ls-extras.nvim"},
    -- opts = function()
    --   return require "configs.null-ls"
    -- end,
    config = function ()
      require("configs.null-ls")
    end
  },
  {
    "stevearc/dressing.nvim",
    event ="VeryLazy"
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {}
  },
    -- {
  --   "stevearc/conform.nvim",
  --   event = "BufWritePre", -- uncomment for format on save
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "configs.lint"
  --   end,
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require "configs.dap"
  --   end,
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   event = "VeryLazy",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require "dap"
  --     local dapui = require "dapui"
  --     require("dapui").setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
     require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "emmet-ls",
        "svelte-language-server",
        "clangd",
        "clang-format",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "pylint"
      },
    },
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
        "javascript",
        "typescript",
        "tsx",
        "svelte",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
