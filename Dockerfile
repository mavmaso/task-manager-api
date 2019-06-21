FROM ruby:2.5.1

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick curl

# Instalar o GNUPG
RUN apt-get install -y gnupg

# Instalar NodeJS v8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Instalar o Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

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