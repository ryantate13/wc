SHELL = bash
PROJECTS := $(shell find . -type f -name Dockerfile | xargs -n 1 dirname | xargs -n 1 basename | sort)
SEP := =================
TEST_RUNS := $(subst _,,1_000_000)
IMG := $(lastword $(subst /, ,$(MAKECMDGOALS)))
STATS := sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock wc:stats

define \n


endef

images:
	@$(foreach p, $(PROJECTS), \
		cd $(p) && sudo docker build -t wc:$(p) . $(\n) \
	)

images/%:
	@cd $(IMG) && sudo docker build -t wc:$(IMG) .

images/ls:
	@sudo docker images | grep -e IMAGE -e wc | awk 'NR==1 {print $0;next} {print $0 | "sort -k2"}'

run:
	@for p in $(PROJECTS); do \
		echo $(SEP); \
		echo $$p; \
		echo $(SEP); \
		time (seq 1 $(TEST_RUNS) | sudo docker run --rm -i wc:$$p) 2>&1; \
		echo ''; \
	done

run/%: images/$(IMG)
	@echo $(SEP)
	@echo $(IMG)
	@echo $(SEP)
	@time (seq 1 $(TEST_RUNS) | sudo docker run --rm -i wc:$(IMG)) 2>&1
	@echo ''

stats: stats/img
	@$(STATS) $(PROJECTS) | tee stats.json

stats/img:
	sudo docker build -t $(lastword $(STATS)) -f stats.dockerfile .

stats/%: images/$(IMG) stats/img
	@$(STATS) $(IMG)

.PHONY: $(shell grep -P '^[a-z/%]+:' Makefile | cut -d: -f 1)
