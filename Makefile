.PHONY: backup-all
backup-all:
	zip -r "backups/data_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data"

.PHONY: backup-worlds
backup-worlds:
	zip -r "backups/data_worlds_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data/worlds"

