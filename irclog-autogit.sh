#!/bin/sh
cd ~/irclogs
inotifywait -q -m -e CLOSE_WRITE --format="./git-commit-and-push.sh" \#bs.log | sh
