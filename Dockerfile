FROM golang:1.17
LABEL PROJECT="konfig-deployer"

COPY src /go/src/konfig-deployer/
WORKDIR /go/src/konfig-deployer/

RUN go get -d

RUN go install

RUN mkdir -p bin
RUN go build -o bin/

ENTRYPOINT ["/go/src/konfig-deployer/bin/konfig-deployer"]