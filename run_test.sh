#!/usr/bin/env bash

source run_opts.sh

results_path='split'${split}'_results'
mkdir -p ${base_path}'/'${results_path}

# python3 main.py --gpu_devices 0 --batch_size 32 --n_threads 4 \
# 	--audiovisual \
# 	--no_train --no_val \
#     --root_path ${base_path} --result_path ${results_path} \
# 	--audio_pretrain_path ./data/pretrained_models/soundnet8.pth \
# 	--pretrain_path ${base_path}/${results_path}/optimal_model.pth \
# 	--annotation_path_feasibility_train ./data/fold_lists/feasibility_list_train_${split}_fps.txt \
# 	--annotation_path_feasibility_test ./data/fold_lists/feasibility_list_test_${split}_fps.txt

curr_dir=`pwd`
cd ${base_path}/${results_path}/feasibility/${movie}
mkdir -p resized
find . -maxdepth 1 -iname "*.jpg" | xargs -L1 -I{} convert -resize 640x480! "{}" resized/"{}"
cd $curr_dir