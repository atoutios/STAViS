#!/usr/bin/env bash

source run_opts.sh

rm -r ~/STAViS/data/annotations/feasibility
cp -r ~/STAViS/data/annotations/${dx}/feasibility ~/STAViS/data/annotations

base_path='./experiments/'
results_path=${dx}'_split'${split}
mkdir -p ${base_path}'/'${results_path}

python3 main.py --gpu_devices 0 --batch_size 32 --n_threads 4 \
    --audiovisual --checkpoint 13 --n_epochs 13 \
    --root_path ${base_path} --result_path ${results_path} \
	--audio_pretrain_path ./data/pretrained_models/soundnet8.pth \
	--pretrain_path ./data/pretrained_models/stavis_audiovisual/audiovisual_split1_save_60.pth \
	--annotation_path_feasibility_train ./data/fold_lists/feasibility_list_train_${split}_fps.txt \
	--annotation_path_feasibility_test ./data/fold_lists/feasibility_list_test_${split}_fps.txt