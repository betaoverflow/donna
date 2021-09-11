FROM golang:latest

ENV GO111MODULE=on

WORKDIR /app

COPY ./go.mod .
COPY ./go.sum .

RUN go mod download
RUN go get github.com/pilu/fresh

COPY . .
CMD ["fresh"]