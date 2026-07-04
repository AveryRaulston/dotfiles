# $env.LS_COLORS = (vivid generate gruvbox-dark-soft)
oh-my-posh init nu --config /home/user/.config/nushell/autoload/oh_my_posh_theme.omp.json
source ./everforest_theme.nu
$env.config.ls.use_ls_colors = true
