%ARSO_MotionCaptureMaster
clc
clear all
close all
if ispc %JSM PC
    codepath = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    dataPath = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\COMPhaseSpacePlanningData\Data\Sub01\Trials';
elseif ismac %MT Mac
    codePath = '/Users/MT/Documents/GitHub/COMPhaseSpacePlanning';
    dataPath = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/COMPhaseSpacePlanningData/Data/Sub01/mat';
end

cd(codePath)
    %     cd('/Users/MT/Documents/GitHub/COMPhaseSpacePlanning');

%create method for changing directory to googledrive
addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

%% Experiment Info 
totalTrials =   192;
totalCond =     8;      %req for formatting trial results
totalExp =      12;     %req for formatting trial results

for trialNum = 1:totalTrials
    % Identify location where files are stored
    cd('/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/COMPhaseSpacePlanningData/Data/Sub01/Trials');
    
    fid = [dataPath filesep sprintf('trial%03d',trialNum) '.mat'];
    
    %% Initial conditions
    mmHeight = 1;
    kgMass   = 1;
    
    %% bodySegLength function
    % Function outputs length for individual body segs
    [bodySegLength] = calcBodySegLength(mmHeight);
    
    %% calcBodySegMass function
    % Function outputs mass for individual body segs
    [bodySegMass,segPropWeight] = calcBodySegMass(kgMass);
    
    %% Load data from specific fid
    % Function loads req outputs from .mat files
    [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS,tracker,bb]...
        = loadPhaseSpaceMoCapData(fid);
    
    %% Plot full body MoCap for trial from start to finish
    figure(trialNum)
    
    % for fr = 805:10:1117
    %     %Clear current frame
    %     clf
    %
    %     %Plot all markers in x,y, and z
    %     plot3(data_mar_dim_frame(:, 1, fr),...
    %         data_mar_dim_frame(:, 2, fr),...
    %         data_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    %
    %     hold on
    %
    %     %% Uncover the unknown marker location
    %     plot3(tracker(1,fr),...
    %         tracker(2,fr),...
    %         tracker(3,fr),'p','DisplayName','STRN');
    %
    %     %% Seg Evals in 3D
    %     %plot of total anatomical COM
    %     plot3(segCenter.RHandCenter_mar_dim_frame(1,fr),...
    %         segCenter.RHandCenter_mar_dim_frame(2,fr),...
    %         segCenter.RHandCenter_mar_dim_frame(3,fr),'p','DisplayName','Next');
    %
    %     %% Total Body COM in 3D
    %     %plot of total anatomical COM
    %     plot3(totalCOMXYZ(1,fr),...
    %         totalCOMXYZ(2,fr),...
    %         totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
    % %
    %     %% Plotting parameters
    %     axis equal
    %     grid on
    %     legend
    %
    %     %optimal x y z graph limits
    %     xlim([-1e3 5e3])
    %     ylim([-1e3 1e3]) %full lab
    % %    ylim([1e3 3e3]) %smaller space
    %     zlim([0 3e3])
    %
    %     %unsure of what this section XYZs
    %     az = -84.362;
    %     el =  20.417;
    %     view(az,el)
    %
    %
    %    drawnow
    % end
    
    
    %     %% Butterworth filter
    %     order   = 4;
    %     cutoff  = 7;
    %
    %     [data_mar_dim_frame] = butterLowZero(order,cutoff,framerate,data); % data_mar_dim_frame, %left(1:numel(markerLabels),:,:) right(1:numel(markerLabels),1:3,:) Butterworth filter each marker's data and load it into the trial
    
    %% calcSegCOM function
    %Function outputs totalCOM considering marker location
    [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
    
    %% calcSegWeightCOM function
    %Function outputs totalCOM depending on seg weight
    [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
    
    %% locEmptySegFrames function
    % Function outputs marker frames evaluation
    [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
    
    %% calcMar_Vel_Acc_Jerk function
    %function outputs vel,acc, and jerk values for LFoot and RFoot
    [LFoot,RFoot,totalCOM_calc,trial_start_end] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ);
    totalCOM_jerk_per_frame = totalCOM_calc.marJerk_abs./length(trial_start_end);
    totalCOM_jerk_per_trial(trialNum) = sum(totalCOM_jerk_per_frame);
    
    %     cond = totalCOM_jerk_per_trial
    %     figure(trialNum)
    %     plot(RFoot.marJerk_abs)
    %     hold on
    %     plot(LFoot.marJerk_abs)
    
    %         %% ZeniStepFinder
    %         % Identify all heel-toe step locations
    %         [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
    
    %     %% Vel_Acc_Jerk_per_step
    %     [totalCOM_totalJerk_per_step,totalAnkleJerk_per_step] = Vel_Acc_Jerk_per_step(step_TO_HS,RFoot,LFoot,totalCOM_calc,numFrames);
    %
    % %     rJerk_per_trial(trialNum) =       rFoot_totalJerk;
    % %     lJerk_per_trial(trialNum) =       lFoot_totalJerk;
    %     totalJerk_per_trial(trialNum) =             totalAnkleJerk_per_step;
    %     totalCOM_totalJerk_per_trial(trialNum) =    totalCOM_totalJerk_per_step;
    
end

%% Find conditions of different trials
[condMatrix] = formatCond(totalCOM_jerk_per_trial,totalCond,totalExp);
