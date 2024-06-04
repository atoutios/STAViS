import os
import json
import torch

from opts import parse_opts
from model import generate_model
from mean import get_mean, get_std


if __name__ == '__main__':

    torch.backends.cudnn.benchmark = False  # type: bool

    opt = parse_opts()
    #os.environ["CUDA_VISIBLE_DEVICES"] = opt.gpu_devices
    opt.result_path = os.path.join(opt.root_path, opt.result_path)
    if not os.path.exists(opt.result_path):
        os.makedirs(opt.result_path)
    print(opt.result_path)

    opt.arch = '{}-{}'.format(opt.model, opt.model_depth)
    opt.mean = get_mean(opt.norm_value, dataset=opt.mean_dataset)
    opt.std = get_std(opt.norm_value)

    torch.manual_seed(opt.manual_seed)

    if opt.audiovisual:
        opt.learning_rate_global = opt.learning_rate / 100
        opt.learning_rate_sal = opt.learning_rate / 100
        opt.learning_rate_sound = opt.learning_rate / 10
        opt.learning_rate_fusion = opt.learning_rate
    else:
        opt.learning_rate_global = opt.learning_rate / 10
        opt.learning_rate_sal = opt.learning_rate / 100
        opt.learning_rate_sound = 0
        opt.learning_rate_fusion = 0

    print(opt)
    with open(os.path.join(opt.result_path, 'opts.json'), 'w') as opt_file:
        json.dump(vars(opt), opt_file)

    model, parameters = generate_model(opt)
    print(model)
    print(model.module.fusion3)

    # Freeze all layers
    for param in model.parameters():
        param.requires_grad = False

    for param in model.module.fusion3.parameters():
        param.requires_grad = True

    for param in model.module.fuse.parameters():
        param.requires_grad = True

    for param in model.module.fuseav.parameters():
        param.requires_grad = True


    
