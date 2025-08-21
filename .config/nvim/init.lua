require("config.lazy")
--require("config.pluginconfigs")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.number = true

-- set transparent background
vim.cmd [[
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
]]


-- Enable persistent cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- Custom command to run python script interactively from nvim
vim.api.nvim_create_user_command("IPythonRun", function()
  local filepath = vim.fn.expand("%:p")
  local cmd = string.format('ipython3 -i "%s"', filepath)
  vim.cmd('terminal ' .. cmd)
  end, {
  desc = "Run current file in IPython and drop into interactive shell"
})


-- Run nushell code
-- vim.api.nvim_create_user_command("RunNushell", function()
--   local filepath = vim.fn.expand("%:p")
--   vim.cmd("split | terminal nu -i " .. filepath)
--   -- local cmd = string.format('nu "%s"', filepath)
--   -- vim.cmd('terminal ' .. cmd)
--   end, {
--   desc = "Run current file in nu and drop into interactive shell"
-- })

-- black current file
vim.api.nvim_create_user_command("BlackCurrentFile", function()
    local filepath = vim.fn.expand("%:p")
    local cmd = string.format('black "%s"', filepath)
    vim.cmd("terminal "  .. cmd)
    end, {
    desc = "Blacks current file"
})

-- clang-format current file
vim.api.nvim_create_user_command("ClangFormatCurrentFile", function()
    local filepath = vim.fn.expand("%:p")
    local cmd = string.format('clang-format -i "%s"', filepath)
    vim.cmd("terminal "  .. cmd)
    end, {
    desc = "Clang-formats current file"
})

-- turn on diagnostic text in normal mode
-- vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_user_command("ToggleVirtualText", function()
    local current = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ 
        virtual_lines = not current
    })
    end, {
    desc = "Toggles virtual text" 
})

vim.keymap.set("n", " rp", ":IPythonRun<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", " rn", ":RunNushell<CR>", { noremap = true, silent = true })
vim.keymap.set("n", " vt", ":ToggleVirtualText<CR>", { noremap = true, silent = true})
vim.keymap.set("n", " bl", ":BlackCurrentFile<CR>", { noremap = true, silent = true})
vim.keymap.set("n", " cf", ":ClangFormatCurrentFile<CR>", { noremap = true, silent = true})

--turn off highlighting after a search by pressing esc
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>tt', function()
    local trouble = require('trouble')
    trouble.toggle()
end, { desc = 'Toggle Focus in Trouble' })

