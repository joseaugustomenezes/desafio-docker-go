FROM golang:alpine as builder

WORKDIR src/

COPY . .

RUN go mod init zehmenezes/fullcycle && \
    go mod tidy && \
    go build -o /bin/fullcycle ./main.go


FROM scratch

COPY --from=0 /bin/fullcycle /bin/fullcycle

ENTRYPOINT ["/bin/fullcycle"]