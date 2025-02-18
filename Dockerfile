FROM ubuntu:16.04

LABEL maintainer="Danny Tran <dantran@hmc.edu>"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

#RUN pip3 install --upgrade pip==20.2.4
RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
