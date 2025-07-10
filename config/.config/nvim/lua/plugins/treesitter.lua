return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "nu", "python", "rust", "haskell" }, -- add more as needed
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}

