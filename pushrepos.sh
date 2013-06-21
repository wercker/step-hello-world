
rootDir=$(pwd)
echo $rootDir

for d in `find * -type d -d 0`
do
  echo "going for $d"
	cd "$d/0.0.0"
  git init
  git add .
  git remote add origin git@github.com:wercker/step-$d.git
  git commit -m "First commit."
  git push -u origin master
  cd $rootDir
done
