from datasets.saliency_db import saliency_db


def get_training_set(opt, spatial_transform, temporal_transform,
					 target_transform):

	assert opt.dataset in ['feasibility']
	print('Creating training dataset: {}'.format(opt.dataset))

	if opt.dataset == 'feasibility':
		training_data = saliency_db(
			opt.video_path_feasibility,
			opt.annotation_path_diem_feasibility,
			opt.salmap_path_feasibility,
			opt.audio_path_feasibility,
			spatial_transform=spatial_transform,
			temporal_transform=temporal_transform,
			target_transform=target_transform)
	

	return training_data


def get_validation_set(opt, spatial_transform, temporal_transform,
					   target_transform):

	assert opt.dataset in ['feasibility']
	print('Creating validation dataset: {}'.format(opt.dataset))

	if opt.dataset == 'feasibility':
		validation_data = saliency_db(
			opt.video_path_feasibility,
			opt.annotation_path_feasibility_test,
			opt.salmap_path_feasibility,
			opt.audio_path_feasibility,
			spatial_transform=spatial_transform,
			temporal_transform=temporal_transform,
			target_transform=target_transform)

	return validation_data


def get_test_set(opt, spatial_transform, temporal_transform, target_transform):

	assert opt.dataset in ['feasibility']
	print('Creating testing dataset: {}'.format(opt.dataset))

	if opt.dataset == 'feasibility':
		test_data = saliency_db(
			opt.video_path_feasibility,
			opt.annotation_path_feasibility_test,
			opt.salmap_path_feasibility,
			opt.audio_path_feasibility,
			spatial_transform,
			temporal_transform,
			target_transform,
			exhaustive_sampling=True)

	return test_data
