LS_FILES  := $(wildcard src/*.ls)
KL_FILES  := $(wildcard src/*.kl)
FTX_FILES := $(wildcard src/*.ftx)

TP_FILES = $(addprefix bin/,$(notdir $(LS_FILES:.ls=.tp)))
PC_FILES = $(addprefix bin/,$(notdir $(KL_FILES:.kl=.pc)))
TX_FILES = $(addprefix bin/,$(notdir $(FTX_FILES:.ftx=.tx)))

bin/%.tp: src/%.ls
	maketp $< $@

bin/%.pc: src/%.kl
	ktrans $< $@
	rm $(notdir $@)

bin/%.tx: src/%.ftx
	kcdict $< $(dir $@)
	mkdir -p src/includes
	mv $(addsuffix .kl, $(basename $(notdir $<))) src/includes/$(addsuffix .kl, $(basename $(notdir $<)))
	rm $(notdir $@)
	rm $(addsuffix .vr, $(basename $(notdir $@)))

all: $(TP_FILES) $(TX_FILES) $(PC_FILES)

.PHONY: clean

clean:
	rm bin/*.*
