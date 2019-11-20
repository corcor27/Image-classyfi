#!/bin/bash --login
###
# job name
#SBATCH --job-name=plotgraph
# job stdout file
#SBATCH --output=plotgraph.out.%J
# job stderr file
#SBATCH --error=plotgraph.err.%J
# maximum job time in D-HH:MM
#SBATCH --time=0-00:01
# number of tasks you are requesting
#SBATCH --ntasks=1
# memory per process in MB
#SBATCH --mem=2
# number of nodes needed
#SBATCH --nodes=1
# specify our current project
# replace XXXX with the code provided by your instructor
#SBATCH --account=scw1389
# specify the reservation we have for the training workshop
# remove this for your own work
# replace XXXX and YY with the code provided by your instructor
#SBATCH --reservation=scw1389_23
###
module load python/3.7.0
python3 plot.py
