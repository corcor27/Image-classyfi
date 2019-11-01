#!/bin/bash
echo Your environment is ready good sir \

sbatch --gres gpu:1 anaconda3-launch -env coryenv python

