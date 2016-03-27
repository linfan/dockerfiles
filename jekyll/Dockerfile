FROM ruby:2.3.0
MAINTAINER LinFan "linfan.china@gmail.com"

# Install github-pages
RUN gem install github-pages

# Set workdir
VOLUME /doc
WORKDIR /doc

# Ports
EXPOSE 4000

# Run jekyll
ENTRYPOINT ["jekyll", "serve"]
