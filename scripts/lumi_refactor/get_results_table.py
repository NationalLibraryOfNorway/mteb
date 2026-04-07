import argparse
import mteb
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("-b", "--benchmark", type=str, choices=["SEB2", "NEB"], default="NEB")
parser.add_argument("-c", "--cache", type=Path, default=Path("~/.cache/mteb"))
parser.add_argument("-s", "--save", action="store_true")
parser.add_argument("-o", "--output_file", type=Path, default=Path("results_benchmark.csv"))
args = parser.parse_args()

# Load results for a specific benchmark
benchmark = mteb.get_benchmark(args.benchmark)
cache = mteb.ResultCache(args.cache)
results = cache.load_results(
    tasks=benchmark,
    load_experiments=True
)
benchmark_scores_df = results.get_benchmark_result()
print(benchmark_scores_df)
# res = cache.load_results(
#     models=["NbAiLab/nb-sbert-base", "NbAiLab/nb-sbert-borealis-270m"],
#     tasks=benchmark,
#     load_experiments=True
# )
# print(res.to_dataframe(include_model_revision=True))
if args.save:
    benchmark_scores_df.to_csv(args.output_file)
