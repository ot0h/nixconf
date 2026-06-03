# compress_cosas — Compresión de imágenes y PDFs sin pérdida
# Dependencias: nix-shell -p jpegoptim optipng libwebp gifsicle ghostscript libavif

function compress_cosas
    set RESET (set_color normal)
    set BOLD (set_color --bold white)
    set GREEN (set_color green)
    set YELLOW (set_color yellow)
    set RED (set_color red)
    set CYAN (set_color cyan)
    set DIM (set_color brblack)

    set output_dir ""
    set recursive 0
    set processed 0
    set skipped 0
    set total_saved 0

    function print_usage
        echo $BOLD"USO:"$RESET"  compress_cosas [opciones] [archivo(s) o carpeta]"
        echo "  -o <dir>   Carpeta de salida"
        echo "  -r         Recursivo"
        echo "  -h         Ayuda"
    end

    function check_dep
        if not command -q $argv[1]
            echo $YELLOW"  ⚠  '$argv[1]' no encontrado. Instala con: nix-shell -p "$argv[2]$RESET
            return 1
        end
    end

    function bytes_to_human
        set b $argv[1]
        if test $b -ge 1048576
            echo (math --scale=1 "$b / 1048576")" MB"
        else if test $b -ge 1024
            echo (math --scale=1 "$b / 1024")" KB"
        else
            echo $b" B"
        end
    end

    function get_size
        stat -c%s $argv[1] 2>/dev/null; or stat -f%z $argv[1]
    end

    function compress_file
        set src $argv[1]
        set ext (string lower (path extension $src))

        set size_before (get_size $src)

        if test -n "$output_dir"
            mkdir -p $output_dir
            set dst $output_dir/(path basename $src)
            cp $src $dst
        else
            set dst $src
        end

        set ok 0

        switch $ext
            case .jpg .jpeg
                if check_dep jpegoptim jpegoptim
                    jpegoptim --strip-all --all-progressive --quiet $dst
                    set ok 1
                end
            case .png
                if check_dep optipng optipng
                    optipng -o5 -quiet $dst
                    set ok 1
                end
            case .avif
                if check_dep avifenc libavif
                    set tmp $dst.tmp.avif
                    avifenc -lossless $dst $tmp
                    and mv $tmp $dst
                    set ok 1
                end
            case .webp
                if check_dep cwebp libwebp
                    set tmp $dst.tmp.webp
                    cwebp -lossless -quiet $dst -o $tmp
                    and mv $tmp $dst
                    set ok 1
                end
            case .gif
                if check_dep gifsicle gifsicle
                    gifsicle -O3 --quiet $dst -o $dst
                    set ok 1
                end
            case .pdf
                if check_dep gs ghostscript
                    set tmp $dst.tmp.pdf
                    gs -q -dNOPAUSE -dBATCH -dSAFER \
                        -sDEVICE=pdfwrite \
                        -dCompatibilityLevel=1.5 \
                        -dPDFSETTINGS=/prepress \
                        -dEmbedAllFonts=true \
                        -dSubsetFonts=true \
                        -dColorImageDownsampleType=/Bicubic \
                        -dColorImageResolution=300 \
                        -dGrayImageDownsampleType=/Bicubic \
                        -dGrayImageResolution=300 \
                        -dMonoImageDownsampleType=/Bicubic \
                        -dMonoImageResolution=300 \
                        -sOutputFile=$tmp $dst
                    and mv $tmp $dst
                    set ok 1
                end
            case '*'
                echo $DIM"  —  Formato no soportado: "(path basename $src)$RESET
                set skipped (math $skipped + 1)
                return
        end

        if test $ok -eq 1
            set size_after (get_size $dst)
            set saved (math $size_before - $size_after)
            set pct 0
            test $size_before -gt 0
            and set pct (math --scale=1 "$saved * 100 / $size_before")
            set total_saved (math $total_saved + $saved)
            set processed (math $processed + 1)

            if test $saved -gt 0
                echo $GREEN"  ✓  "(path basename $src)$RESET \
                    $DIM(bytes_to_human $size_before)" → "(bytes_to_human $size_after)$RESET \
                    $GREEN"(-$pct%)"$RESET
            else
                echo $DIM"  ·  "(path basename $src)" — ya estaba optimizado"$RESET
            end
        else
            set skipped (math $skipped + 1)
        end
    end

    function compress_folder
        set dir $argv[1]
        not test -d $dir; and echo $RED"  ✗  No es una carpeta: $dir"$RESET; and return

        echo $CYAN"  📁  $dir"$RESET

        if test $recursive -eq 1
            set files (find $dir -type f \( \
                -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \
                -o -iname "*.webp" -o -iname "*.avif" \
                -o -iname "*.gif" -o -iname "*.pdf" \) 2>/dev/null)
        else
            set files (find $dir -maxdepth 1 -type f \( \
                -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \
                -o -iname "*.webp" -o -iname "*.avif" \
                -o -iname "*.gif" -o -iname "*.pdf" \) 2>/dev/null)
        end

        if test (count $files) -eq 0
            echo $YELLOW"  ⚠  Sin archivos compatibles en: $dir"$RESET
            return
        end

        for f in $files
            compress_file $f
        end
    end

    # ── Parsear argumentos ────────────────────────────────────────

    test (count $argv) -eq 0; and print_usage; and return 0

    set targets
    set i 1
    while test $i -le (count $argv)
        switch $argv[$i]
            case -h --help
                print_usage
                return 0
            case -r --recursive
                set recursive 1
            case -o --output
                set i (math $i + 1)
                set output_dir $argv[$i]
            case '*'
                set targets $targets $argv[$i]
        end
        set i (math $i + 1)
    end

    test (count $targets) -eq 0; and echo $RED"Error: sin archivos ni carpeta."$RESET; and return 1

    test -n "$output_dir"; and echo $DIM"  Salida: $output_dir"$RESET; and echo ""

    for target in $targets
        if test -d $target
            compress_folder $target
        else if test -f $target
            compress_file $target
        else
            echo $RED"  ✗  No encontrado: $target"$RESET
            set skipped (math $skipped + 1)
        end
    end

    echo ""
    echo $CYAN"────────────────────────────────"$RESET
    echo "  ✓ Procesados  : "$GREEN$processed$RESET
    echo "  — Omitidos    : "$DIM$skipped$RESET
    echo "  💾 Ahorrado   : "$GREEN(bytes_to_human $total_saved)$RESET
    echo $CYAN"────────────────────────────────"$RESET
end

