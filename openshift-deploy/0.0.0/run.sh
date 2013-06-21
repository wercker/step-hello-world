# Suffix for missing options.
error_suffix='Please add this option to the wercker.yml or add a openshift deployment target on the website which will set these options for you.'

if [ ! -n "$WERCKER_OPENSHIFT_DEPLOY_PRIVATE_KEY" ]
then
    if [ -n "$WERCKER_OPENSHIFT_PRIVATE_KEY" ]
    then
        export WERCKER_OPENSHIFT_DEPLOY_PRIVATE_KEY="$WERCKER_OPENSHIFT_PRIVATE_KEY"
    else
        fail "Missing or empty option private_key. $error_suffix"
    fi
fi

if [ ! -n "$WERCKER_OPENSHIFT_DEPLOY_GIT_URL" ]
then
    if [ -n "$WERCKER_OPENSHIFT_GITURL" ]
    then
        export WERCKER_OPENSHIFT_DEPLOY_GIT_URL="$WERCKER_OPENSHIFT_GITURL"
    else
        fail "Missing or empty option git_url. $error_suffix"
    fi
fi

export GIT_SSH="$(mktemp)"
sshkeypath="$(mktemp)"
deploydir="$(mktemp --directory)"

debug "GIT_SSH set to $GIT_SSH"
debug "sshkeypath set to $sshkeypath"
debug "deploydir set to $deploydir"

echo -e "$WERCKER_OPENSHIFT_PRIVATE_KEY" > "$sshkeypath"
echo "ssh -t -e none -i $sshkeypath -o 'StrictHostKeyChecking no' \$@" > $GIT_SSH
chmod 0700 $GIT_SSH

debug 'created git ssh file:'
debug "$(cat $GIT_SSH)"

rsync --archive $WERCKER_ROOT/ deploydir/

debug 'synced files to deploydir:'
debug "$(ls -a $deploydir)"

cd deploydir
git init
git config user.email "openshift@wercker.com"
git config user.name "wercker"
git add .
git commit -m 'wercker deploy'
result="$(git push -f $WERCKER_OPENSHIFT_GITURL master)"

if [[ $? -ne 0 ]]
then
     warning "$result"
     fail "git push to $WERCKER_OPENSHIFT_GITURL failed"
 else
     success "succesfully pushed to $WERCKER_OPENSHIFT_GITURL"
 fi

rm -f "$GIT_SSH" || debug "could not remove $GIT_SSH"
rm -f "$sshkeypath" || debug "could not remove $sshkeypath"
rm -rf "$deploydir" || debug "could not remove $deploydir"
