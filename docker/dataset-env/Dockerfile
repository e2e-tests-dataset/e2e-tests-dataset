FROM openjdk:8

#USER root

# Install dependencies
RUN apt-get update \
    && apt install -y build-essential \
    maven \
    xvfb \
    wget \
    x11vnc 

# Install node 8 and npm
RUN apt-get install -y curl \
    && wget https://nodejs.org/dist/v8.17.0/node-v8.17.0-linux-x64.tar.xz \
    && VERSION=v8.17.0 \
    && DISTRO=linux-x64 \
    && mkdir -p /usr/local/lib/nodejs \
    && tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs

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

# Clone dataset
RUN mkdir /home/dataset \
    && cd /home/dataset \
    && git clone https://github.com/e2e-tests-dataset/webapp-1.git \
    && git clone https://github.com/e2e-tests-dataset/webapp-2.git \
    && git clone https://github.com/e2e-tests-dataset/webapp-3.git 
    
# X11 Config
ENV DISPLAY :99.0

# VNC Config
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd e2edataset ~/.vnc/passwd

# Cleanup
RUN apt-get autoremove --purge

RUN mkdir /home/dataset/logs

ENV PATH=/usr/local/lib/nodejs/node-v8.17.0-linux-x64/bin:$PATH

WORKDIR /home/dataset

ADD entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
