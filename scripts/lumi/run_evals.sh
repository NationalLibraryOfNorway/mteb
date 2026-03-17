#!/bin/bash

source /scratch/project_465002270/nb-embed/mteb/.venv/bin/activate

python run_eval.py -c /scratch/project_465002270/nb-embed/mteb/.cache/mteb -m NbAiLab/nb-sbert-base-normalized --vllm
python run_eval.py -c /scratch/project_465002270/nb-embed/mteb/.cache/mteb -m NbAiLab/nb-sbert-base-dense-normalized --vllm
python run_eval.py -c /scratch/project_465002270/nb-embed/mteb/.cache/mteb -m NbAiLab/nb-sbert-base-cls-normalized --vllm
