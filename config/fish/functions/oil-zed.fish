function oil-zed --description "Abrir Neovim con Oil.nvim desde Zed o la terminal"
    # 1. Definir directorio (si no hay, usa el actual)
    set -l target "."
    if count $argv >/dev/null
        set target $argv[1]
    end

    # 2. Resolver ruta absoluta
    set -l abs_target (realpath "$target")

    # 3. Validar existencia
    if not test -d "$abs_target"
        echo "Error: El directorio '$abs_target' no existe, maje." >&2
        return 1
    end

    # 4. Ejecutar Neovim con la magia de Oil
    nvim \
        --cmd "set noswapfile" \
        -c "lua require('oil').open('$abs_target')" \
        -c "autocmd FileType oil nnoremap <buffer><silent> q :qa!<CR>" \
        -c "autocmd FileType oil nnoremap <buffer><silent> <Esc> :qa!<CR>"
end
