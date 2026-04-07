#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"
source "$VENV"

python run_eval.py -c "$CACHE" -m /scratch/project_465002270/nb-embed/nb-sbert/output/nb-bert-base-nb-nli-nordic-train-5e-5-256/checkpoint-3367 --vllm
python run_eval.py -c "$CACHE" -m /scratch/project_465002270/nb-embed/nb-sbert/output/nb-bert-base-nb-nli-nordic-train-1e-5-512/checkpoint-1684 --vllm
