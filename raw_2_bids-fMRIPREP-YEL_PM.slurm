#!/bin/sh

## Give your job a name to distinguish it from other jobs you run.
#SBATCH --job-name=raw_2_bids-YEL
#SBATCH -J raw_2_bids-YEL
#SBATCH --time=01:00:00
#SBATCH --array=1-2
#SBATCH -n 1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2G
#SBATCH --partition=all-HiPri

#SBATCH --output=/scratch/csng/YEL/%x-%N-%j.out  # Output file
#SBATCH --error=/scratch/csng/YEL/%x-%N-%j.err   # Error file

## Load the relevant modules needed for the job
module load jo
module load dcm2niix/v1.0.20190902

subject=$( sed "${SLURM_ARRAY_TASK_ID}q;d" /home/mkisner/participants.tsv )
export subject
printenv subject

# add lag between jobs
sleep $[ 10 * ${SLURM_ARRAY_TASK_ID} ]

## Run your program or script
/bin/date
cd /scratch/csng/YEL/
/home/mkisner/raw_2_bids-YEL-flex_PM.sh /scratch/csng
/bin/date


