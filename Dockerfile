# Dockerfile
FROM python:3.15.0a7-slim

LABEL maintainer="wei <shi493953@gmail.com>"

ARG ROOT_DIR=/app

ENV ROOT=${ROOT_DIR} \
	PYTHONENCONDING=utf-8 \
	PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1
	
COPY requirements.txt ${ROOT_DIR}/requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

RUN mkdir -p "${ROOT_DIR}/src/static/config" && \
	mkdir -p "${ROOT_DIR}/src/static/data"
	
COPY src/*.py	${ROOT_DIR}/src/

WORKDIR /app

EXPOSE 5000

#CMD ["python3", "src/app.py"]
CMD	python3 src/app.py