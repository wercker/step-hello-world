cd $WERCKER_SOURCE_DIR
sudo chown ubuntu -R /build
rbenv global $WERCKER_PLATFORM_VERSION
rbenv version
ruby --version
gem --version
