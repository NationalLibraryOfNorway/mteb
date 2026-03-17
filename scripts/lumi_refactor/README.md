# LUMI Refactored Scripts

This folder contains a refactored version of the LUMI evaluation scripts with:

- shared configuration in one place (`config.sh`)
- less duplication for benchmark table updates (`update_table.sh` and `update_table.slurm`)
- generated eval runner scripts that use config variables (`create_eval_sh.py`)

## Files

- `config.sh`: Centralized paths and environment variables.
- `run_eval.py`: Runs MTEB evaluation for one model.
- `run_evals.sh`: Runs evaluations for a list of models (current static list).
- `slurm_run_evals.slurm`: SLURM entrypoint for model evaluations.
- `get_results_table.py`: Builds benchmark summary table from cached results.
- `update_table.sh`: Updates one benchmark table (`NEB` or `SEB2`).
- `update_table.slurm`: SLURM entrypoint for table updates.
- `create_eval_sh.py`: Generates `run_evals.sh` from a model list.

## Configuration

All scripts source `config.sh`.

Key variables:

- `ACCOUNT`
- `PROJECT`
- `MTEB_DIR`
- `VENV`
- `CACHE`
- `HF_HOME`
- `SIF`

If your cluster paths change, edit only `config.sh`.

## Usage

Run evaluations directly:

```bash
cd scripts/lumi_refactor
./run_evals.sh
```

Run evaluations via SLURM:

```bash
cd scripts/lumi_refactor
sbatch slurm_run_evals.slurm
```

Update NEB table directly:

```bash
cd scripts/lumi_refactor
./update_table.sh NEB
```

Update SEB2 table directly:

```bash
cd scripts/lumi_refactor
./update_table.sh SEB2
```

Update benchmark table via SLURM:

```bash
cd scripts/lumi_refactor
sbatch update_table.slurm NEB
sbatch update_table.slurm SEB2
```

Generate a new `run_evals.sh` for selected models:

```bash
cd scripts/lumi_refactor
python create_eval_sh.py -m \
  NbAiLab/nb-sbert-base-normalized \
  NbAiLab/nb-sbert-base-dense-normalized \
  NbAiLab/nb-sbert-base-cls-normalized
```

## Migration Notes

Replaced old duplicated scripts:

- `update_NEB_table.sh` and `update_SEB2_table.sh` -> `update_table.sh`
- `update_NEB_table.slurm` and `update_SEB2_table.slurm` -> `update_table.slurm`

The original scripts under `scripts/lumi` are unchanged.
