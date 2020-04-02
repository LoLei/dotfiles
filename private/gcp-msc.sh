#!/bin/sh
cd ~/uni

cd msc-code
git commit -am "Repo-wide auto-commit"
git push
cd ..

cd msc-journal
git commit -am "Repo-wide auto-commit"
git push
cd ..

cd msc-resources
git commit -am "Repo-wide auto-commit"
git push
cd ..

cd msc-thesis
git commit -am "Repo-wide auto-commit"
git push
cd ..
