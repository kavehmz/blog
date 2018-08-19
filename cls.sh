#!/usr/bin/env bash
rm -rf .git
git init
git add .
git add -f themes/temple/layouts/partials/navbar.html
git commit -m 'Initial commit'
git remote add origin git@github.com:kavehmz/blog.git
git push --force --set-upstream origin master
