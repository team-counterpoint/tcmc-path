.PHONY: all clean

DEST := lib
NAMES := ctl ctlfc ctl_path ctlfc_path ctl_subgraph ctlfc_subgraph
FILES := $(addprefix $(DEST)/,$(addsuffix .als,$(NAMES)))

ARGS :=

all: $(FILES)

$(DEST)/ctl.als: ARGS :=
$(DEST)/ctlfc.als: ARGS := --fc
$(DEST)/ctl_path.als: ARGS := --path
$(DEST)/ctlfc_path.als: ARGS := --fc --path
$(DEST)/ctl_subgraph.als: ARGS := --subgraph
$(DEST)/ctlfc_subgraph.als: ARGS := --fc --subgraph

$(DEST)/%.als: template.als build.py
	./build.py --name $(basename $(@F)) $(ARGS) > $@

clean:
	rm -f $(FILES)
