#!/bin/bash
# --> POR OTOH <--

MUSIC_DIR=~/Music

read -p "🔗 Ingresa URL de YouTube (canción, playlist o álbum): " YTURL

# Detectar tipo de contenido
if [[ "$YTURL" == *"list="* ]]; then
  TYPE="playlist"
elif [[ "$YTURL" == *"album"* || "$YTURL" == *"Álbum"* || "$YTURL" == *"album completo"* ]]; then
  TYPE="album"
else
  TYPE="single"
fi

echo "🎧 Detectado: $TYPE"

if [[ "$TYPE" == "playlist" ]]; then
  read -p "📝 ¿Con qué nombre quieres guardar esta playlist?: " PLAYLIST_NAME
  TARGET="$MUSIC_DIR/Playlists/$PLAYLIST_NAME"
  mkdir -p "$TARGET"
  EDIT_METADATA="n"
else
  read -p "🎤 Nombre del artista: " ARTIST
  read -p "💿 Nombre del álbum: " ALBUM
  read -p "📅 Año de lanzamiento (opcional): " YEAR
  read -p "📆 Fecha completa (YYYY-MM-DD, opcional): " FULLDATE
  read -p "🎼 Género (opcional): " GENRE
  read -p "✏️ ¿Deseas modificar los metadatos? (s/n): " EDIT_METADATA
  TARGET="$MUSIC_DIR/$ARTIST/$ALBUM"
  mkdir -p "$TARGET"
fi

read -p "🖼️ ¿Deseas descargar miniaturas? (s/n): " DOWNLOAD_THUMBS

echo "📥 Descargando audio..."
yt-dlp \
  --extract-audio \
  --audio-format mp3 \
  $([[ "$DOWNLOAD_THUMBS" == "s" ]] && echo "--write-thumbnail") \
  --output "$TARGET/%(title)s.%(ext)s" \
  "$YTURL"

# Buscar y convertir miniatura si se solicitó
if [[ "$DOWNLOAD_THUMBS" == "s" ]]; then
  THUMBNAIL=$(find "$TARGET" -maxdepth 1 \( -iname "*.jpg" -o -iname "*.webp" -o -iname "*.png" \) | head -n1)
  if [[ -n "$THUMBNAIL" ]]; then
    EXT="${THUMBNAIL##*.}"
    if [[ "$EXT" == "webp" ]]; then
      ffmpeg -i "$THUMBNAIL" "${THUMBNAIL%.*}.jpg" -y -loglevel error
      COVER="${THUMBNAIL%.*}.jpg"
    else
      COVER="$THUMBNAIL"
    fi
  fi
fi

# Aplicar metadatos si el usuario lo pidió y no es playlist
if [[ "$EDIT_METADATA" == "s" ]]; then
  echo "🛠️ Editando metadatos..."
  for file in "$TARGET"/*.mp3; do
    eyeD3 \
      --artist "$ARTIST" \
      --album "$ALBUM" \
      $([[ -n "$YEAR" ]] && echo "--release-year $YEAR") \
      $([[ -n "$FULLDATE" ]] && echo "--recording-date $FULLDATE") \
      $([[ -n "$GENRE" ]] && echo "--genre $GENRE") \
      $([[ -n "$COVER" ]] && echo "--add-image \"$COVER\":FRONT_COVER") \
      "$file"
  done
fi

echo "✅ Proceso completado en: $TARGET"
