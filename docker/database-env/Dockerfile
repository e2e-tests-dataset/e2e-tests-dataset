FROM openjdk:8

# Install dependencies
RUN apt-get update \
    && apt install -y build-essential \
    maven \
    xvfb \
    wget \
    x11vnc 

# Install node 8 and npm
RUN apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update -qqy \
    && apt-get -qqy install \
    google-chrome-stable \
    && rm /etc/apt/sources.list.d/google-chrome.list
COPY wrap_chrome_binary /opt/bin/wrap_chrome_binary
RUN chmod +x /opt/bin/wrap_chrome_binary
RUN /opt/bin/wrap_chrome_binary

# Clone database
RUN mkdir /home/database \
    && cd /home/database \
    && git clone https://github.com/e2e-tests-database/webapp-1.git \
    && git clone https://github.com/e2e-tests-database/webapp-2.git \
    && git clone https://github.com/e2e-tests-database/webapp-3.git 

# Install angular dependencies
RUN cd /home/database/webapp-1/Angular \
    && npm install \ 
    cd /home/database/webapp-2/Angular \
    && npm install

# X11 Config
ENV DISPLAY :99.0

# VNC Config
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd e2edatabase ~/.vnc/passwd

# Cleanup
RUN apt-get autoremove --purge

# Script database
ADD database.sh /usr/bin
RUN chmod +x /usr/bin/database.sh
RUN mkdir /home/database/logs

WORKDIR /home/database

ADD entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
CMD ["entrypoint.sh"]