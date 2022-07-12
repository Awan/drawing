# LABEL maintainer="Abdullah Khabir <abdullah at abdullah dot today"

FROM klakegg/hugo as hugo

COPY ./ /hugodir

WORKDIR /hugodir

RUN hugo --config ./config.toml

FROM nginx:alpine

COPY --from=hugo /hugodir/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
