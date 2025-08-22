return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<CR>']  = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, { name = "path"},
                }),
            })
        end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
}
