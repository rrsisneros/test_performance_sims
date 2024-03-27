#!/bin/bash

#SBATCH --job-name=siusims_testperf
#SBATCH --tasks-per-node=24
#SBATCH --nodes=4
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=8048
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jwbowers@illinois.edu
#SBATCH --export=PATH,R_LIBS,CLUSTER,CORES,LD_LIBRARY_PATH
#SBATCH --partition=IllinoisComputes
#SBATCH --account=jwbowers-ic
#
#module load gnu/gnu-9.3.0 gnu/openmpi-3.1.6-gnu-9.3.0
source ~/miniforge3/bin/activate
conda activate mambaR

##set InputDir=/data/keeling/a/jwbowers/Documents/PROJECTS/manytests-paper
## set RunDir=/data/keeling/a/jwbowers/Documents/PROJECTS/manytests-paper

##cd /data/keeling/a/jwbowers/Documents/PROJECTS/manytests-paper

export R_DATATABLE_NUM_THREADS=1
export CLUSTER="keeling-socket"
export CORES=96

echo "Started on: $(date --rfc-3339=seconds)"
echo "Hostname: $(hostname)"
echo "Working directory: $PWD"

#Rscript r-multihost.R
Rscript --verbose Analysis/siusims.R
# R --file=Analysis/siusims.R


echo "Finished on: $(date --rfc-3339=seconds)"

