#!/bin/sh

eval "$(echo "export COMMIT_NUM=$(( ${COMMIT_NUM:-0} + 1 ))")"