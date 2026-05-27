set -g fish_greeting ""
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"
set -x TMUX_CONF ~/.config/tmux/tmux.conf

if not test -f /tmp/kitty-opacity.conf
    echo "background_opacity 0.8" >/tmp/kitty-opacity.conf
end
