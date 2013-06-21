if [ ! -n "$WERCKER_SCRIPT_CODE" ]
then
    fail 'missing option `code`, please check wercker.yml'
fi

script_path="$WERCKER_STEP_ROOT/scriptXXXXX.sh"
echo -e "$WERCKER_SCRIPT_CODE" > "$script_path"

sudo chmod +x script_path
source script_path
