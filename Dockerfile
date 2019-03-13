FROM alpine

RUN apk --quiet upgrade && \
    apk --quiet add bash

WORKDIR /dtm

COPY ./main.sh .
COPY ./lib ./lib
COPY ./tools ./tools
RUN /bin/bash ./main.sh
# RUN rm -rf ./lib ./tools

# for man
ENV PAGER less

ENTRYPOINT ["ls", "-1", "./tools"]
