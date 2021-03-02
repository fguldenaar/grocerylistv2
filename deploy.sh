#!/usr/bin/env sh
# abort on errors
set -e
# build
npm run build
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m 'deplov4'
git remote add origin https://github.com/fguldenaar/grocerylistv2.git

git push -f git@github.com:fguldenaar/grocerylistv2.git master:gh-pages
cd -