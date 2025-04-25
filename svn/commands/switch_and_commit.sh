#!/bin/sh
# $1 - COMMIT_NUM, $2 - USER_COL, $3 - TARGET_BRANCH

export COMMIT_NUM=$1
export USER_COL=$2
"$SVN_SHOW_PATH/svn/commands/switch.sh" $3
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL