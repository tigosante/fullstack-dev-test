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

echo "-> User name: $USER_NAME"
echo "-> User email: $USER_EMAIL"

if git status | grep -q "fatal: not a git repository";
  then
    git config init.defaultBranch main
    git init
    git remote add origin git@github.com:tigosante/fullstack-dev-test.git
else
  git status
fi

git config user.email $USER_EMAIL
git config user.name $USER_NAME
git checkout -b gh-pages
git add --all
git commit -m "update"
git push origin gh-pages -f
