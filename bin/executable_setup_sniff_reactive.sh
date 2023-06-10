#!/usr/bin/env bash
set -euo pipefail

if [ -e judge.py ]; then
  echo 'judge.py already exists.'
  exit
fi
if [ -e test/sample-1.in ]; then
  echo 'test/sample-1.in already exists.'
  exit
fi
cat <<"JUDGE" > judge.py
from sys import argv
with open(argv[1]) as f:
    N, M = list(map(int, f.readline().split()))
    AB = [tuple(map(int, f.readline().split())) for _ in range(M)]
JUDGE
echo 'created judge.py'
mkdir -p test
cat <<"SAMPLE" > test/sample-1.in
4 5
1 2
1 3
2 3
2 4
3 4
SAMPLE
echo 'created test/sample-1.in'
echo 'usage: sniff_reactive.py python main.py -- python judge.py test/sample-1.in'
