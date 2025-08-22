# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.EDITOR = "neovide"
$env.config.history.max_size = 10000
$env.config.edit_mode = "vi"
$env.config.show_banner = false
$env.LS_COLORS = (vivid generate catppuccin-frappe)
$env.PATH = $env.PATH | prepend "~/.ghcup/bin/" | prepend "/home/user/.ghcup/ghc/9.6.7/bin" | prepend "~/.shellScripts"

def --env r [] { 
    ranger --choosedir=/home/user/rangerdir
    cd (cat /home/user/rangerdir)
    rm /home/user/rangerdir
}

alias nv = neovide
oh-my-posh init nu --config /usr/share/oh-my-posh/themes/1_shell.omp.json


# Completer stuff below here

let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}

$env.config.completions.external.completer = $fish_completer
