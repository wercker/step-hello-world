cd $WERCKER_SOURCE_DIR
echo "npm install"

#sudo chown ubuntu /etc/hosts
#echo "173.192.57.100 registry.npmjs.org." >> /etc/hosts
#sudo chown root /etc/hosts


#cd
#git clone https://github.com/hughsk/npm-quickfix.git
#cd npm-quickfix
#node index.js &
#npm set registry http://localhost:8080/
#cd $WERCKER_SOURCE_DIR

npm install
