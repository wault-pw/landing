ARG BUILD=klakegg/hugo
ARG ISO=nginx

FROM ${BUILD} as build
ARG HUGO_DISABLELANGUAGES
ARG HUGO_LANGUAGES_RU_email
ARG HUGO_LANGUAGES_RU_cdnURL
ARG HUGO_LANGUAGES_RU_yandexMetrics
ARG HUGO_LANGUAGES_RU_googleAnalytics
ARG HUGO_LANGUAGES_RU_baseURL
ARG HUGO_LANGUAGES_RU_preconnect
ARG HUGO_LANGUAGES_RU_dnsPrefetch
ARG HUGO_LANGUAGES_RU_loginURL
ARG HUGO_LANGUAGES_RU_joinURL
WORKDIR /app
COPY . .
RUN hugo --minify

# nginx is used to serve pages
FROM ${ISO} as iso
WORKDIR /app
COPY --from=build /app/public .
COPY docker/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/docker-entrypoint.sh"]
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]
