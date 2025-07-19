My Dotfiles - managed with stow:
    https://www.gnu.org/software/stow/

To use my dotfiles:
    Clone repo in $HOME (or $env.HOME if you use nushell like me)
    cd dotfiles/
    stow cargo
    stow config
    stow fonts
    
Alternatively (nushell only):
    Clone repo in $env.HOME 
    cd dotfiles/
    ls | where type == dir | get name | each {|d| stow $d --adopt}

The alternative method will work in the event I add more stow'd directories, 
    but forget to update the readme
    
