#!/bin/bash

#SBATCH --job-name=AI-HERO_UNet
#SBATCH --partition=accelerated
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=38
#SBATCH --time=01:00:00
#SBATCH --output=/hkfs/work/workspace/scratch/hgf_pdv3669-H3/inference.txt

export CUDA_CACHE_DISABLE=1
export OMP_NUM_THREADS=1

group_workspace=/hkfs/work/workspace/scratch/hgf_pdv3669-H3

source ${group_workspace}/venv/bin/activate
srun python ${group_workspace}/CharmingSyringes/inference.py \
  --root_dir /hkfs/work/workspace/scratch/hgf_pdv3669-H3/train/ \
  --from_checkpoint ${group_workspace}/checkpoints/unet/best.ckpt \
  --pred_dir ./predictions

