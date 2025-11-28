FROM ruby:3.2.2-slim

# Главный фикс: запускаем Rails в development
ENV RAILS_ENV=development

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  curl \
  git

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-c", "bundle exec rails db:create db:migrate && bundle exec rails s -b 0.0.0.0 -p 3000"]
