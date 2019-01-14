FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN mkdir /seeds_house
WORKDIR /seeds_house
COPY Gemfile /seeds_house/Gemfile
COPY Gemfile.lock /seeds_house/Gemfile.lock
RUN bundle install
COPY . /seeds_house

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
