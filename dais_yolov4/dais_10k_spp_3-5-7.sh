#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
##SBATCH --cpus-per-task=40
##SBATCH --mem-per-cpu=16G
#SBATCH --time=10-0
#SBATCH --gres=gpu:1
#SBATCH --mem-per-gpu=4000 
#SBATCH --partition=e7
#SBATCH --reservation=e7
##SBATCH --array=0-32%5
#SBATCH --output=job_train.out
#SBATCH --error=job_train.err

# GET script directory
WORKING_DIR=$(pwd) 


singularity exec --nv --home $WORKING_DIR darknet_dockerfile_10_2.sif /ceph/grid/home/iivanov/my_image_darknet/darknet/darknet detector train dais_416.data dais_416.cfg yolov4.conv.137 -dont_show -map
