#!/bin/bash


###                                                                                                                                                                                       
#SBATCH --job-name=py_mpi_hostname
#SBATCH --output=py_mpi_hostname.out.%J.%N
#SBATCH --error=py_mpi_hostname.err.%J.%N
# specify our current project
# replace XXXX with the code provided by your instructor
#SBATCH --account=scw1389
# specify the reservation we have for the training workshop
# remove this for your own work
# replace XXXX and YY with the code provided by your instructor
#SBATCH --reservation=scw1389_23

###

module load mpi
module load python/3.7.0
mpirun python3 print_hostname.py
