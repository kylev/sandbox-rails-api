FROM ruby:2.7.2

WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs=3 --retry=3 && \
        rm -rf /usr/local/bundle/cache

RUN mkdir -p tmp/cache tmp/pids
COPY . ./

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
