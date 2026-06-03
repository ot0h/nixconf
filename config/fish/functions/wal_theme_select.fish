function wal_theme_select
    # Hacemos un backup por si cancelás (ESC)
    cp -f ~/.cache/wal/colors.json /tmp/fzwal-backup.json

    set -l is_light ""
    set -l selected_theme ""

    if test -n "$argv[1]"
        # Modo temas CLAROS
        set is_light TRUE
        set selected_theme (wal --theme | \
            sed '1,/Light Themes/d;/Extra/,$d' | \
            sed -e '/^\S/d' -e 's/ - //' | \
            fzf --prompt="☀️ Temas Claros: " \
                --header="Enter: Aplicar | ESC: Cancelar")
    else
        # Modo temas OSCUROS
        set selected_theme (wal --theme | \
            sed '/Light Themes/,$d' | \
            sed -e '/^\S/d' -e 's/ - //' | \
            fzf --prompt="🌙 Temas Oscuros: " \
                --header="Enter: Aplicar | ESC: Cancelar")
    end

    if test -n "$selected_theme"
        if test -n "$is_light"
            wal -ql --theme $selected_theme
        else
            wal -q --theme $selected_theme
        end
        clear
        echo "¡Quedó macanudo! Tema aplicado: $selected_theme"
        fastfetch

    else
        # Si le diste ESC, regresamos al backup
        wal -q --theme /tmp/fzwal-backup.json
        echo "No elegiste nada, volvimos a la normalidad."
    end

    # Reset del cursor si tenés esa variable configurada
    if set -q FZWAL_RESET_CURSOR
        for TTY in /dev/pts/*
            if test -w $TTY
                printf "\e]112\a" >$TTY
            end
        end
    end

    hyprctl reload
end
