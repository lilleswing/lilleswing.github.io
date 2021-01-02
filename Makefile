.PHONY: dev build deploy

dev:
	bundle exec jekyll serve --drafts

build:
	bundle exec jekyll build

deploy: build
	rsync -avz _site/ karl_leswing@karlleswing.com:~/karlleswing.com
