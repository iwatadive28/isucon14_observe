from ubuntu:24.04

RUN apt-get update && \
    apt-get install graphviz gv wget ca-certificates --no-install-recommends -y  &&\
    apt-get -y clean &&\
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/tkuchiki/slp/releases/download/v0.2.0/slp_linux_amd64.tar.gz
RUN tar -xvf slp_linux_amd64.tar.gz
RUN mv slp /usr/local/bin/slp

RUN wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.tar.gz
RUN tar -xvf alp_linux_amd64.tar.gz
RUN mv alp /usr/local/bin/alp

RUN wget https://github.com/kaz/pprotein/releases/download/v1.2.3/pprotein_1.2.3_linux_amd64.tar.gz
RUN tar -xvf pprotein_1.2.3_linux_amd64.tar.gz
RUN mv pprotein /usr/local/bin/pprotein

WORKDIR /data

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/pprotein" ]
