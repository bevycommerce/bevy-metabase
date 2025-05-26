.PHONY: up down wipe reset
up:
	docker compose up --build -d

down:
	docker compose down

wipe:
	docker compose down -v

reset:
	docker system prune -a -f && docker volume prune -f

backup:
	docker exec -e PGPASSWORD=admin pg-importer-db-1 /usr/bin/pg_dump -U admin --clean mydatabase > backup.sql

restore:
	docker cp backup.sql pg-importer-db-1:/tmp/backup.sql
	docker exec -e PGPASSWORD=admin pg-importer-db-1 psql -U admin -d mydatabase -f /tmp/backup.sql

dblogs:
	docker compose logs db

pgalogs:
	docker compose logs pgadmin

dblogsf:
	docker compose logs db -f

pgalogsf:
	docker compose logs pgadmin -f
