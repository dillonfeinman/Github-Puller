#!/usr/bin/env bash

DIR="$(pwd)"

if [ ! -d "$DIR"/repos ]
then
    echo "Creating repos folder..."
    mkdir repos
fi


cd src

curl https://api.github.com/users/dillonfeinman/repos | grep -w 'git_url' > repos.txt

make

./repo_splitter > split_repos.txt

cd ..

cd repos

for i in `cat "$DIR"/src/split_repos.txt`
do
    git clone $i
done

cd ..

cd src

make clean