# Build
FROM golang:latest AS build
ADD . /app
WORKDIR /app
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .

# Production
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /main ./
RUN chmod +x ./main
ENTRYPOINT ["./main"]