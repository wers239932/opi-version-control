#!/bin/sh

cp -rf $SVN_SHOW_PATH/commits_unzipped/commit"$1"/* $SVN_SHOW_PATH/svn/workdir
# echo "look there $1"