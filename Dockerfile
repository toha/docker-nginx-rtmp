FROM ubuntu:14.04

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get update && apt-get -y install build-essential libpcre3 libpcre3-dev libssl-dev wget unzip && \
    wget http://nginx.org/download/nginx-1.9.5.tar.gz && \
    wget https://github.com/arut/nginx-rtmp-module/archive/master.zip && \
    tar -zxvf nginx-1.9.5.tar.gz && \
    unzip master.zip && \
    cd nginx-1.9.5 && \
      ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master && \
      make && \
      make install

ADD nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 1935

CMD ["/usr/local/nginx/sbin/nginx"]
