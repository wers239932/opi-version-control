#!/bin/sh
# $1 - COMMIT_NUM $2 - SOURCE_BRANCH, $3 - USER_COL, $4 - TARGET_BRANCH

export COMMIT_NUM=$1
export USER_COL=$3
"$SVN_SHOW_PATH/svn/commands/switch.sh" $2
svn merge --accept=working  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$4"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL