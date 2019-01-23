# TCMC-Path

This repository contains the Alloy implementation of transitive-closure-based model checking (TCMC) with path extraction for witnesses and counterexamples.

## Build

Run `make` to generate the following Alloy modules:

- `lib/ctl.als`: TCMC for CTL.
- `lib/ctlfc.als`: TCMC for CTLFC (CTL with fairness constraints).
- `lib/ctl_path.als`: TCMC Path extraction for CTL.
- `lib/ctlfc_path.als`: TCMC path extraction for CTLFC.

They are generated from `template.als`, which uses [Jinja2](http://jinja.pocoo.org) template syntax.

## Dependencies

Generating the modules requires Python 3 and Jinja2.

The modules themselves are tested with Alloy 5.
