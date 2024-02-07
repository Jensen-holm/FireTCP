SRC_DIR = ./FireTCP
EXAMPLE_DIR = ./examples
TARGETS = FireTCP.📦

package:
	mojo package ./FireTCP -o $(TARGETS)

install:
	# no going back after running this.
	# to get the source code back, you will have
	# to re clone the repository.
	package
	rm -rf \
		$(EXAMPLE_DIR) \
		$(SRC_DIR)
		.git
	rm -r \
		.gitignore \
		LISCENSE \
		README.md \
		Makefile

