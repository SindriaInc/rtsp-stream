FROM sindriainc/python:3.0.0-3.10

ARG TAG_VERSION
ARG HOST_USER_UID
ARG TIMEZONE

LABEL org.opencontainers.image.authors="Sindria Inc. <info@sindria.org>"

LABEL \
	name="rtsp-stream" \
	image="sindriainc/rtsp-stream" \
	tag="${TAG_VERSION}-job" \
	vendor="sindria"

ENV TZ=${TIMEZONE}

# Setting timezone and folders
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    mkdir -p /app && \
    mkdir -p /app/videos

WORKDIR /app

COPY resources/job.sh /usr/local/bin/job.sh
CMD ["/bin/bash", "/usr/local/bin/job.sh"]

ENTRYPOINT [""]