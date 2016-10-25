FROM ruby:2.3.1

ENV LANG en_US.UTF-8
ENV APP_HOME /app
ENV RACK_ENV production
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES enabled

RUN apt-get update -qq \
	&& apt-get install -y build-essential \
	libpq-dev \
	libxml2-dev \
	libxslt1-dev \
	libqt4-webkit \
	libqt4-dev \
	xvfb \
	nodejs \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

# Precompile Rails assets
RUN bundle exec rake assets:precompile

# Start puma
CMD bundle exec puma -C config/puma.rb