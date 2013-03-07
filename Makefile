include support/standard_macro.mak

# MACROS
INO_EXEC=/opt/COTS/defaults/ino/bin/ino
SDK_DIR=/opt/COTS/defaults/arduino-sdk
BOARD_MODEL=ethernet

SDK_OPT=--arduino-dist
MODEL_OPT=--board-model


# DIRECTORIES
BIN_DIR=bin
DOC_DIR=doc

# TARGETS
.PHONY: clean build
default: build

build: clean
	$(INO_EXEC) build $(SDK_OPT) $(SDK_DIR) $(MODEL_OPT) $(BOARD_MODEL)

clean:
	@$(INO_EXEC) clean
	@$(RMDIR) $(BIN_DIR)
	@$(RMDIR) $(DOC_DIR)

include support/standard_rules.mak
