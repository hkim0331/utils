all: install

install:
	for i in enabled/*; do \
		install -m 0700 $$i ~/bin/; \
	done

