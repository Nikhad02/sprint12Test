FROM golang:1.25-alpine

WORKDIR /app

COPY go.mod ./


RUN go mod download

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

CMD ["/main"]