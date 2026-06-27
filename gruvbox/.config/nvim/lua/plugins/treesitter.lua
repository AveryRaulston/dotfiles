return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
      require('nvim-treesitter').install({'lua', 'nu', 'python', 'rust'})
  end,
  -- config = function()
  --     require('nvim-treesitter').setup({
  --         highlight = { enable = true },
  --     })
  -- end,
  -- config = function() 
  --   require('nvim-treesitter').setup({
  --       install_dir = vim.fn.stdpath('data') .. '/site',
  --   }),
  --   require('nvim-treesitter').install({ "lua", "nu", "python", "rust", "haskell"}), -- add more as needed
  --   highlight = { enable = true },
  --   indent = { enable = true },
  --   end
}

