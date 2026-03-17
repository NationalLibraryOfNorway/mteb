#!/bin/bash
# Update the benchmark results CSV for a given benchmark.
# Usage: ./update_table.sh [BENCHMARK]
#   BENCHMARK: NEB or SEB2 (default: NEB)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

source "$VENV"

BENCHMARK=${1:-NEB}

python get_results_table.py \
    -c "$CACHE" \
    -s \
    -o "$MTEB_DIR/benchmark_${BENCHMARK}.csv" \
    -b "$BENCHMARK"
