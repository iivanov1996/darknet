#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
##SBATCH --cpus-per-task=40
##SBATCH --mem-per-cpu=16G
#SBATCH --time=4-0  
#SBATCH --gres=gpu:1
#SBATCH --mem-per-gpu=6000 
#SBATCH --partition=e7
#SBATCH --reservation=e7
##SBATCH --array=0-32%5
#SBATCH --output=job_train_416_new.out
#SBATCH --error=job_train_416_new.err

# GET script directory
WORKING_DIR=$(pwd) 

singularity exec --nv --home $WORKING_DIR /ceph/grid/home/iivanov/git/darknet_dockerfile_10_2.sif /ceph/grid/home/iivanov/git/darknet/darknet detector train coco.data yolov4.cfg /ceph/grid/home/iivanov/git/yolov4.conv.137 -dont_show
