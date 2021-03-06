FROM ruby:3.0.0-alpine3.13

COPY . .

RUN apk add --no-cache build-base git

RUN bundle config set --local without 'development test'
RUN bundle install

ENV APP_ENV=production

RUN addgroup -S employee-title-generator && adduser -S employee-title-generator -G employee-title-generator
USER employee-title-generator

EXPOSE 8080
ENTRYPOINT ["rake", "start"]
