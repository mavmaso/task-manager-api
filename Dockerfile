FROM ruby:2.4.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install our dependencies 
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# Set out path
ENV INSTALL_PATH /fonte

# Create our directory
RUN mkdir -p $INSTALL_PATH

# Set our path to root directory
WORKDIR $INSTALL_PATH

ADD Gemfile* $APP_HOME/
RUN echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
RUN bundle install

# Copia nosso código para dentro do container
COPY . .