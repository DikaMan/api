FROM python:3.11

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

RUN pip install Flask==2.2.3 uWSGI==2.0.21 requests==2.28.2 redis==4.5.4

WORKDIR /app

COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191

USER uwsgi

CMD ["/cmd.sh"]

