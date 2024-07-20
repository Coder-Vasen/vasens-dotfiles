return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    -- opts = function()
    --   return require "configs.null-ls"
    -- end,
    config = function()
      require "configs.null-ls"
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  -- {
  --   "folke/todo-comments.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
  {
    "hrsh7th/nvim-cmp",
    -- config = function(_, opts)
    --   local cmp = require "cmpr
    --   opts.sources = {
    --     { name = "nvim_lsp" },
    --     { name = "luasnip" },
    --     { name = "copilot" },
    --     { name = "buffer" },
    --     { name = "nvim_lua" },
    --     { name = "path" },
    --   }
    --
    --   opts.mapping = cmp.mapping.preset.insert {
    --     ["<CR>"] = cmp.config.disable,
    --     ["<C-Space>"] = cmp.mapping.close(),
    --     ["<C-j>"] = cmp.mapping.select_next_item(),
    --     ["<C-k>"] = cmp.mapping.select_prev_item(),
    --     -- ["<S-Space>"] = cmp.mapping.close()
    --   }
    --   cmp.setup(opts)
    -- end,
    config = function(_, opts)
      local luasnip = require "luasnip"
      local cmp = require "cmp"
      -- local lspkind = require "lspkind"

      opts.window = {
        completion = {
          border = "rounded",
        },
        documentation = cmp.config.window.bordered(),
      }

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.sources = {
        { name = "copilot" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "luasnip", keyword_length = 2 },
        { name = "path" },
        { name = "buffer" },
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<CR>"]=cmp.config.disable,
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-;>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = false
        },
        -- ["<C-l>"] = cmp.mapping(function()
        --   if luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   end
        -- end, { "i", "s" }),
        -- ["<C-h>"] = cmp.mapping(function()
        --   if luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   end
        -- end, { "i", "s" }),
        ["<C-CR>"] = cmp.mapping.confirm { select = false },
        ["<S-CR>"] = cmp.mapping.confirm {select = true},

        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
      })

      table.insert(opts.snippet, { name = "luasnip" }) -- opts.formatting = {
      --   format = lspkind.cmp_format {
      --     with_text = true,
      --     menu = {
      --       copilot = "[copilot]",
      --       nvim_lsp = "[LSP]",
      --       luasnip = "[snip]",
      --       path = "[path]",
      --       buffer = "[buf]",
      --     },
      --   },
      -- }

      opts.experimental = {
        ghost_text = true,
      }

      cmp.setup(opts)
    end,
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
    "mfussenegger/nvim-jdtls",
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
        "pylint",
        "jdtls",
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
