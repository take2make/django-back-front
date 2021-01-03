FROM python:3.8.7-slim as production

ENV PYTHONUNBUFFERED=1
WORKDIR /app/

RUN apt-get update &&\
    apt-get install -y\
    bash\
    build-essential\
    gcc\
    libffi-dev\
    musl-dev\
    openssl\
    postgresql\
    libpq-dev

COPY requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt

COPY manage.py ./manage.py
COPY setup.cfg ./setup.cfg
COPY website ./website

EXPOSE 8000
