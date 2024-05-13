#!/bin/bash

cd ../build/web

if git status | grep -q "fatal: not a git repository";
  then
    git config init.defaultBranch main
    git init
    git remote add origin git@github.com:tigosante/fullstack-dev-test.git
else
  git status
fi

git config user.name "Tiago Silva"
git config user.email tsilvasantos38@gmail.com
git checkout -b gh-pages
git add --all
git commit -m "update"
git push origin gh-pages -f
