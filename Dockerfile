FROM golang:1.12.1-alpine3.9
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN apk add --no-cache git
RUN go build -o main .
RUN apk del git
CMD ["/app/main"]