ARG TAG_SUFFIX
FROM roverr/rtsp-stream:${TAG_SUFFIX}-management

ARG TAG_VERSION
ARG TAG_SUFFIX
ARG HOST_USER_UID
ARG TIMEZONE
ARG API_URL

LABEL org.opencontainers.image.authors="Sindria Inc. <info@sindria.org>"

LABEL \
	name="rtsp-stream" \
	image="sindriainc/rtsp-stream" \
	tag="${TAG_VERSION}-${TAG_SUFFIX}" \
	vendor="sindria"

ENV TZ=${TIMEZONE}
ENV API_URL=${API_URL}

# Setting timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY resources/rtsp-stream.yml /app/rtsp-stream.yml
COPY resources/supervisord.conf /etc/supervisord.conf

WORKDIR /ui

RUN sed -i -E "s|http://localhost:8080|${API_URL}|g" /ui/src.c5a74639.js
RUN sed -i -E "s|http://127.0.0.1:8080|${API_URL}|g" /ui/src.c5a74639.js

RUN sed -i -E "s|http://localhost:8080|${API_URL}|g" /ui/src.d0db01b6.js
RUN sed -i -E "s|http://127.0.0.1:8080|${API_URL}|g" /ui/src.d0db01b6.js

RUN sed -i -E "s|http://localhost:8080|${API_URL}|g" /ui/src.e31bb0bc.js
RUN sed -i -E "s|http://127.0.0.1:8080|${API_URL}|g" /ui/src.e31bb0bc.js

RUN sed -i -E "s|http://localhost:8080|${API_URL}|g" /ui/src.e9e1b0c6.js
RUN sed -i -E "s|http://127.0.0.1:8080|${API_URL}|g" /ui/src.e9e1b0c6.js