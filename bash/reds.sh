# reds: manual switching between normal and redshift-safe (1000K) themes.
# Source from ~/.bashrc *after* ~/.bashrc.prompt and the dircolors eval:
#
#   source ~/repos/reds/bash/reds.sh
#
# Usage:
#   reds on|off       this shell's prompt + LS_COLORS, this alacritty window,
#                     and $REDS for vims started from here
#   reds              toggle
#   reds status

REDS_DIR="${REDS_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

# alacritty.toml-style [section] key = "value" -> section.key="value"
_reds_alacritty_opts() {
  local line section="" re_sec='^\[([a-z_.]+)\]' re_kv='^([a-z_]+)[[:space:]]*=[[:space:]]*("[^"]*")'
  while IFS= read -r line; do
    if [[ $line =~ $re_sec ]]; then
      section=${BASH_REMATCH[1]}
    elif [[ $line =~ $re_kv ]]; then
      printf '%s\n' "$section.${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
    fi
  done < "$REDS_DIR/alacritty/reds.toml"
}

_reds_shell() {
  local mode=$1 timer=$_PROMPT_TIMER
  if [[ $mode == on ]]; then
    source "$REDS_DIR/bash/bashrc.prompt.reds"
    eval "$(dircolors -b "$REDS_DIR/dircolors/dircolors.reds")"
    export REDS=1
  else
    source ~/.bashrc.prompt
    eval "$(dircolors -b)"
    unset REDS
  fi
  # the prompt file resets the timer toggle; keep whatever it was
  _PROMPT_TIMER=$timer

  if [[ -n $ALACRITTY_WINDOW_ID ]] && command -v alacritty >/dev/null; then
    if [[ $mode == on ]]; then
      local opts
      mapfile -t opts < <(_reds_alacritty_opts)
      alacritty msg config "${opts[@]}"
    else
      alacritty msg config --reset
    fi
  fi
}

reds() {
  case $1 in
    on|off) _reds_shell "$1" ;;
    "")     if [[ $REDS == 1 ]]; then _reds_shell off; else _reds_shell on; fi ;;
    status) echo "$([[ $REDS == 1 ]] && echo reds || echo normal)" ;;
    *) echo "usage: reds [on|off|status]" >&2; return 2 ;;
  esac
}

# subshells / tmux panes started from a reds shell inherit REDS=1 but re-run
# .bashrc, which loads the normal prompt -- put them back in reds mode.
# (alacritty colors are per-window and already applied, so skip that part)
if [[ $REDS == 1 ]]; then
  ALACRITTY_WINDOW_ID= _reds_shell on
fi
