FROM golang:1.22.2-alpine3.19 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build ./assume-role.go
RUN go build ./client-grants.go
RUN go build ./custom-token-identity.go
RUN go build ./ldap.go
RUN go build ./web-identity.go


FROM alpine:3.19

COPY --from=builder /app/assume-role /usr/local/bin/assume-role
COPY --from=builder /app/client-grants /usr/local/bin/client-grants
COPY --from=builder /app/custom-token-identity /usr/local/bin/custom-token-identity
COPY --from=builder /app/ldap /usr/local/bin/ldap
COPY --from=builder /app/web-identity /usr/local/bin/web-identity
