#!/usr/bin/env bash

# Train and test STAViS audiovisual models for all splits

base_path='./experiments/audiovisual_train_test'

split=1
results_path='split'${split}'_results'
mkdir -p ${base_path}'/'${results_path}

python3 main.py --gpu_devices 0 --batch_size 32 --n_threads 12 \
    --audiovisual --checkpoint 10 --n_epochs 60 \
    --root_path ${base_path} --result_path ${results_path} \
    --resume_path ./data/earlitec_models/earlitec_split${split}_save_60.pth \\
	--pretrain_path ./data/pretrained_models/stavis_audiovisual/audiovisual_split1_save_60.pth \
	--annotation_path_feasibility_train ./data/fold_lists/feasibility_list_train_${split}_fps.txt \
	--annotation_path_feasibility_test ./data/fold_lists/feasibility_list_test_${split}_fps.txt #\