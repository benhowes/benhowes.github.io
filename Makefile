# Default target
.DEFAULT_GOAL := start

# Start the Jekyll server in Docker
start:
	./scripts/docker-serve.sh

# Update Gemfile.lock after changing Gemfile
update-gems:
	docker run --rm -v "$(PWD):/site" -w /site benhowes-site bundle update

# Install gems without updating Gemfile.lock
install-gems:
	docker run --rm -v "$(PWD):/site" -w /site benhowes-site bundle install

# Run arbitrary bundle commands (usage: make bundle cmd="add gemname")
bundle:
	docker run --rm -v "$(PWD):/site" -w /site benhowes-site bundle $(cmd)

# Clean Docker resources
clean:
	docker rmi benhowes-site 2>/dev/null || true

.PHONY: start clean update-gems install-gems bundle
