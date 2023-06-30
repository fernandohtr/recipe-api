build:
	docker compose build

lint:
	docker compose run --rm app poetry run flake8

logs:
	docker compose logs -f

test:
	docker compose run --rm -w /recipe-api/app app poetry run python manage.py test

test_ci:
	docker compose run --rm -w /recipe-api/app app sh -c "poetry run python manage.py wait_for_db && poetry run python manage.py test"

start:
	docker compose up -d

stop:
	docker compose stop

down:
	docker compose down
