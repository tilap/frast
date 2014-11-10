#!/bin/bash

export remotename="origin"
export branchname="gh-pages"

if [ `git branch | egrep "^[[:space:]]+${branchname}$"` ]
then
    echo "Delete local ${branchname} branch"
    git branch -D ${branchname}
fi

git fetch ${remotename}

if [ `git branch -a | egrep "^.*/${remotename}/${branchname}$"` ]
then
    echo "Delete remote ${branchname} branch"
    git push ${remotename} :${branchname}
fi

echo "Create the gh-pages branch."
rm -Rf tmp
git checkout --orphan gh-pages
git rm -rf .

echo "Init the branch with a README.md file"
touch README.md
git add README.md
git commit -m "Init ${branchname} branch"

echo "Push the branch to ${remotename}"
git push --set-upstream ${remotename} ${branchname}
git checkout master