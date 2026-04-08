#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

python run_eval.py -c "$CACHE" -m NbAiLab/nb-sbert-base-nb-nli-nordic-train-3e-5-512-epoch5 --vllm
