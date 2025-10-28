FROM ruby:3.2-slim  # 选择3.2版本，官方源同步及时且稳定
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && gem install bundler \
    && bundle install
COPY . .
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && gem install bundler \
    && bundle install
COPY . .
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
