FROM ubuntu:14.04
MAINTAINER Ciprian Ciubotariu <ciprianc@gmail.com>

# Install needed OS packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install python-pip python-virtualenv python-dev curl
RUN rm -rf /var/lib/apt/lists/*

# Add this folder to /app
ADD / /app

# Install required pips
RUN pip install -q --upgrade -r /app/requirements.txt

# Expose port from inside the container
EXPOSE 8000

# CWD into the application folder
WORKDIR /app

# Run the app
CMD gunicorn --pythonpath hello_flask hello_flask_web:app -b 0.0.0.0:8000 -k gevent --log-config logging.config
