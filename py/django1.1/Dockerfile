FROM python:2.7.18-slim-stretch as base
WORKDIR /wheels
COPY ./requirements.txt .
RUN apt-get update && \
    apt-get install -y \
	default-libmysqlclient-dev \
	libmariadbclient18 \
	gcc
RUN pip install -U pip \
	&& pip install --no-cache-dir wheel \
	&& pip wheel --no-cache-dir --wheel-dir=/wheels -r requirements.txt
FROM python:2.7.18-slim-stretch
ENV PYTHONUNBUFFERED 1
COPY --from=base /wheels /wheels
COPY --from=base /usr/lib/x86_64-linux-gnu/libmariadbclient.so.18.0.0 /usr/lib/x86_64-linux-gnu/
RUN pip install -U pip \
	&& pip install -f /wheels -r /wheels/requirements.txt \
	&& rm -rf /wheels \
	&& rm -rf /root/.cache/pip/* \
	&& ln -sf /usr/lib/x86_64-linux-gnu/libmariadbclient.so.18.0.0 /usr/lib/x86_64-linux-gnu/libmariadbclient.so.18
WORKDIR /data
ENV UWSGI_INI=""
ENTRYPOINT ["sh", "-c", "uwsgi", "--ini", "$UWSGI_INI"]
