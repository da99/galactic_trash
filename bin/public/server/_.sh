
# === {{CMD}}
server () {
  cd "$THIS_DIR"
  local +x THIS_NAME="$(basename "$THIS_DIR")"
  "$THIS_DIR"/bin/"$THIS_NAME" \
    bundle exec passenger start \
    --port 4123 \
    --rackup config/config.ru
} # === end function
