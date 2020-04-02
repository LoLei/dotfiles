#!/bin/sh
cd ~/uni

cap () {
  cd $1
  echo -e "\e[31;1mHandling $(pwd) ...\n\e[0m"
  git commit -am "Repo-wide auto-commit"
  git push
  cd ..
  echo ""
}

cap msc-code
cap msc-journal
cap msc-resources
cap msc-thesis
