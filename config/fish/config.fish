set -g fish_greeting ""
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"
set -x TMUX_CONF ~/.config/tmux/tmux.conf
set -g fish_key_bindings fish_vi_key_bindings
set -gx PATH $PATH $HOME/go/bin

if not test -f /tmp/kitty-opacity.conf
    echo "background_opacity 0.8" >/tmp/kitty-opacity.conf
end
