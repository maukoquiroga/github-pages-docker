FROM ubuntu
WORKDIR /app
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y jq
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN echo 'source /usr/local/rvm/scripts/rvm' >> /etc/bash.bashrc
RUN curl https://pages.github.com/versions.json | jq -r '.ruby' > /tmp/.ruby-version
RUN curl https://pages.github.com/versions.json | jq -r '."github-pages"' > /tmp/.gh-version
RUN /bin/bash -l -c 'rvm install $(cat /tmp/.ruby-version)'
RUN /bin/bash -l -c 'rvm use $(cat /tmp/.ruby-version) --default'
RUN /bin/bash -l -c 'gem install --no-document \
  github-pages:$(cat /tmp/.gh-version) \
  jekyll-github-metadata'
CMD /bin/bash -c "source /usr/local/rvm/scripts/rvm && jekyll serve --watch --force_polling -H 0.0.0.0 -P 4000"
