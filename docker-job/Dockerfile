FROM alpine:latest

COPY ./job.sh /etc/periodic/15min/job
RUN chmod +x /etc/periodic/15min/job

CMD ["crond", "-fS"]
