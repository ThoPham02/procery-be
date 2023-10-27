FROM golang:1.20.1-alpine3.17 AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o main main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz

# run stage
FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/migrate ./migrate
COPY --from=builder /app/etc ./etc
COPY /migration ./migration
COPY start.sh .
RUN chmod +x /app/start.sh
ENV DB_SOURCE=postgres://thopham:hdp0pylJq8EoLvAy8gI15XWU4vytfabF@dpg-ck0hgej6fquc73e0nkl0-a.singapore-postgres.render.com/grocery_db
EXPOSE 8080

ENTRYPOINT [ "/app/start.sh" ]
CMD [ "/app/main" ]