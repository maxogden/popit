
REPORTER = verbose

all: npm-install


npm-install:
	npm install

npm-update:
	rm npm-shrinkwrap.json
	npm update
	npm shrinkwrap


scss:
	compass compile

minify:
	rm -rf public-minified
	r.js -o public/js/app.build.js
	rm    public-minified/build.txt
	rm    public-minified/js/app.build.js 
	rm -r public-minified/sass/
	find public-minified -name '*.png' | xargs optipng -o 5 -clobber -quiet


tidy:
	# this should tidy, but not implemented yet
	# The output is not as nice as I'd like
	# sass-convert --recursive --in-place --from scss --to scss public/sass/


test: test-unit test-selenium

test-unit:
	@NODE_ENV=testing ./node_modules/.bin/nodeunit \
		--reporter $(REPORTER) \
		tests/unit

test-selenium: scss minify
	@NODE_ENV=testing ./node_modules/.bin/nodeunit \
		--reporter $(REPORTER) \
		tests/selenium


clean:
	rm -rfv .sass-cache


.PHONY: test test-unit test-selenium scss minify clean tidy npm-install npm-update

