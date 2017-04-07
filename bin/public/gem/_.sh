
# === {{CMD}}  ...
gem () {
  unset -f gem
  if [[ -d configs ]]; then
    local +x GEMRC="$THIS_DIR"/configs/gemrc
  else
    local +x GEMRC="$THIS_DIR"/config/gemrc
  fi
  gem "$@" --config "$GEMRC"
} # === end function
