#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem-per-cpu 16G
#SBATCH --gres=gpu:1
#SBATCH --time 2-00:00:00 # 2 days
#SBATCH --job-name eval_vqa
#SBATCH --output eval_vqa_11_4_2019.log
#SBATCH -A visualai # specify to run on visualai server

source activate pythia
pip freeze
python tools/run.py --tasks vqa --datasets vqa2 --model pythia --config configs/vqa/vqa2/pythia.yml --run_type val --evalai_inference 1 --resume_file data/models/pythia.pth
nvidia-smi



