# Copy ruby version first to use as build arg
ARG RUBY_VERSION=3.3
FROM ruby:$RUBY_VERSION-slim

# Install essential build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /site

# Copy ruby version first
COPY .ruby-version ./

# Verify Ruby version
RUN RUBY_VERSION=$(cat .ruby-version) && \
    if [ "$(ruby -v | cut -d' ' -f2 | cut -d'p' -f1)" != "$RUBY_VERSION" ]; then \
        echo "Ruby version mismatch. Image has $(ruby -v), but .ruby-version specifies $RUBY_VERSION" && \
        exit 1; \
    fi

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install bundler and gems
RUN gem install bundler && \
    bundle install

# Copy the rest of the site
COPY . .

# Expose port 4000 for Jekyll
EXPOSE 4000

# Set default command
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
