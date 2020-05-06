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

%% Trial calc for loop

for trialNum = 11:11
    % Identify location where files are stored
    cd('/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/COMPhaseSpacePlanningData/Data/Sub01/Trials');
%     addpath(genpath(cd))
    
%     switch trialNum
%         case 1
%             condTitle = 'Free_Walking';
%             trialNum = 11;
%             fid = sprintf('trial0%d',trialNum);
%             
%         case 2
%             condTitle = 'Full_Vision';
%             trialNum = 42;
%             fid = sprintf('trial0%d',trialNum);
%             
%         case 3
%             condTitle = 'Limited_Vision';
%             trialNum = 15;
%             fid = sprintf('trial0%d',trialNum);
%     end
    
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
%     [numFrames,framerate,markerLabels,data_mar_dim_frame,step_TO_HS] ...
%         = loadPhaseSpaceMoCapData(fid,condTitle);    
    [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS] ...
        = loadPhaseSpaceMoCapData(fid);
    
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
    [LFoot,RFoot,totalCOM_calc] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ);
    
    figure(trialNum)
    plot(RFoot.marJerk_abs)
    hold on
    plot(LFoot.marJerk_abs)
    
%         %% ZeniStepFinder
%         % Identify all heel-toe step locations
%         [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
    
    %% Vel_Acc_Jerk_per_step
    [totalCOM_totalJerk_per_step,totalAnkleJerk_per_step] = Vel_Acc_Jerk_per_step(step_TO_HS,RFoot,LFoot,totalCOM_calc,numFrames);

%     rJerk_per_trial(trialNum) =       rFoot_totalJerk;
%     lJerk_per_trial(trialNum) =       lFoot_totalJerk;
    totalJerk_per_trial(trialNum) =             totalAnkleJerk_per_step;
    totalCOM_totalJerk_per_trial(trialNum) =    totalCOM_totalJerk_per_step;
        
end

    %% COM plots
%         % Plots for velocity, acceleration, and jerk
%         figure(11)
%         subplot(1,3,1)
%         plot(FreeWalking.COMVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('COM Velocity')
%         
%         subplot(1,3,2)
%         plot(FreeWalking.COMAcc,'b-o','MarkerSize',2)
%         hold on
%         title('COM Acceleration')
%         
%         subplot(1,3,3)
%         plot(FreeWalking.COMJerk,'g-o','MarkerSize',2)
%         hold on
%         title('COM Jerk')         

        %% RFoot calcs and plots        
%         figure(43)
%         subplot(2,3,1)
%         plot(FullVision.RFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('RFoot Velocity')
%         
%         subplot(2,3,2)
%         plot(FullVision.RFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('RFoot Acceleration')
%         
%         subplot(2,3,3)
%         plot(FullVision.RFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('RFoot Jerk') 
        
        %% LFoot calcs and plots
%         subplot(2,3,4)
%         plot(FullVision.LFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('LFoot Velocity')
%         
%         subplot(2,3,5)
%         plot(FullVision.LFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('LFoot Acceleration')
%         
%         subplot(2,3,6)
%         plot(FullVision.LFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('LFoot Jerk')

%% Plot MoCap data for trial from start to finish
% figure(6801)
% 
% for fr = 1:10:numFrames
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
% %     plot3(unknownID(1,fr),...
% %         unknownID(2,fr),...
% %         unknownID(3,fr),'p','DisplayName','RWRB');
% 
% %     %% Seg Evals in 3D
% %     %plot of total anatomical COM
% %     plot3(segCenter.RHandCenter_mar_dim_frame(1,fr),...
% %         segCenter.RHandCenter_mar_dim_frame(2,fr),...
% %         segCenter.RHandCenter_mar_dim_frame(3,fr),'p','DisplayName','Next');
%     
%     %% Total Body COM in 3D
%     %plot of total anatomical COM
%     plot3(totalCOMXYZ(1,fr),...
%         totalCOMXYZ(2,fr),...
%         totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
%     
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