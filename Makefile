migrateup:
	sudo migrate -path db/migration -database "postgresql://root:ko@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	sudo migrate -path db/migration -database "postgresql://root:ko@localhost:5432/simple_bank?sslmode=disable" -verbose down


postgres:
	sudo docker run --name postgres1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=ko -d postgres

createdb:
	sudo docker exec -it postgres1 createdb --username=root --owner=root simple_bank

dropdb:
	sudo docker exec -it postgres1 dropdb simple_bank

sqlc:
	sqlc generate

.PHONY: createdb dropdb sqlc postgres migrateup migratedown