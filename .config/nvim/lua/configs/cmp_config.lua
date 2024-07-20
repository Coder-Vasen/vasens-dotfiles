return {
  "hrsh7th/nvim-cmp",
  config = function(_, opts)
  
    local luasnip = require "luasnip"
    local cmp = require "cmp"
    local lspkind = require "lspkind"

    opts.window = {
      completion = {
        border = "rounded",
      },
      documentation = cmp.config.window.bordered(),
    }

    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
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
      ["<C-y"] = cmp.mapping.confirm { select = true },
      ["<CR>"] = cmp.config.disable,
      ["<C-l>"] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item()
    })

    table.insert(opts.snippet, {name = "luasnip"})

    opts.formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = {
          copilot = "[copilot]",
          nvim_lsp = "[LSP]",
          luasnip = "[snip]",
          path = "[path]",
          buffer = "[buf]",

        }
      })
    }

    opts.experimental = {
      ghost_text = true,
    }

    cmp.setup(opts)
  end,
}
