FROM ruby:2.7.0-alpine3.11

COPY . .

RUN apk add --no-cache build-base git
RUN bundle install --without development test

ENV APP_ENV=production

RUN addgroup -S employee-title-generator && adduser -S employee-title-generator -G employee-title-generator
USER employee-title-generator

EXPOSE 8080
ENTRYPOINT ["rake", "start"]
