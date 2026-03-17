import argparse

TEMPLATE = "python run_eval.py -c /scratch/project_465002270/nb-embed/mteb/.cache/mteb -m {model} --vllm"

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-m", "--models", nargs="+", required=True)
    args = parser.parse_args()

    runs = ["#!/bin/bash\n", "source /scratch/project_465002270/nb-embed/mteb/.venv/bin/activate\n"]
    for model in args.models:
        runs.append(TEMPLATE.format(model=model))
    
    file = "\n".join(runs)

    with open("run_evals.sh", "w") as f:
        print(file, file=f)

