sudo npm install jshint@2.0 -g
cd $WERCKER_SOURCE_DIR
jshint . --jslint-reporter
