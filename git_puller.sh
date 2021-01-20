#!/usr/bin/env bash

DIR="$(pwd)"
USER="$(echo $1)"

if [ "$USER" == "" ]
then
    echo "Usage: sh git_puller.sh \"username\""
else
    if [ ! -d "$DIR"/repos ]
    then
        echo "Creating repos folder..."
        mkdir repos
    fi

    if [ ! -d "$DIR"/repos/"$USER" ]
    then
        echo "Creating user: "$USER" folder"
        mkdir repos/"$USER"
    fi

    cd "$DIR"/src

    curl https://api.github.com/users/"$USER"/repos | grep -w 'git_url' > repos.txt

    make

    ./repo_splitter > split_repos.txt

    cd "$DIR"/repos/"$USER"

    for i in `cat "$DIR"/src/split_repos.txt`
    do
        git clone $i
    done

    cd "$DIR"/src

    make clean
fi