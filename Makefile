SHELL = bash
PROJECTS := $(shell find . -type f -name Dockerfile | xargs -n 1 dirname | xargs -n 1 basename | sort)
SEP := =================
TEST_RUNS := $(subst _,,1_000_000)

images:
	@for p in $(PROJECTS); do \
		cd $$p; sudo docker build -t wc:$$p . || exit 1; cd -; \
	done

images/%:
	$(eval IMG := $(subst images/,,$@))
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

run/%:
	$(eval IMG := $(subst run/,,$@))
	@make images/$(IMG) > /dev/null
	@echo $(SEP)
	@echo $(IMG)
	@echo $(SEP)
	@time (seq 1 $(TEST_RUNS) | sudo docker run --rm -i wc:$(IMG)) 2>&1
	@echo ''

.PHONY: images images/% images/ls run run/%
