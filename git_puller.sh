#!/usr/bin/env bash

if [ ! -d "/home/dillon/Desktop/Projects/Git\ Puller/repos" ]
then
    mkdir repos
fi

cd src

curl https://api.github.com/users/dillonfeinman/repos | grep -w 'git_url' > repos.txt

make

./repo_splitter > split_repos.txt

cd ..

cd repos

for i in `cat /home/dillon/Desktop/Projects/Git\ Puller/src/split_repos.txt`
do
    git clone $i
done

cd ..

cd src

make clean
