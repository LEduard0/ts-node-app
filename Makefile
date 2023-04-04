TSURU_APP="edg-tsuruexampleterra2-gcp-dev"

install:
	yarn 

build:
	yarn build

dev:
	yarn dev

tsuru-deploy:
	tsuru app deploy -a ${TSURU_APP} Procfile dist
