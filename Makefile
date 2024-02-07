SRC_DIR = ./FireTCP
EXAMPLE_DIR = ./examples
TARGETS = FireTCP.📦

package:
	mojo package ./FireTCP -o $(TARGETS)

full-install: package

	rm -rf \
		$(EXAMPLE_DIR) \
		$(SRC_DIR) \
		.git >/dev/null 2>&1

	rm -r \
		.gitignore \
		LICENSE \
		README.md \
		Makefile >/dev/null 2>&1

