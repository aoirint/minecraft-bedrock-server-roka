MESSAGE=テストメッセージ

.PHONY: backup-all
backup-all:
	zip -r "backups/data_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data"

.PHONY: backup-worlds
backup-worlds:
	zip -r "backups/data_worlds_$(shell date '+%Y-%m-%d_%H%M%S').zip" "./data/worlds"

.PHONY: get-pid
get-pid:
	@echo $(shell docker-compose top | grep bedrock_server | awk '{ print $$2 }')

.PHONY: say
say:
	$(eval PID := $(shell docker-compose top | grep bedrock_server | awk '{ print $$2 }'))
	echo "say $(MESSAGE)" > /proc/$(PID)/fd/0

.PHONY: list
list:
	$(eval PID := $(shell docker-compose top | grep bedrock_server | awk '{ print $$2 }'))
	echo "list" > /proc/$(PID)/fd/0

