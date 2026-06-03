function fzf-preview
    set -l path $argv[1]
    if test -d $path
        eza -T --icons always --color=always $path | head -200
    else if type -q file; and string match -q "image/*" (file --mime-type -b $path)
        if set -q TMUX
            kitty +kitten icat --clear --silent --transfer-mode=stream 2>/dev/null
            kitty +kitten icat \
                --silent \
                --stdin no \
                --transfer-mode=stream \
                --place "$FZF_PREVIEW_COLUMNS"x"$FZF_PREVIEW_LINES"@0x0 \
                "$path" 2>/dev/null
        else
            kitty +kitten icat --clear --silent --transfer-mode=memory 2>/dev/null
            kitty +kitten icat \
                --silent \
                --stdin no \
                --transfer-mode=memory \
                --place "$FZF_PREVIEW_COLUMNS"x"$FZF_PREVIEW_LINES"@0x0 \
                "$path" 2>/dev/null
        end
    else
        bat -n --theme=base16 --color=always $path
    end
end
