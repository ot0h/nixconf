function yap
    set -l yaziProject $argv[1]
    
    if test -z "$yaziProject"
        echo "ERROR: The first argument must be a project" >&2
        return 64
    end

    # En Fish no existe $RANDOM de Bash, pero podemos usar este truco
    set -l yaziId (random)

    # Quitamos el primer argumento para pasar el resto a yazi
    set -e argv[1]

    # Ejecutamos el comando de fondo
    # Usamos nohup o simplemente mandamos a dormir el proceso para que no estorbe
    fish -c "sleep 0.1; YAZI_ID=$yaziId ya emit plugin projects 'load $yaziProject'" &

    # Corremos Yazi
    y --client-id $yaziId $argv
end
