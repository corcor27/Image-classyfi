#!/bin/sh
###
#SBATCH --job-name=mpi_date
#SBATCH --output=mpi_date.out.%J.%N
#SBATCH --error=mpi_date.err.%J.%N
#SBATCH --account=scw1389
#SBATCH --reservation=scw1389_23
###
module load mpi
mpirun date +%M:%S.%N
