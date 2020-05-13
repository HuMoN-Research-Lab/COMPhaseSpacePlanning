function [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS,markerXYZ] ...
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
step_TO_HS =    step_fr_ft_XYZ;

end
