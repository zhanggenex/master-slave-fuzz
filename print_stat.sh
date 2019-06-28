#!/bin/bash

cat ./out/*/fuzzer_stats > all_stats

python print_stat.py
