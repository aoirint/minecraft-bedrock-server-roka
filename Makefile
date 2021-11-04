MESSAGE=テストメッセージ
GAMER_TAG=

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
	@echo "say $(MESSAGE)" > /proc/$(PID)/fd/0

.PHONY: list
list:
	@$(eval PID := $(shell docker-compose top | grep bedrock_server | awk '{ print $$2 }'))
	@echo "list" > /proc/$(PID)/fd/0
	@docker-compose logs --no-log-prefix --tail=20 server | tac | grep -Pzo '(.*)\nThere are .*/.* players online:' | head -n1

.PHONY: whitelist-add
whitelist-add:
	$(eval PID := $(shell docker-compose top | grep bedrock_server | awk '{ print $$2 }'))
	echo "whitelist add $(GAMER_TAG)" > /proc/$(PID)/fd/0

.PHONY: players-online
players-online:
	@python3 -c 'from mcstatus import MinecraftBedrockServer; print(MinecraftBedrockServer.lookup("127.0.0.1:19132").status().players_online)'

.PHONY: dump-logs
dump-logs:
	docker-compose logs -t > logs/$(shell date '+%Y-%m-%d_%H%M%S').log

