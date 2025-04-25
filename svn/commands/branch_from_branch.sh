#!/bin/sh

svn copy -m "create branch r$COMMIT_NUM" \
  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$1" \
  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$COMMIT_NUM" --username=$USER_COL

# Переключение на ветку
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$COMMIT_NUM"