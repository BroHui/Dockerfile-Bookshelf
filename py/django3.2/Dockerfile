FROM python:3.7.9-slim-buster as base
WORKDIR /wheels
COPY ./requirements.txt .
RUN apt-get update && \
    apt-get install -y \
	default-libmysqlclient-dev \
	libmariadb3 \
	gcc
RUN pip install -U pip \
	&& pip install --no-cache-dir wheel \
	&& pip wheel --no-cache-dir --wheel-dir=/wheels -r requirements.txt

FROM node:12 as modules
WORKDIR /temp_node_modules
COPY ./package.json .
RUN npm install

FROM python:3.7.9-slim-buster 
ENV PYTHONUNBUFFERED 1
WORKDIR /usr/src/app
COPY --from=base /wheels /wheels
COPY --from=base /usr/lib/x86_64-linux-gnu/libmariadb.so.3 /usr/lib/x86_64-linux-gnu/
COPY --from=modules /temp_node_modules/node_modules /usr/src/node_modules
RUN pip install -U pip \
	&& pip install -f /wheels -r /wheels/requirements.txt \
	&& rm -rf /wheels \
	&& rm -rf /root/.cache/pip/*
EXPOSE 8080 8081
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
CMD ["uwsgi", "--ini", "uwsgi.ini"]
