default:
		hugo
deploy: default
		bash deploy.sh
test:
		hugo --buildDrafts serve
theme:
		https://github.com/digitalcraftsman/hugo-cactus-theme.git themes/cactus
