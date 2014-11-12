# The binary file location
BIN = ./node_modules/.bin
# fontello path. /!\ change in paths config can kaboum here.
FONT_DIR ?= ./src/fonts/fontello
# put your own fontello server here if any or leave the public one
FONTELLO_HOST ?= http://fontello.com

##################################
# Main commands
##################################

# Install node and bower packages
install:
	npm install
	$(BIN)/bower install
	# @todo restore empty bower file
	cp config.js.sample config.js

# Update node and bower packages - run it when you update the bower.json file
update:
	npm prune
	npm install || sudo chown -R $$USER ~/.npm node_modules && npm install
	$(BIN)/bower prune
	$(BIN)/bower update

# watch the file for dev working
watch:
	gulp

# deploy the generated dist files to github gh-pages (edit the config file to push on another branch)
publish:
	gulp clean
	gulp build
	gulp deploy
	sh ghpages-flushcache.sh

# reset: reset the git gh-pages branchs to restart
githubio:
	sh ghpages-createbranch.sh

# Remove all dependencies and compiled paths. Usefull to pack it
clean:
	gulp clean
	rm -Rf node_modules vendor tmp


##################################
# Fonts stuff
##################################

# remove existing token if any
fontgettoken:
	curl --silent --show-error --fail --output .fontello --form "config=@${FONT_DIR}/config.json" ${FONTELLO_HOST}

# open the fontello project from your mac
fontopenmac:
	make fontgettoken
	cat .fontello
	open -a "Google Chrome" ${FONTELLO_HOST}/`cat .fontello`

# open the fontello project with your linux
fontopenlinux:
	make fontgettoken
	/opt/google/chrome/google-chrome --enable-plugins ${FONTELLO_HOST}/`cat .fontello`

# save the session font in local and extract it
fontsave:
	@if test ! `which unzip` ; then \
		echo 'Install unzip first.' >&2 ; \
		exit 128 ; \
		fi

	rm -rf .fontello.src .fontello.zip

	curl --silent --show-error --fail --output .fontello.zip \
		${FONTELLO_HOST}/`cat .fontello`/get

	unzip .fontello.zip -d .fontello.src

	rm -rf ${FONT_DIR}
	mv `find ./.fontello.src -maxdepth 1 -name 'fontello-*'` ${FONT_DIR}
	rm -rf .fontello.src .fontello.zip
