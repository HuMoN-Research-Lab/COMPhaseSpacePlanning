function [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS] ...
    = loadPhaseSpaceMoCapData(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadPhaseSpaceMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load file based on fileName
% sub01 = [];
load(fid);
% load([fid '.mat']);
close(figure)

%% Structure file name
% fid = erase(fid,'.c3d');
% condTitle = replace(condTitle,' ','_');
% trialName = horzcat(condTitle,'_',fid);

%% Extract variables from data and put into struct
data_mar_dim_frame = permute(c3dData.c3dData_fr_mar_dim,[2,3,1]);     %major data set
markerLabels = (marNames).';
numFrames = endFrame;  % - startFrames;
step_TO_HS = step_fr_ft_XYZ;

% sub01.(trialName).data_mar_dim_frame = data_mar_dim_frame;
% sub01.(trialName).markerLabels = (marNames).';
% sub01.(trialName).numFrames = endFrame;  % - startFrames;
% sub01.(trialName).step_TO_HS = step_fr_ft_XYZ;

%% Track data of unspecified marker for trials
% tracker = 13;
% tracker = squeeze(data_mar_dim_frame(15, 1:3, :)); %(nanmean

end
