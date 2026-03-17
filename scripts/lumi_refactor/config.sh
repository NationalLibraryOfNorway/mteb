#!/bin/bash
# Centralized configuration for LUMI cluster evaluation scripts.
# Source this file from other scripts:
#   source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

export ACCOUNT=project_465002270
export PROJECT=/scratch/${ACCOUNT}/nb-embed
export MTEB_DIR=${PROJECT}/mteb

export VENV=${MTEB_DIR}/.venv/bin/activate
export CACHE=${MTEB_DIR}/.cache/mteb

export HF_HOME=${PROJECT}/huggingface_cache/
export SIF=/appl/local/laifs/containers/lumi-multitorch-u24r64f21m43t29-20260225_144743/lumi-multitorch-full-u24r64f21m43t29-20260225_144743.sif
