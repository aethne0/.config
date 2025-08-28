if status is-interactive
    set fish_greeting

    set -l os_name (cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
    set -l kernel_ver (uname -r)
    set -l shell_ver $version

    string join '' -- (set_color -b blue black) " fish " $shell_ver ' ' (set_color normal) \
        " (" (set_color yellow) $os_name ' ' (set_color cyan) $kernel_ver (set_color normal) ")"
end

alias e 'exa -la'
alias ls 'exa -i'
alias c clear
alias weather 'curl https://www.wttr.in/43.655,-79.354'
alias vim nvim
alias vi nvim
alias v nvim
alias hex 'xxd -u -g 1'
alias ip 'ip -c'

alias fff "source ~/.config/fish/config.fish"
alias fft "tmux source-file ~/.config/tmux/tmux.conf"

fish_vi_key_bindings

export COLORTERM=truecolor

# autocompletions

# docker rmi
function __docker_image_names
    docker images --format "{{.Repository}}:{{.Tag}}" 2>/dev/null
end
complete -c docker -n '__fish_seen_subcommand_from rmi' -a '(__docker_image_names)'
