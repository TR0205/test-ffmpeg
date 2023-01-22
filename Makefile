up: ## Set up container
	docker compose up -d
ffmpeg: ## Attach container
	docker compose exec ffmpeg sh
tile: ## Generate tile image
	docker compose exec ffmpeg ffmpeg -i data/ffmpeg-test.mp4 -vf "select=not(mod(n\,24)),scale=160:90,tile=5x5" -frames:v 1 data/tile3.png
help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'