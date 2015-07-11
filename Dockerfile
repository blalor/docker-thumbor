FROM blalor/supervised:latest
MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 80

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

## ENV SECURITY_KEY
## ENV AWS_ACCESS_KEY
## ENV AWS_SECRET_KEY
## ENV RESULT_STORAGE_BUCKET
## ENV S3_LOADER_BUCKET
