FROM ruby:2.5.1
LABEL maintainer="Novianto Nugroho"
RUN apt-get update && apt-get install -y --fix-missing curl unzip libnss3

# Install Chrome WebDriver
RUN CHROMEDRIVER_VERSION=89.0.4389.23 && \
    mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
    ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

# Install Google Chrome
ARG CHROME_VERSION=89.0.4389.90-1
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    wget --no-verbose -O /tmp/chrome.deb http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb && \
    apt install -y /tmp/chrome.deb && \
    rm /tmp/chrome.deb

RUN apt-get install -y -f && \
    rm -rf /var/lib/apt/lists/*

ENV BROWSER=chrome_headless
ENV CI=false
# ENV TZ='Asia/Jakarta'

#Configuring the tests to run in the container
RUN mkdir /app
WORKDIR /app
# RUN gem update

# Copy the test code
COPY . .
RUN chmod +x /app/docker.sh
RUN gem install bundler
RUN bundle install --quiet

ENTRYPOINT ["/app/docker.sh"]