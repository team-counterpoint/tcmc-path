.PHONY: all clean

DEST := lib
NAMES := ctl ctlfc ctl_path ctlfc_path
FILES := $(addprefix $(DEST)/,$(addsuffix .als,$(NAMES)))

ARGS :=

all: $(FILES)

$(DEST)/ctl.als: ARGS :=
$(DEST)/ctlfc.als: ARGS := --fc
$(DEST)/ctl_path.als: ARGS := --path
$(DEST)/ctlfc_path.als: ARGS := --fc --path

$(DEST)/%.als: template.als build.py
	./build.py --name $(basename $(@F)) $(ARGS) > $@

clean:
	rm -f $(FILES)
