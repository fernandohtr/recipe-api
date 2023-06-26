FROM python:3.9-alpine

ENV PYTHONUNBUFFERED=1

RUN apk add poetry && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        python3-dev \
        libpq-dev \
        build-base \
        postgresql-dev \
        musl-dev && \
    poetry config virtualenvs.in-project true && \
    apk del .tmp-build-deps

RUN adduser \
        --disabled-password \
    django-user

USER django-user

WORKDIR /recipe-api

COPY . .

RUN poetry install --no-interaction --no-ansi

CMD ["poetry", "run", "python", "app/manage.py", "runserver", "0.0.0.0:8000"]
