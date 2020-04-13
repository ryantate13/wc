SHELL = bash
PROJECTS := $(shell find . -type f -name Dockerfile | xargs -n 1 dirname | xargs -n 1 basename | sort)
SEP := ================

images:
	@for p in $(PROJECTS); do \
		cd $$p; sudo docker build -t wc:$$p . || exit 1; cd -; \
	done

images/ls:
	@sudo docker images | grep -e IMAGE -e wc | awk 'NR==1 {print $0;next} {print $0 | "sort -k2"}'

run:
	@for p in $(PROJECTS); do \
		echo $(SEP); \
		echo $$p; \
		echo $(SEP); \
		time (seq 1 1000000 | sudo docker run --rm -i wc:$$p) 2>&1; \
		echo ''; \
	done

.PHONY: images images/ls run
