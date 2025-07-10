-- load standard vis module, providing parts of the Lua API
require('vis')
-- I modified the source code on this slightly so it does what
--      vis-backspace is supposed to do
require('plugins/vis-smart-backspace')
-- require('plugins/vis-backspace')
require('plugins/vis-cursors')
-- require('plugins/vis-lspc')
require('plugins/vis-commentary')
    

vis.events.subscribe(vis.events.INIT, function()
    -- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
    -- Your per window configuration options e.g.
    -- vis:command('set number')
    vis:command(":set tabwidth 4")
    vis:command(":set expandtab on")
    vis:command(":set autoindent on")
    vis:command(":set numbers on")
    vis:command(":set theme base16-gruvbox-dark-pale")
    vis:map(vis.modes.NORMAL, ' bl', ':!black $env.vis_filepath<Enter>')
    vis:map(vis.modes.NORMAL, ' rp', ':!ipython3 -i $env.vis_filepath<Enter>')
    vis:map(vis.modes.NORMAL, ' ct', ':!cargo test $env.vis_filepath<Enter>')
    vis:map(vis.modes.NORMAL, ' cr', ':!cargo run $env.vis_filepath<Enter>')
    vis:map(vis.modes.NORMAL, ' cb', ':!cargo build $env.vis_filepath<Enter>')
    vis:map(vis.modes.NORMAL, ' rh', ':!runhaskell $env.vis_filepath<Enter>')
end)


