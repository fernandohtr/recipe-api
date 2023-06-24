build:
	docker compose build

lint:
	docker compose run --rm app poetry run flake8

test:
	docker compose run --rm app poetry run python app/manage.py test

start:
	docker compose up -d

stop:
	docker compose stop
