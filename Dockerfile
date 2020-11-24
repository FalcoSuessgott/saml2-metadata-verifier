FROM alpine:3.12
MAINTAINER tom-morelly@gmx.de

ENV PATH /saml:$PATH

RUN apk add --update make curl gcc alpine-sdk autoconf automake libtool
RUN curl -L ftp://xmlsoft.org/libxml2/LATEST_LIBXML2 | tar xzf -
RUN libxml2*/configure --prefix=/usr  --enable-static --with-threads --with-history
RUN make \
  && make install

WORKDIR /saml
COPY Makefile Makefile
COPY saml2-metadata-verifier.sh saml2-metadata-verifier.sh
RUN make 

ENTRYPOINT ["/bin/sh", "saml2-metadata-verifier.sh", "-f"]
CMD ["-h"]
