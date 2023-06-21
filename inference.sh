#!/bin/bash

#SBATCH --job-name=AI-HERO_UNet
#SBATCH --partition=accelerated
#SBATCH --nodes=1
#SBATCH --gres=gpu:4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=152
#SBATCH --time=00:05:00
#SBATCH --output=/hkfs/work/workspace/scratch/hgf_pdv3669-H3/training.txt

export CUDA_CACHE_DISABLE=1
export OMP_NUM_THREADS=1

group_workspace=/hkfs/work/workspace/scratch/hgf_pdv3669-H3

source ${group_workspace}/venv/bin/activate
python ${group_workspace}/CharmingSyringes/inference.py \
  --root_dir /hkfs/work/workspace/scratch/hgf_pdv3669-health_train_data/ \
  --from_checkpoint ${group_workspace}/checkpoints/unet/last.ckpt \
  --pred_dir ./predictions
