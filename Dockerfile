FROM golang:1.9.0-alpine3.6
MAINTAINER I-Chiao Hsu <ichiao.hsu@gmail.com>

RUN apk add --update git
RUN go get -u github.com/gin-gonic/gin
RUN go get -u github.com/itsjamie/gin-cors
RUN go get -u github.com/go-sql-driver/mysql
RUN git clone https://github.com/mirror-media/mm-rest.git
RUN env GOOS=linux GOARCH=amd64 go build -o /mmserver ./mm-rest/server/server.go
RUN export GIN_MODE=release

VOLUME /var/log
EXPOSE 8080

CMD ["/mmserver", "--sql-address=", "--sql-auth=", "--sql-user=", "--mailchimp-token="]
