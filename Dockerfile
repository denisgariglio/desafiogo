FROM golang:1.13-alpine3.11
WORKDIR /go/src/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /
COPY --from=0 /go/src/app /
CMD ["/app"]