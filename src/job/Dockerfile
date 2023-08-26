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

# Setting timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["/bin/bash", "rm", "-Rf", "/app/videos/*"]

ENTRYPOINT [""]