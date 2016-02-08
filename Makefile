LS_FILES := $(wildcard src/*.ls)
BIN_FILES = $(addprefix bin/,$(notdir $(LS_FILES:.ls=.tp)))

bin/%.tp: src/%.ls
	maketp $< $@

all: $(BIN_FILES)
