ARG BUILD=klakegg/hugo
ARG ISO=nginx:alpine

FROM ${BUILD} as build
ARG HUGO_DISABLELANGUAGES

ARG HUGO_LANGUAGES_EN_email
ARG HUGO_LANGUAGES_EN_cdnURL
ARG HUGO_LANGUAGES_EN_yandexMetrics
ARG HUGO_LANGUAGES_EN_googleAnalytics
ARG HUGO_LANGUAGES_EN_baseURL
ARG HUGO_LANGUAGES_EN_preconnect
ARG HUGO_LANGUAGES_EN_dnsPrefetch
ARG HUGO_LANGUAGES_EN_loginURL
ARG HUGO_LANGUAGES_EN_joinURL

ARG HUGO_LANGUAGES_RU_email
ARG HUGO_LANGUAGES_RU_cdnURL
ARG HUGO_LANGUAGES_RU_yandexMetrics
ARG HUGO_LANGUAGES_RU_googleAnalytics
ARG HUGO_LANGUAGES_RU_baseURL
ARG HUGO_LANGUAGES_RU_preconnect
ARG HUGO_LANGUAGES_RU_dnsPrefetch
ARG HUGO_LANGUAGES_RU_loginURL
ARG HUGO_LANGUAGES_RU_joinURL

ARG HUGO_LANGUAGES_ZH_email
ARG HUGO_LANGUAGES_ZH_cdnURL
ARG HUGO_LANGUAGES_ZH_yandexMetrics
ARG HUGO_LANGUAGES_ZH_googleAnalytics
ARG HUGO_LANGUAGES_ZH_baseURL
ARG HUGO_LANGUAGES_ZH_preconnect
ARG HUGO_LANGUAGES_ZH_dnsPrefetch
ARG HUGO_LANGUAGES_ZH_loginURL
ARG HUGO_LANGUAGES_ZH_joinURL

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
