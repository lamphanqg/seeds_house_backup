FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y postgresql-client libnss3-dev

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb || apt update && apt-get install -f -y

RUN mkdir /seeds_house
WORKDIR /seeds_house
COPY Gemfile /seeds_house/Gemfile
COPY Gemfile.lock /seeds_house/Gemfile.lock
RUN bundle install
COPY . /seeds_house

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3333

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3333"]
