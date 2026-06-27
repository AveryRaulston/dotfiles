# My Dotfiles - Managed with Stow
- To learn about stow: 
    - https://www.gnu.org/software/stow/

## To use my dotfiles:
1. Clone repo in $HOME / $env.HOME
2. cd dotfiles/
3. stow base 
4. stow gruvbox or stow snowDay, depending on which theme you want

### Nushell script to swtich theme:
#!/usr/bin/nu

def main [current: string, new: string] {
    cd ~/dotfiles/ 
    stow -D $current
    stow -t ~ --ignore=history.txt $new
    ls ~/.local/share/nushell/vendor/autoload/ | get name | each {|file| rm $file}
}

    
