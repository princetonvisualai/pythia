#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem-per-cpu 16G
#SBATCH --gres=gpu:1
#SBATCH --time 05:00:00 # 2 days is 2-00:00:00
#SBATCH --job-name eval_vqa
#SBATCH --output eval_vqa_11_15_2019.log
#SBATCH -A visualai # specify to run on visualai server

source activate pythia
export PATH=$PATH:/n/fs/visualai-scr/gmccord/pythia
python tools/run.py --tasks vqa --datasets vqa2 --model pythia --config configs/vqa/vqa2/pythia.yml --run_type verify --evalai_inference 1 --resume_file data/models/pythia.pth
nvidia-smi



