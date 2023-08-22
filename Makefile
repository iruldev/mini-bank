include .env

migrate-up:
	migrate -path ${DB_MIGRATION} -database "mysql://${DB_USER}:${DB_PASS}@tcp(${DB_HOST})/${DB_NAME}?parseTime=true" -verbose up

migrate-down:
	migrate -path ${DB_MIGRATION} -database "mysql://${DB_USER}:${DB_PASS}@tcp(${DB_HOST})/${DB_NAME}?parseTime=true" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: migrate-up migrate-down sqlc test