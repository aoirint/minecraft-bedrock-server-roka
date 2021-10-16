.PHONY: backup
backup:
	zip -r "data_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data"

.PHONY: backup-worlds
backup-worlds:
	zip -r "data_worlds_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data/worlds"

