.PHONY: files api start-files start-api

all: files api

files:
	cd frontend && npm run build
	go build ./cmd/pt-files

api:
	go build ./cmd/pt-api

start-files:
	pkill -fx "./pt-files --port 8065" || true
	nohup ./pt-files --port 8065 &> files.log &

start-api:
	pkill -fx "./pt-api serve --http 127.0.0.1:8066" || true
	nohup ./pt-api serve --http 127.0.0.1:8066 &> api.log &
