# My Dotfiles - Managed with Stow
- To learn about stow: 
    - https://www.gnu.org/software/stow/

## To use my dotfiles:
1. Clone repo in $HOME / $env.HOME
2. cd dotfiles/
3. stow cargo
    
## Alternatively (nushell only):
1. Clone repo in $env.HOME 
2. cd dotfiles/
3. ls | where type == dir | get name | each {|d| stow $d --adopt}

The alternative method will work in the event I add more stow'd directories, but forget to update the readme
    
