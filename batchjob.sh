#!/bin/bash --login
###
# job name
#SBATCH --job-name=hostname
# job stdout file
#SBATCH --output=hostname.out.%J
# job stderr file
#SBATCH --error=hostname.err.%J
# maximum job time in D-HH:MM
#SBATCH --time=0-00:01
# maximum memory of 10 megabytes
#SBATCH --mem-per-cpu=10
# run a single task, using a single CPU core
#SBATCH --ntasks=1
# specify our current project
# change this for your own work
#SBATCH --account=scw1389
# specify the reservation we have for the training workshop
# replace XX with the code provided by your instructor
# remove this for your own work
#SBATCH --reservation=scw1389_23
#SBATCH --mail-user=cot12@aber.ac.uk
#SBATCH --mail-type=ALL
###

/bin/hostname
