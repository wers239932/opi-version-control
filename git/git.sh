
#!/bin/sh

cd test
rm -rf .git
rm -rf *

user="red"

change_git_user() {
  user="$1"
  git config user.name "$user"
  git config user.email "${user}@example.com"
  echo "Текущий пользователь: $(git config user.name)"
}

commit() {
  cp -r "../commits/commits_unzipped/commit${1}/"* .
  git add .
  git commit --allow-empty -m "commit r${1} $user"
}


git init
 
#r0
change_git_user red
commit 0
git branch -m 0_red

#r1
git switch -c 1_red
commit 1

#r2
change_git_user blue
git switch -c 0_blue
commit 2

#r3
change_git_user red
git switch 0_red
commit 3

#r4
change_git_user blue
git switch 0_blue
commit 4
#r5
git switch -c 1_blue
commit 5

#r6
change_git_user red
git switch -c 2_red
commit 6

#r7
change_git_user blue
git switch -c 2_blue
commit 7

#r8
git switch 0_blue
commit 8

#r9
git switch 1_blue
commit 9

#r10
change_git_user red
git switch 1_red
commit 10

#r11
git switch 0_red
commit 11

#r12
change_git_user blue
git switch -c 3_blue
commit 12

#r13
change_git_user red
git switch -c 3_red
commit 13

#r14
change_git_user blue
git switch -c 4_blue
commit 14

#r15
change_git_user red
git switch 0_red
git merge --no-ff --no-commit 4_blue -Xours
commit 15

#r16
change_git_user red
git switch 1_red
commit 16

#r17
change_git_user blue
git switch 1_blue
commit 17

#r18
git switch 2_blue
commit 18

#r19
change_git_user red
git switch 1_red
commit 19

#r20
git switch 2_red
commit 20

#r21
change_git_user blue
git switch 3_blue
commit 21

#r22
change_git_user red
git switch -c 4_red
commit 22

#r23
change_git_user blue
git switch 0_blue
commit 23

#r24
change_git_user red
git switch 2_red
commit 24

#r25
change_git_user blue
git switch 1_blue
git merge --no-ff --no-commit 2_red -Xours
commit 25

#r26
change_git_user red
git switch -c 5_red
commit 26

#r27
change_git_user blue
git switch 1_blue
commit 27

#r28
git switch 0_blue
commit 28

#r29
commit 29

#r30
git switch 1_blue
commit 30

#r31
git switch -c 5_blue
commit 31

#r32
git switch 1_blue
commit 32

#r33
change_git_user red
git switch 5_red
git merge --no-ff --no-commit 1_blue -Xours
commit 33

#r34
change_git_user blue
git switch 0_blue
commit 34

#r35
git switch 5_blue
commit 35

#r36
change_git_user red
git switch 3_red
commit 36

#r37
change_git_user blue
git switch 3_blue
git merge --no-ff --no-commit 3_red -Xours
commit 37

#r38
change_git_user red
git switch 5_red
commit 38

#r39
git switch 4_red
commit 39

#r40
git switch 0_red
git merge --no-ff --no-commit 4_red -Xours
commit 40

#r41
change_git_user blue
git switch 3_blue
commit 41

#r42
commit 42

#r43
git switch 5_blue
commit 43

#r44
change_git_user red
git switch 1_red
git merge --no-ff --no-commit 5_blue -Xours
commit 44

#r45
change_git_user blue
git switch 2_blue
commit 45

#r46
change_git_user red
git switch 1_red
git merge --no-ff --no-commit 2_blue -Xours
commit 46

#r47
change_git_user blue
git switch 0_blue
git merge --no-ff --no-commit 1_red -Xours
commit 47

#r48
git switch 3_blue
git merge --no-ff --no-commit 0_blue -Xours
commit 48

#r49
change_git_user red
git switch 5_red
git merge --no-ff --no-commit 3_blue -Xours
commit 49

#r50
git switch 0_red
git merge --no-ff --no-commit 5_red -Xours
commit 50


git log --oneline --graph --all --decorate
