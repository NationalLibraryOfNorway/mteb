import argparse
import mteb
from mteb.models.vllm_wrapper import VllmEncoderWrapper
from pathlib import Path

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("-m", "--model", type=str, default="ltg/norbert3-xs")
    parser.add_argument("--vllm", action="store_true")
    parser.add_argument("-b", "--benchmark", type=str, choices=["SEB2", "NEB"], default="SEB2")
    parser.add_argument("-c", "--cache", type=Path, default=Path("~/.cache/mteb"))
    args = parser.parse_args()

    cache = mteb.ResultCache(args.cache)
    # Select model
    if args.vllm:
        try:
            model = VllmEncoderWrapper(model=args.model, trust_remote_code=True, gpu_memory_utilization=0.3)
        except Exception:
            print("No VLLM implementation, falling back on MTEB backend!")
            model = mteb.get_model(args.model, trust_remote_code=True)
    else:
        model = mteb.get_model(args.model, trust_remote_code=True)

    # Select tasks
    benchmark = mteb.get_benchmark(args.benchmark)

    # evaluate
    results = mteb.evaluate(model, tasks=benchmark, cache=cache)
