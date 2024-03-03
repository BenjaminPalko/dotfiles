
asdfPlugins=(
  "nodejs"
  "bun"
)

_installPlugins() {
  for plugin; do
    asdf plugin add "${plugin}"
  done;
}

_installPlugins "${asdfPlugins[@]}"

