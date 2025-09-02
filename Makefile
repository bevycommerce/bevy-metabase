.PHONY: up down wipe reset backup restore dblogs applogs dblogsf applogsf
up:
	docker compose up --build -d

down:
	docker compose down

wipe:
	docker compose down -v

reset:
	docker system prune -a -f && docker volume prune -f

backup:
	docker exec -e PGPASSWORD=mysecretpassword postgres /usr/bin/pg_dump -U metabase --clean metabaseappdb > metabase_backup.sql

restore:
	docker cp metabase_backup.sql postgres:/tmp/metabase_backup.sql
	docker exec -e PGPASSWORD=mysecretpassword postgres psql -U metabase -d metabaseappdb -f /tmp/metabase_backup.sql

dblogs:
	docker compose logs postgres

applogs:
	docker compose logs metabase

dblogsf:
	docker compose logs postgres -f

applogsf:
	docker compose logs metabase -f
