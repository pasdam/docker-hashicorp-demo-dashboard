FROM golang:1.14.4-alpine3.12 as builder

WORKDIR /tmp

RUN apk update && \
    apk add git

RUN go get github.com/GeertJohan/go.rice && \
    go get github.com/GeertJohan/go.rice/rice

RUN git clone https://github.com/hashicorp/demo-consul-101.git && \
    cd demo-consul-101/services/dashboard-service && \
    go mod init main && \
    rice embed-go && \
    go build .

FROM alpine:3.12.0

COPY --from=builder /tmp/demo-consul-101/services/dashboard-service/main /usr/bin/dashboard-service

EXPOSE 80

CMD [ "/usr/bin/dashboard-service" ]
