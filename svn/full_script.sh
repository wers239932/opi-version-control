#!/bin/sh
# svn rm $SVN_SHOW_PATH/svn/workdir/*

rm -rf "$SVN_SHOW_PATH/svn/workdir" "$SVN_SHOW_PATH/svn/svn_server"
mkdir -p "$SVN_SHOW_PATH/svn/workdir" "$SVN_SHOW_PATH/svn/svn_server"

svnadmin create "$SVN_SHOW_PATH/svn/svn_server"
svnadmin setuuid "$SVN_SHOW_PATH/svn/svn_server" 160d2624-698b-45e3-a333-62b31fb20008

svn mkdir -m "create project structure" \
  "file://$SVN_SHOW_PATH/svn/svn_server/trunk" \
  "file://$SVN_SHOW_PATH/svn/svn_server/branches"


svn checkout "file://$SVN_SHOW_PATH/svn/svn_server/trunk" "$SVN_SHOW_PATH/svn/workdir"

cd workdir

export COMMIT_NUM=0
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=red

export COMMIT_NUM=1
. "$SVN_SHOW_PATH/svn/commands/branch_from_trunk.sh"

# svn rm $SVN_SHOW_PATH/svn/workdir/*
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=red


#   ----------- branch and commit
"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 2 blue 1

#   ----------- switch to trunc and commit
export COMMIT_NUM=3
export USER_COL="red"
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/trunk"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL

#   ----------- switch and commit
"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 4 blue 2

#   ----------- branch and commit
"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 5 blue 2

#   ----------- branch and commit
"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 6 red 5

#   ----------- branch and commit
"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 7 blue 6

#   ----------- branch and commit
"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 8 blue 2

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 9 blue 5

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 10 red 1

export COMMIT_NUM=11
export USER_COL="red"
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/trunk"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL

export COMMIT_NUM=12
export USER_COL="blue"
"$SVN_SHOW_PATH/svn/commands/branch_from_trunk.sh"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL

"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 13 red 12

"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 14 blue 13

export COMMIT_NUM=15
export USER_COL="red"
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/trunk"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 16 red 1

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 17 blue 5

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 18 blue 7

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 19 red 1

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 20 red 6

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 21 blue 12

"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 22 red 12

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 23 blue 2

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 24 red 6

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 25 6 blue 5

"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 26 red 5

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 27 blue 5

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 28 blue 2

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 29 blue 2

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 30 blue 5

"$SVN_SHOW_PATH/svn/commands/branch_and_commit.sh" 31 blue 5

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 32 blue 5

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 33 5 red 26

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 34 blue 2

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 35 blue 31

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 36 red 13

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 37 13 red 12

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 38 red 26

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 39 red 22

export COMMIT_NUM=40
export USER_COL="red"
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/trunk"
svn merge --accept=working  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r22"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 41 blue 12

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 42 blue 12

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 43 blue 31

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 44 31 red 1

"$SVN_SHOW_PATH/svn/commands/switch_and_commit.sh" 45 blue 7

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 46 7 red 1

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 47 1 blue 2

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 48 2 blue 12

"$SVN_SHOW_PATH/svn/commands/merge_sec_into_first.sh" 49 12 red 26

export COMMIT_NUM=50
export USER_COL="red"
svn switch "file://$SVN_SHOW_PATH/svn/svn_server/trunk"
svn merge --accept=working  "file://$SVN_SHOW_PATH/svn/svn_server/branches/branch_r26"
"$SVN_SHOW_PATH/svn/commands/copy_commit.sh" $COMMIT_NUM
"$SVN_SHOW_PATH/svn/commands/svn_add_all.sh"
svn commit -m "r$COMMIT_NUM" --username=$USER_COL





















cd ..