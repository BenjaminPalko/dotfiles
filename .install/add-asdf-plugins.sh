asdfPlugins=(
	"nodejs"
	"bun"
	"python"
	"rust"
	"golang"
)

_addPlugins() {
	for plugin; do
		asdf plugin add "${plugin}"
	done
}

# Add asdf plugins
_addPlugins "${asdfPlugins[@]}"

# Install plugins
asdf install
