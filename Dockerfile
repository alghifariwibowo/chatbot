#Python image use.
FROM python:3.10


ENV PYTHONUNBUFFERED True

# Copy the local code to the container image
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# install all required packages specified in requirement.txt
RUN pip install -r requirement.txt

# Run web service on container using gunicorn
CMD exec gunicorn --bind :8080 --workers 1 --threads 8 --timeout 0 main:app