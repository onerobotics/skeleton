LS_FILES := $(wildcard src/*.ls)
KL_FILES := $(wildcard src/*.kl)
TP_FILES = $(addprefix bin/,$(notdir $(LS_FILES:.ls=.tp)))
PC_FILES = $(addprefix bin/,$(notdir $(KL_FILES:.kl=.pc)))

bin/%.tp: src/%.ls
	maketp $< $@

bin/%.pc: src/%.kl
	ktrans $< $@

all: $(TP_FILES) $(PC_FILES)
