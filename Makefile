build:
	docker compose build

flake:
	docker compose run --rm app sh -c "flake8"

start:
	docker compose up -d

stop:
	docker compose down
