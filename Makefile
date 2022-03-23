REGISTRY_DOMAIN=ghcr.io
REGISTRY_NAME=ghcr.io/wault-pw/landing
VERSION:=$(shell cat VERSION)

build: export TAG=$(VERSION)
build:
	docker build --no-cache -f ./Dockerfile -t ${REGISTRY_NAME}:${TAG} \
		--build-arg HUGO_DISABLELANGUAGES=cn \
		\
		--build-arg HUGO_LANGUAGES_EN_email=support@wault.pw \
		--build-arg HUGO_LANGUAGES_EN_yandexMetrics=88004695 \
		--build-arg HUGO_LANGUAGES_EN_googleAnalytics=G-YF1K8JKP40 \
		--build-arg HUGO_LANGUAGES_EN_cdnURL=https://d05331.wault.pw \
		--build-arg HUGO_LANGUAGES_EN_baseURL=https://www.wault.pw \
		--build-arg HUGO_LANGUAGES_EN_dnsPrefetch=https://d05331.wault.pw,https://cloud.wault.pw,https://mc.yandex.com,https://www.googletagmanager.com \
		--build-arg HUGO_LANGUAGES_EN_preconnect=https://d05331.wault.pw,https://mc.yandex.com,https://www.googletagmanager.com \
		--build-arg HUGO_LANGUAGES_EN_loginURL=https://cloud.wault.pw/ \
		--build-arg HUGO_LANGUAGES_EN_joinURL=https://cloud.wault.pw/#/join \
		\
		--build-arg HUGO_LANGUAGES_RU_email=support@wault.ru \
		--build-arg HUGO_LANGUAGES_RU_yandexMetrics=87936217 \
		--build-arg HUGO_LANGUAGES_RU_googleAnalytics=G-93PBXT39JQ \
		--build-arg HUGO_LANGUAGES_RU_cdnURL=https://a4f523.wault.ru \
		--build-arg HUGO_LANGUAGES_RU_baseURL=https://www.wault.ru \
		--build-arg HUGO_LANGUAGES_RU_dnsPrefetch=https://a4f523.wault.ru,https://cloud.wault.ru,https://mc.yandex.com,https://www.googletagmanager.com \
		--build-arg HUGO_LANGUAGES_RU_preconnect=https://a4f523.wault.ru,https://mc.yandex.com,https://www.googletagmanager.com \
		--build-arg HUGO_LANGUAGES_RU_loginURL=https://cloud.wault.ru/ \
		--build-arg HUGO_LANGUAGES_RU_joinURL=https://cloud.wault.ru/#/join \
		.
	docker tag ${REGISTRY_NAME}:${TAG} ${REGISTRY_NAME}:latest

push: export TAG=$(VERSION)
push:
	docker push ${REGISTRY_NAME}:${TAG}
	docker push ${REGISTRY_NAME}:latest
