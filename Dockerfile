FROM golang:1.12-alpine as builder
RUN apk add git
ENV GO111MODULE=on
COPY . /go/src/shu-volunteer
WORKDIR /go/src/shu-volunteer
RUN go get && go build


FROM alpine:latest
COPY --from=builder /go/src/shu-volunteer/shu-volunteer /shu-volunteer
WORKDIR /
CMD ./shu-volunteer
EXPOSE 8001