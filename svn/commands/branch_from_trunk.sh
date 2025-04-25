#!/bin/sh
# запускать через точку: . ./svn/commads/share_base_dir.sh

svn copy -m "create branch r$COMMIT_NUM" \
  "file://$SVN_SHOW_PATH/svn/svn_server/trunk" \
  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$COMMIT_NUM" --username=$USER_COL

# Переключение на ветку
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r$COMMIT_NUM"