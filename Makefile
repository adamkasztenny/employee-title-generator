PROJECT="employee-title-generator"

install:
	bundle install
build:
	docker build --no-cache -t ${PROJECT} .

start:
	docker run -d -p 8080:8080 ${PROJECT}

test: install
	rake

lint:
	rubocop -a app spec
