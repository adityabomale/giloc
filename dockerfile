FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install cron
RUN apt-get install -y vim
ENTRYPOINT ["mkdir", "/cronfiles"]
WORKDIR /cronfiles
COPY script.sh /cronfiles/script.sh
CMD ["cp", "hello-cron", "/etc/cron.d/hello-cron"]
CMD ["chmod", "0644", "/etc/cron.d/hello-cron"]
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log
