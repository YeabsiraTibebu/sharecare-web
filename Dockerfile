FROM node:12-alpine

ENV PORT=80 

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="MY_VALUE" \
      org.opencontainers.image.description="MY_VALUE" \
      org.opencontainers.image.authors="MY_VALUE" \
      org.opencontainers.image.vendor="MY_VALUE"

# add debugging utilities
RUN apk --no-cache add \
  curl \
  ca-certificates \
  jq \
  less \
  vim

# bundle app and install dependencies 
COPY . /app
WORKDIR /app
RUN npm install

# run application
EXPOSE $PORT
CMD npm start
