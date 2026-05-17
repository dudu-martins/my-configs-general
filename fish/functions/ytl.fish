function ytl
    # Verifica se um link foi passado como argumento
    if test (count $argv) -eq 0
        echo "❌ Uso: ytl <link da live>"
        echo "   Exemplo: ytl https://youtube.com/live"
        return 1
    end

    set link $argv[1]

    echo "🎬 Iniciando gravação: $link"
    echo "   Pressione Ctrl+C para parar."
    echo ""

    while true
        yt-dlp --config-location "$HOME/.config/yt-dlp/youtube-lives/config" $link
        set code $status

        if test $code -eq 130
            # Ctrl+C foi pressionado, sai sem reiniciar
            echo ""
            echo "⏹  Gravação encerrada pelo usuário."
            return 0
        end

        echo ""
        echo "⚠️  yt-dlp encerrou (código: $code). Reiniciando em 5s... (Ctrl+C para parar)"
        sleep 5
    end
end
