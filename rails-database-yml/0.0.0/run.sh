cp "$WERCKER_STEP_ROOT/templates/$WERCKER_RAILS_DATABASE_YML_SERVICE.yml" "$WERCKER_SOURCE_DIR/config/database.yml"

info $(cat "$WERCKER_SOURCE_DIR/config/database.yml")
