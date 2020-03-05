PROJECT="employee-title-generator"

install:
	bundle install
build:
	docker build --no-cache -t ${PROJECT} .

start:
	docker run -p 8080:8080 ${PROJECT}

test: install
	rake
