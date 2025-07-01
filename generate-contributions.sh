#!/bin/bash

# This script for testing only

START_DATE="2024-07-01"
END_DATE="2025-06-30"

while [ "$START_DATE" != "$END_DATE" ]; do
  for i in {1..5}; do
    echo "Fake commit $i on $START_DATE" > file.txt
    GIT_AUTHOR_DATE="$START_DATE 12:00:00" GIT_COMMITTER_DATE="$START_DATE 12:00:00" git commit -am "Commit #$i on $START_DATE" --allow-empty
  done
  START_DATE=$(date -I -d "$START_DATE + 1 day")
done

