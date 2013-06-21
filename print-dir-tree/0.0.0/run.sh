command='tree'
current_dir="$(pwd)"
tree_dir="$WERCKER_STEP_ROOT/bin/tree-1.6.0"

if [ ! -z "$WERCKER_PRINT_DIR_TREE_DIRECTORY"  ]
then
    command="$command $WERCKER_PRINT_DIR_TREE_DIRECTORY"
fi

if [ ! -z "$WERCKER_PRINT_DIR_TREE_LEVEL"  ]
then
    command="$command -L $WERCKER_PRINT_DIR_TREE_LEVEL"
fi

if [ ! -z "$WERCKER_PRINT_DIR_TREE_PRETTY"  ]
then
    command="$command -A"
fi

if ! type tree &> /dev/null;
then
    debug 'tree command not found, will install...'
    cd "$tree_dir"

    sudo make
    sudo make install

    debug 'install complete'
    debug 'type: $(type tree)'
else
    debug 'tree command found, skip install'
fi

debug "$command"
info "$($command)"
