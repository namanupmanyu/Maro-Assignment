
FROM ruby:3.2


RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 4000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]

