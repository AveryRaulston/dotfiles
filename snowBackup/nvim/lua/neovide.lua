

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font Mono:h13"
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_window_blurred = true -- This doesn't seem to work for some reason
    vim.g.neovide_scale_factor = 1.0 -- Not sure if this is necessary
    vim.g.neovide_wayland_scale_factor = 1.0 -- Not sure if this is necessary
    vim.g.neovide_hide_mouse_when_typing = true

    -- VFX settings
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.0
    vim.g.neovide_cursor_vfx_particle_density = 2.0
    vim.g.neovide_cursor_vfx_particle_phase = 10.0
    vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function() vim.g.neovide_cursor_vfx_mode = "" end,
    })
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function() 
            vim.g.neovide_particle_effect = "railgun"
            vim.g.neovide_cursor_vfx_particle_lifetime = 1.0
            vim.g.neovide_cursor_vfx_particle_density = 2.0
            vim.g.neovide_cursor_vfx_particle_phase = 10.0
        end,
    })

    -- Add copy and paste
    vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
    vim.keymap.set('i', '<C-v>', '<Esc>"+pi', { noremap = true, silent = true })

end

