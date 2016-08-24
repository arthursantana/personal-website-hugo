default:
		hugo
deploy: default
		bash deploy.sh
serve:
		hugo --buildDrafts serve
cactus:
		git clone https://github.com/nishanths/cactus-hugo-theme.git themes/cactus
