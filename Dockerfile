FROM ubuntu:18.04
MAINTAINER kp <dockerkp@gmail.com>

WORKDIR /root
RUN apt update
RUN apt-get install -y wget
RUN wget  https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v0.14.14/qtum-0.14.14-x86_64-linux-gnu.tar.gz
RUN tar -zvxf qtum-0.14.14-x86_64-linux-gnu.tar.gz
RUN rm  qtum-0.14.14-x86_64-linux-gnu.tar.gz
RUN ls
RUN mv qtum-0.14.14 qtumcore
RUN cp qtumcore/bin/* /usr/local/bin

VOLUME ["/opt/qtumcore"]

EXPOSE 3888 3889 13888 13889 23888

CMD ["qtumd", "--conf=/opt/qtumcore/qtum.conf", "--printtoconsole"]
