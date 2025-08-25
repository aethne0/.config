if status is-interactive
    set fish_greeting
	# set -g fish_key_bindings fish_vi_key_bindings
    # neofetch

    set -l os_name (cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
    set -l kernel_ver (uname -r)
    set -l shell_ver $version
    #set -l cpu_name (cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
    #set -l cpu_threads (cat /etc/*-release | grep "CPU(s):" | sed 's/CPU(s):=//g' | sed 's/"//g')

    string join '' -- (set_color -b blue black) " fish " $shell_ver ' ' (set_color normal) \
        " (" (set_color yellow) $os_name ' ' (set_color cyan) $kernel_ver (set_color normal) ")"
end


# Created by `pipx` on 2025-04-02 17:34:14
set PATH $PATH /home/yarn/.local/bin

alias e 'exa -la'
alias ls 'exa -i'

alias c clear

alias h 'glow *.md'
alias hg 'glow -lt *.md'

alias weather 'curl https://www.wttr.in/43.655,-79.354'

alias wl wishlist

alias vim nvim
alias vi nvim
alias v nvim
alias hex 'xxd -u -g 1'

alias ip 'ip -c'

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/yarn/.ghcup/bin # ghcup-env

export COLORTERM=truecolor


# autocompletions

function __docker_image_names
    docker images --format "{{.Repository}}:{{.Tag}}" 2>/dev/null
end

complete -c docker -n '__fish_seen_subcommand_from rmi' -a '(__docker_image_names)'

