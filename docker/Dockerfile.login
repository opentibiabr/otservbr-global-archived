FROM python:3

WORKDIR /usr/src/app

RUN pip install --no-cache-dir Flask mysql-connector-python

COPY ./data/login.py .

CMD [ "python", "./login.py" ]
