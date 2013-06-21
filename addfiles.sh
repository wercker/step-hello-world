
rootDir=$(pwd)
echo $rootDir

for d in `find * -type d -d 0`
do
  echo "going for $d"
	cd "$d/0.0.0"
  ls
  if [ ! -f README.md ]; then
    echo "# $d step" >> README.md
  fi
  if [ ! -f wercker-step.yml ]; then
    echo "name: $d" > wercker-step.yml
    echo "version: 0.0.1" >> wercker-step.yml
    echo "description: $d step" >> wercker-step.yml
  fi
  if [ ! -f ".gitignore" ]; then
    echo ".DS_Store" > ".gitignore"
  fi
  cd $rootDir
done
