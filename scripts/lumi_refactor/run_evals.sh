#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

source "$VENV"

python run_eval.py -c "$CACHE" -m NbAiLab/nb-sbert-base-normalized --vllm
python run_eval.py -c "$CACHE" -m NbAiLab/nb-sbert-base-dense-normalized --vllm
python run_eval.py -c "$CACHE" -m NbAiLab/nb-sbert-base-cls-normalized --vllm
