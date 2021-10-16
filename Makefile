.PHONY: backup
backup:
	zip -r "data_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data"

