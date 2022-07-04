FROM acockburn/appdaemon:4.2.1

ARG source_commit
ARG docker_tag
ARG image_name

COPY requirements.txt /tmp/requirements.txt
RUN apk add --no-cache libxml2 libxml2-dev libxslt-dev jpeg-dev
RUN pip3 install --no-cache-dir --upgrade -r /tmp/requirements.txt
RUN pip3 freeze

LABEL org.label-schema.name="$image_name" \
      org.label-schema.url="https://github.com/jantman/docker-appdaemon" \
      org.label-schema.vcs-url="https://github.com/jantman/docker-appdaemon" \
      org.label-schema.vcs-ref="$source_commit" \
      org.label-schema.version="$docker_tag" \
      org.label-schema.schema-version="1.0"
