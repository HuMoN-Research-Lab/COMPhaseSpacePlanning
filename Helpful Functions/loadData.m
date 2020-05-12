function [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS,markerXYZ,x_diff] ...
    = loadData(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadPhaseSpaceMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load file based on fileName
% sub01 = [];
load(fid);
% load([fid '.mat']);
close(figure)

%% Extract variables from data and put into struct
data_mar_dim_frame = permute(c3dData.c3dData_fr_mar_dim,[2,3,1]);     %major data set
markerLabels = (marNames).';
numFrames = endFrame;  % - startFrames;

%% Track data of sternum marker for trials
markerID =      'STRN';
markerXYZ =     squeeze(data_mar_dim_frame(~cellfun(@isempty, strfind(markerLabels,markerID)),1:3,:));
% x_diff =        diff(markerXYZ(1,:));
step_TO_HS =    step_fr_ft_XYZ;

% jj = x_diff;
% 
% %% Filter for the start of the trial
% 
% if jj >= 1.0
%     startTrial = find(jj >= 1.0,1);
%     startStep = find(step_TO_HS >= startTrial,1); %references 2nd row
%     revised_step_TO_HS = step_TO_HS(startStep:end,:);
% end
% 
% %First step filter
% step_TO_HS = revised_step_TO_HS;
% leftStep = find(step_TO_HS(:,3) == 1);
% rightStep = find(step_TO_HS(:,3) == 2);
% leftStep_filter = diff(leftStep);
% rightStep_filter = diff(rightStep);
% 
% for jj = leftStep_filter
%     filter = find(jj == 1);
%     leftStep = leftStep(1:filter);
% end
% 
% for kk = rightStep_filter
%     filter = find(kk == 1);
%     rightStep = rightStep(1:filter);
% end

% %Draft
% revLStep = mod(leftStep,2);
% leftStep = leftStep(revLStep);
% 
% revRStep = ~mod(rightStep,2);
% rightStep = rightStep(revRStep);

end
