set -gx FZF_DEFAULT_OPTS "
  --color='base16'
"

set -gx FZF_CTRL_T_OPTS "
  --walker-skip .git,node_modules,target
  --color base16
  --preview 'fzf-preview {}'
  --header ' Buscando Archivo'
  --pointer '❯❯'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --bind 'ctrl-u:preview-half-page-up'
  --bind 'ctrl-d:preview-half-page-down'"

set -gx FZF_ALT_C_OPTS "
  --color base16
  --header ' Buscando Carpeta'
  --pointer '❯❯'
  --walker-skip .git,node_modules,target
  --preview 'fzf-preview {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --bind 'ctrl-u:preview-half-page-up'
  --bind 'ctrl-d:preview-half-page-down'"

set -gx YT_X_FZF_OPTS "$FZF_DEFAULT_OPTS
  --color base16
  --border='line' --border-label='' --preview-window='border-rounded' --prompt='> '
  --marker='>' --pointer='❯❯' --separator='─' --scrollbar='│'"
