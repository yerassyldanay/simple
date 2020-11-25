postgres:
	docker pull postgres:11-alpine && docker run --name simple_postgres -p 0.0.0.0:8001:5432 -e POSTGRES_PASSWORD=simple -e POSTGRES_USER=simple -e POSTGRES_USER=simple -d postgres:11-alpine

postgres_delete:
	docker stop simple_postgres && docker rm simple_postgres

postgres_logs:
	docker logs simple_postgres -f --tail=30

postgres_up:
	migrate -path /home/yerassyl/go/src/simple/database/postgres -database postgres://simple:simple@localhost:8001/simple?sslmode=disable -verbose up

postgres_down:
	migrate -path /home/yerassyl/go/src/simple/database/postgres -database postgres://simple:simple@localhost:8001/simple?sslmode=disable -verbose down

generate:
	sqlc generate

.PHONY: postgres postgres_delete postgres_logs postgres_up postgres_down generate

