FROM ubuntu:18.04
MAINTAINER kp <dockerkp@gmail.com>

WORKDIR /root

RUN apt update -qq && apt-get install wget -yqq && \
  wget  https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v0.15.1/qtum-0.15.1-x86_64-linux-gnu.tar.gz -q && \
  tar -zxf qtum-0.15.1-x86_64-linux-gnu.tar.gz && \
  rm  qtum-0.15.1-x86_64-linux-gnu.tar.gz && \
  mv qtum-0.15.1 qtumcore

RUN cp qtumcore/bin/* /usr/local/bin

VOLUME ["/opt/qtumcore"]

EXPOSE 3888 3889 13888 13889 23888

CMD ["qtumd", "--conf=/opt/qtumcore/qtum.conf", "--printtoconsole"]
