#
# MailCatcher Dockerfile
#

FROM ruby:3.2-slim-bullseye

# Install MailHog:
RUN apt-get update \
  && apt-get install -y build-essential pkg-config sqlite3 libsqlite3-dev \
  && gem install mailcatcher --version 0.8.2 --no-document \
  && apt-get remove -y build-essential pkg-config \
  && apt-get autoremove -y

RUN useradd -ms /bin/bash -u 1000 mailcatcher

WORKDIR /home/mailcatcher

USER mailcatcher

# Expose the SMTP and HTTP ports:
EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground", "--verbose", "--ip=0.0.0.0"]
