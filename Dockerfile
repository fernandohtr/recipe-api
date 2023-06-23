FROM python:3.11-alpine

ENV PYTHONUNBUFFERED=1

RUN apk add poetry \
    && poetry config virtualenvs.in-project true

RUN adduser \
        --disabled-password \
    django-user

USER django-user

WORKDIR /recipe-api

COPY . .

RUN poetry install --no-interaction --no-ansi

CMD ["poetry", "run", "python", "app/manage.py", "runserver", "0.0.0.0:8000"]
