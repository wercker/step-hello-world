
rootDir=$(pwd)
echo $rootDir

for d in `find * -type d -d 0`
do
  echo "going for $d"
  curl "https://api.github.com/orgs/wercker/repos?access_token=a8cb13815738ff15368b49d08bc87de5f73c903c" -d "{\"name\":\"step-$d\",\"private\":false}"
done
