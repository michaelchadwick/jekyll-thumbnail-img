VERSION = 0.1.2
DOCKER_SHELL = docker run --rm -it \
	--volume="$(shell pwd):/jekyll-thumbnail-img:rw" \
	-w /jekyll-thumbnail-img \
	ruby:3.1.4-bullseye /bin/bash

jekyll-thumbnail-img-$(VERSION).gem: jekyll-thumbnail-img.gemspec
	@$(DOCKER_SHELL) -c "gem build jekyll-thumbnail-img.gemspec"

build: jekyll-thumbnail-img-$(VERSION).gem

clean:
	@rm -rf *.gem

install-test: build
	@$(DOCKER_SHELL) -c "gem install ./jekyll-thumbnail-img-$(VERSION).gem" \
		| grep "Successfully installed jekyll-thumbnail-img-$(VERSION)"

publish: build
	@$(DOCKER_SHELL) -c "gem push jekyll-thumbnail-img-$(VERSION).gem"

shell:
	@$(DOCKER_SHELL)
