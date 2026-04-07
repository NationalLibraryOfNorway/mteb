import argparse

HEADER = [
    "#!/bin/bash",
    'SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"',
    'source "$SCRIPT_DIR/config.sh"',
    'source "$VENV"',
    "",
]

TEMPLATE = 'python run_eval.py -c "$CACHE" -m {model} --vllm'

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-m", "--models", nargs="+", required=True)
    args = parser.parse_args()

    runs = HEADER[:]
    for model in args.models:
        runs.append(TEMPLATE.format(model=model))

    file = "\n".join(runs)

    with open("run_evals.sh", "w") as f:
        print(file, file=f)
