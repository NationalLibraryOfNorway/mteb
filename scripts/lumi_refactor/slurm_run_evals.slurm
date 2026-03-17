#!/bin/bash
#SBATCH --job-name=MTEB_Eval
#SBATCH --account=project_465002270
#SBATCH --time=20:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus=1
#SBATCH --mem=32G
#SBATCH --partition=small-g
#SBATCH --output=slurm_logs/%x-%j.out
#SBATCH --error=slurm_logs/%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

mkdir -p slurm_logs

module use /appl/local/laifs/modules
module load lumi-aif-singularity-bindings

export HIP_VISIBLE_DEVICES=0
export TORCH_COMPILE_DISABLE=1

singularity exec "$SIF" ./run_evals.sh
