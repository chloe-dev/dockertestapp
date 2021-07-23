FROM        ruby:2.6-alpine
# ^layer
LABEL       author="github.com/chloe-dev" 

ENV         RAILS_ENV=development
ENV         PORT=3000

WORKDIR     /var/www
COPY        Gemfile Gemfile.lock ./
RUN         ["bundle", "install"]
# ^layer?
COPY        package.json  .
RUN         ["npm", "install"]
# ^layer?
COPY        . ./
EXPOSE      $PORT
# ^layer?
ENTRYPOINT [ "bin/rails", "server"]