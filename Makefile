build:
	docker compose build

flake:
	docker compose run --rm app poetry run flake8

start:
	docker compose up -d

stop:
	docker compose stop
