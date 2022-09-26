# Pull base image
FROM python:3.9-alpine
# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# prepare working directories
RUN mkdir /code
RUN mkdir /reqs
# copy requirements into the container
COPY requirements.txt /reqs
# change directory to working directory
WORKDIR /code/
RUN apk update && apk add --no-cache g++ make libffi-dev musl-dev postgresql-dev
#Upgrade pip
RUN python3 -m pip install --upgrade pip
# Install dependencies
RUN pip3 install -r requirements.txt --no-cache-dir
# Define container starting point
#ENTRYPOINT gunicorn -b 0.0.0.0:5001 -w 4 authserver:app
ENTRYPOINT gunicorn introducer.wsgi:application -w 4 -k uvicorn.workers.UvicornWorker
#comment in production!
#EXPOSE 8000