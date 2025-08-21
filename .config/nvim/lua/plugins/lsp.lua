-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- 1. Mason: LSP, formatter, debugger installer
  {
    "mason-org/mason.nvim",
    version = "^1.0.0" ,
    -- build = ":MasonUpdate", 
    config = function()
      require("mason").setup()
    end,
  },

  -- 2. Mason + LSPConfig bridge
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
        {"mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
      --ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "hls"}, -- auto-install these LSPs
      ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "clangd", "hls"}, -- auto-install these LSPs
      })
    end,
  },

  -- 3. Actual LSP Config plugin
  {
    "neovim/nvim-lspconfig",
    config = function() 
        require("lspconfig").pyright.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                python = {
                    analysis = {
                        autoImportCompletions = true,
                        typeCheckingMode = "basic",
                        diagnosticMode = "openFilesOnly",
                    },
                },
            },
        })
        require("lspconfig").nushell.setup({
            cmd = {
              "nu",
              -- "--config",
              -- vim.env.XDG_CONFIG_HOME .. "/nushell/lsp.nu",
              "--lsp",
            },
        })
      require("lspconfig").clangd.setup({})
      require("lspconfig").hls.setup({})
    end,
  }
}
