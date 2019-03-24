#!/usr/bin/env bash

################################################################################
#
# Installs and sets up 'nbstripout' and 'nbconvert' inside a virtualenv for 
# sane git version control of Juptyer notebooks.
#
# Sven Anderzén
#
################################################################################

ROOT=$(git rev-parse --show-toplevel)

# Setup a virtualenv folder in the root of the project
virtualenv $ROOT/venv

# Install 'nbstripout' and configure git
source venv/bin/activate
pip install nbstripout nbconvert
nbstripout --install --attributes .gitattributes
