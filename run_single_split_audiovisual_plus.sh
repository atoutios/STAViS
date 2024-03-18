#!/usr/bin/env bash

# Train and test STAViS audiovisual models for all splits

base_path='./experiments/audiovisual_train_test'

split=1
results_path='split'${split}'_results'
mkdir -p ${base_path}'/'${results_path}

python3 main.py --gpu_devices 0 --batch_size 32 --n_threads 12 \
    --audiovisual --checkpoint 10 --n_epochs 60 \
    --root_path ${base_path} --result_path ${results_path} \
    --resume_path ./data/pretrained_models/stavis_audiovisual/audiovisual_split${split}_save_60.pth \
	--annotation_path_coutrot1_train ./data/fold_lists/Coutrot_db1_list_train_${split}_fps.txt \
	--annotation_path_coutrot1_test ./data/fold_lists/Coutrot_db1_list_test_${split}_fps.txt \
	--annotation_path_coutrot2_train ./data/fold_lists/Coutrot_db2_list_train_${split}_fps.txt \
	--annotation_path_coutrot2_test ./data/fold_lists/Coutrot_db2_list_test_${split}_fps.txt \
	--annotation_path_summe_train ./data/fold_lists/SumMe_list_train_${split}_fps.txt \
	--annotation_path_summe_test ./data/fold_lists/SumMe_list_test_${split}_fps.txt \
	--annotation_path_etmd_train ./data/fold_lists/ETMD_av_list_train_${split}_fps.txt \
	--annotation_path_etmd_test ./data/fold_lists/ETMD_av_list_test_${split}_fps.txt \
	--annotation_path_avad_train ./data/fold_lists/AVAD_list_train_${split}_fps.txt \
	--annotation_path_avad_test ./data/fold_lists/AVAD_list_test_${split}_fps.txt
