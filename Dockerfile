FROM python:3.6-alpine

RUN apk add --no-cache libpng-dev freetype-dev
RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN apk add --no-cache g++
RUN pip install numpy==1.9.3
RUN pip install matplotlib

RUN apk add --no-cache openssl
RUN apk add --no-cache autoconf
RUN mkdir /tmp/x11vnc && \
  cd /tmp/x11vnc && \
  wget https://github.com/LibVNC/x11vnc/archive/0.9.14.tar.gz && \
  tar zxvf 0.9.14.tar.gz
RUN apk add --no-cache automake
RUN apk add --no-cache libx11-dev
RUN apk add --no-cache libvncserver-dev
RUN cd /tmp/x11vnc/x11vnc-0.9.14 && \
  autoreconf -fi && \
  ./configure --prefix=/usr --mandir=/usr/share/man
RUN apk add --no-cache make
RUN cd /tmp/x11vnc/x11vnc-0.9.14 && \
  make -j4 && \
  make install

RUN apk add --no-cache xvfb
