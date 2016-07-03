FROM resin/raspberrypi3-debian:jessie

ENV INITSYSTEM on

WORKDIR /usr/src/app

# Install dependencies and then clean up
RUN apt-get update && apt-get install -y \
  bluetooth \
  bluez \
  bluez-firmware && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy files over
COPY . ./

# Start app
CMD ["bash", "start.sh"]