FROM debian

RUN apt-get update && apt-get install -y cron supervisor

EXPOSE 80

### APPLICATION CODE ###
COPY ./app /srv/test

### SUPPORTIVE SERVICES ###
ENV FILES_DIR ./container/files

# cron setup
COPY $FILES_DIR/etc/cron.d/test-command /etc/cron.d/test-command

# supervisor setup
COPY $FILES_DIR/etc/supervisor/conf.d /etc/supervisor/conf.d

### RUNNING IT OUT ###
CMD ["supervisord", "-n"]