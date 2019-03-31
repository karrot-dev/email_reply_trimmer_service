
FROM ruby:2.6

WORKDIR /app
ADD . /app
RUN gem install bundler && bundle install --system

EXPOSE 4567

CMD ["ruby", "server.rb"]