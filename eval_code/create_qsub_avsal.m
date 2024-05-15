function create_qsub_avsal(res_path, annot_base_path, pred_path)

%%%% Feasibility %%%%%%%%%
for split=1:14
    annot_file = [annot_base_path '/fold_lists/feasibility_list_test_' num2str(split) '_fps.txt'];
    fileID = fopen(annot_file,'r');
    txt_data = textscan(fileID,'%s','delimiter','\n');
    fclose(fileID);
    vid_nums(split)=length(txt_data{1});
end

fid1=fopen(['eval_code/feasibility_eval.sh'],'w');
fprintf(fid1,'#!/usr/bin/env bash\n\n');
for split=1:14
    for i=1:vid_nums(split)
        fprintf(fid1,'matlab -nodesktop -nodisplay -nojvm ');
        fprintf(fid1,['-r "addpath(genpath(' char(39) './eval_code' char(39) ')); ']);
        fprintf(fid1,'eval_feasibility1(''%s'', ''%s'', ''%s'', ''%s'', ''%s'')\"\n', pred_path, annot_base_path, res_path, num2str(i),num2str(split));
    end
end
fclose(fid1);

exit;
end
