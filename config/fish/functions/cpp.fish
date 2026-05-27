function cpp
    set -l file $argv[1]

    # Si no das un archivo, buscamos el .cpp más reciente en la carpeta
    if test -z "$file"
        set file (ls -t *.cpp 2>/dev/null | head -n1)
        if test -z "$file"
            echo " No se encontró ningún archivo .cpp en esta carpeta."
            return 1
        end
        echo "󱓞 Compilando el más reciente: $file"
    end

    if not test -f "$file"
        echo " Archivo no encontrado: $file"
        return 1
    end

    set -l base (string split -r -m1 . $file)[1]
    g++ "$file" -o "$base" && "./$base"
end
