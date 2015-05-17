FROM litaio/ruby:latest
MAINTAINER Mike Fiedler <miketheman@gmail.com>

ADD . /code
WORKDIR /code

RUN gem install bundler --no-rdoc --no-ri && bundle install

ENTRYPOINT ["bundle", "exec", "lita", "start"]
