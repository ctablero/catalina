ARG IMAGE_NAME
ARG IMAGE_TAG

FROM ${IMAGE_NAME}:${IMAGE_TAG}

RUN mkdir -p /usr/config
WORKDIR /usr/config

COPY . /usr/config

ENTRYPOINT [ "./entrypoint.sh" ]
