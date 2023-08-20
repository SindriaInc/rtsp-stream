ARG TAG_SUFFIX
FROM roverr/rtsp-stream:${TAG_SUFFIX}

ARG TAG_VERSION
ARG TAG_SUFFIX
ARG HOST_USER_UID
ARG TIMEZONE

LABEL org.opencontainers.image.authors="Sindria Inc. <info@sindria.org>"

LABEL \
	name="rtsp-stream" \
	image="sindriainc/rtsp-stream" \
	tag="${TAG_VERSION}-${TAG_SUFFIX}" \
	vendor="sindria"

ENV TZ=${TIMEZONE}

# Setting timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY resources/rtsp-stream.yml /app/rtsp-stream.yml