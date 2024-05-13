#!/bin/bash

cd ../build/web

for i in "$@" ; do
  case $i in
    --user-email=*)
      USER_EMAIL="${i#*=}"
      shift
      ;;
    --user-name=*)
      USER_NAME="${i#*=}"
      shift
      ;;
    *)
      echo "Unknown option"
      ;;
  esac
done

if git status | grep -q "fatal: not a git repository";
  then
    git config --global init.defaultBranch main
    git init
    git config --global user.email $USER_EMAIL
    git config --global user.name $USER_NAME
    git remote add origin git@github.com:tigosante/fullstack-dev-test.git
else
#
fi

git checkout -b gh-pages
git add --all
git commit -m "update"
git push origin gh-pages -f
