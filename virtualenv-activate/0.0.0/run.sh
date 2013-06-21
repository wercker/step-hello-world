sudo chown ubuntu -R $WERCKER_ROOT
source ~/.virtualenv/python$WERCKER_PLATFORM_VERSION/bin/activate

python --version
pip --version
