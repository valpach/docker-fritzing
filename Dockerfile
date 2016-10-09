FROM ubuntu:16.04
RUN \
apt-get update && \
apt-get install -y aptitude build-essential git cmake libssl-dev libudev-dev qt5-default libqt5serialport5-dev libqt5svg5-dev  wget unzip && \
rm -rf /var/lib/apt/lists/*

# Create a user
RUN adduser fritzing
USER fritzing
ENV HOME /home/fritzing
CMD []


WORKDIR /home/fritzing
RUN wget http://fritzing.org/download/0.9.3b/linux-64bit/fritzing-0.9.3b.linux.AMD64.tar.bz2 -O /home/fritzing/fritzing.tar.bz2 && \
    tar xjv -f /home/fritzing/fritzing.tar.bz2 -C /home/fritzing && rm -f /home/fritzing/fritzing.tar.bz2 \
    mkdir /home/fritzing/docs

RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/CircuitPlayground.fzbz -O /home/fritzing/CircuitPlayground.fzbz 
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/Adafruit%20Raspberry%20Pi.fzbz -O /home/fritzing/Adafruit_Raspberry_Pi.fzbz
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/Adafruit%20Arduino.fzbz -O /home/fritzing/Adafruit_Arduino.fzbz
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/Adafruit%20Batteries.fzbz -O  /home/fritzing/Adafruit_Batteries.fzbz
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/Adafruit%20Feather.fzbz -O /home/fritzing/Adafruit_Feather.fzbz
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/Adafruit%20LED%20Backpacks.fzbz -O /home/fritzing/Adafruit_Backpacks.fzbz
RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/AdaFruit.fzbz -O /home/fritzing/Adafruit.fzbz


#RUN wget https://github.com/adafruit/Fritzing-Library/raw/master/AdaFruit.fzbz  -O /home/fritzing/AdaFruit.fzbz 
#    wget https://github.com/adafruit/Fritzing-Library/archive/master.zip  -O /home/fritzing/Fritzing-Library-master.zip && \
#    unzip  /home/fritzing/Fritzing-Library-master.zip && mv Fritzing-Library-master /home/fritzing/fritzing-0.9.3b.linux.AMD64/&& rm -f /home/fritzing/Fritzing-Library-master.zip 

VOLUME /home/fritzing/docs
WORKDIR /home/fritzing/docs

ENTRYPOINT ["/home/fritzing/fritzing-0.9.3b.linux.AMD64/Fritzing", ""]

