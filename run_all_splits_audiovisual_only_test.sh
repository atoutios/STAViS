#!/usr/bin/env bash

rm -r ~/STAViS/data/annotations/feasibility
cp -r ~/STAViS/data/annotations/ASD/feasibility ~/STAViS/data/annotations

base_path='./experiments/asd14_step32_test'

split=1
results_path='split'${split}'_results'
mkdir -p ${base_path}'/'${results_path}

python3 main.py --gpu_devices 0 --batch_size 32 --n_threads 4 \
	--audiovisual \
	--no_train --no_val \
    --root_path ${base_path} --result_path ${results_path} \
	--audio_pretrain_path ./data/pretrained_models/soundnet8.pth \
	--pretrain_path ./data/earlitec_models/asd_step32_optimal.pth \
	--annotation_path_feasibility_train ./data/fold_lists/feasibility_list_train_${split}_fps.txt \
	--annotation_path_feasibility_test ./data/fold_lists/feasibility_list_test_${split}_fps.txt