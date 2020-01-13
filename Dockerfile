FROM ruby:2.6.5
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       vim \        
                       nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn
RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /sn_5ch
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
RUN bin/rails webpacker:install
