default:
		hugo
deploy: default
		bash deploy.sh
test:
		hugo --buildDrafts serve
theme:
		git clone https://github.com/digitalcraftsman/hugo-cactus-theme.git themes/cactus
