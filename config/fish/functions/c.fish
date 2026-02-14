function c
    set -l file $argv[1]

    # Si no das un archivo, buscamos el .c más reciente
    if test -z "$file"
        set file (ls -t *.c 2>/dev/null | head -n1)
        if test -z "$file"
            echo " No se encontró ningún archivo .c en esta carpeta."
            return 1
        end
        echo "󱓞 Compilando el más reciente: $file"
    end

    if not test -f "$file"
        echo " Archivo no encontrado: $file"
        return 1
    end

    set -l base (string split -r -m1 . $file)[1]
    gcc "$file" -o "$base" && "./$base"
end
