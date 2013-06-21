#!/bin/sh
export WERCKER_NODEENV_ACTIVATE_CACHE_DIR=$WERCKER_CACHE_DIR/wercker/npm

debug "Making sure that we chown $WERCKER_ROOT"
sudo chown ubuntu -R $WERCKER_ROOT

debug "Activating Node $WERCKER_PLATFORM_VERSION"
source $HOME/node_$WERCKER_PLATFORM_VERSION/bin/activate

success "Activated Node $WERCKER_PLATFORM_VERSION"
info "node --version: $(node --version)"
info "npm --version: '$(npm --version)"

mkdir -p $WERCKER_NODEENV_ACTIVATE_CACHE_DIR
npm config set cache $WERCKER_NODEENV_ACTIVATE_CACHE_DIR
debug "Configured npm to use cache dir $WERCKER_NODEENV_ACTIVATE_CACHE_DIR"
