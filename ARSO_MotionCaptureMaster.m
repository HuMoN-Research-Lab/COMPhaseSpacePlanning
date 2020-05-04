%ARSO_MotionCaptureMaster
clc
clear all
close all

cd('/Users/MT/Documents/GitHub/COMPhaseSpacePlanning');

%create method for changing directory to googledrive
addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

%% Trial calc for loop

for iter = 1:3
    % Identify location where files are stored
    cd('/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/COMPhaseSpacePlanningData/mat files');
%     addpath(genpath(cd))
    
    switch iter
        case 1
            condTitle = 'Free_Walking';
            trialNum = 11;
            fid = sprintf('trial0%d',trialNum);
            
        case 2
            condTitle = 'Full_Vision';
            trialNum = 42;
            fid = sprintf('trial0%d',trialNum);
            
        case 3
            condTitle = 'Limited_Vision';
            trialNum = 15;
            fid = sprintf('trial0%d',trialNum);
    end
    
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
    [sub01,trialName] = loadPhaseSpaceMoCapData(fid,condTitle);
%     trialName = horzcat(condTitle,'_',fid);
    
%     %% Butterworth filter
%     order   = 4;
%     cutoff  = 7;
%
%     [data_mar_dim_frame] = butterLowZero(order,cutoff,framerate,data); % data_mar_dim_frame, %left(1:numel(markerLabels),:,:) right(1:numel(markerLabels),1:3,:) Butterworth filter each marker's data and load it into the trial
    
    %% calcSegCOM function
    %Function outputs totalCOM considering marker location
    [segCenter] = calcPhaseSpaceSegCOM(sub01.(trialName).data_mar_dim_frame,sub01.(trialName).markerLabels,trialName); %,markerID)
    
    %% calcSegWeightCOM function
    %Function outputs totalCOM depending on seg weight
    [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
    
    %% locEmptySegFrames function
    % Function outputs marker frames evaluation
    [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
    
    %% calcMar_Vel_Acc_Jerk function
    [LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ);
    
    %PROBABLY DONT NEED THIS
%     sub01.(trialName).COMVel =        marVel;
%     sub01.(trialName).COMAcc =        marAcc;
%     sub01.(trialName).COMJerk =       marJerk;
%     sub01.(trialName).LFoot =         LFoot;
%     sub01.(trialName).RFoot =         RFoot;
    
%         %% ZeniStepFinder
%         % Identify all heel-toe step locations
%         [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
    
    %% Vel_Acc_Jerk_per_step
    [rStep_acc,lStep_acc,rStep_jerk,lStep_jerk] = Vel_Acc_Jerk_per_step(sub01.(trialName).step_TO_HS,RFoot,LFoot);
    
    %Make this the sole output
%     rJerk =     iter:length(rStep_jerk);
    rJerk(trialNum) =     rStep_jerk;
%     lJerk =     iter:length(lStep_jerk);
    lJerk(trialNum) =     lStep_jerk;
%     totalJerk = sum(rJerk(iter) lJerk(iter));
%     sub01.(trialName).lStep_jerk =    lStep_jerk;
end
    
    
%%Dont touch above!!!    
    


        %% calcMar_Vel_Acc_Jerk function
        [marVel,marAcc,marJerk,marJerk_squared,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(sub01.(trialName).segCenter,sub01.(trialName).totalCOMXYZ);
        sub01.(trialName).COMVel =        marVel;
        sub01.(trialName).COMAcc =        marAcc;
        sub01.(trialName).COMJerk =       marJerk;
        sub01.(trialName).LFoot =         LFoot;
        sub01.(trialName).RFoot =         RFoot;
        
%         %% ZeniStepFinder
%         % Identify all heel-toe step locations
%         [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);

        %% Vel_Acc_Jerk_per_step
        [rStep_acc,lStep_acc,rStep_jerk,lStep_jerk] = Vel_Acc_Jerk_per_step(sub01.(trialName).step_TO_HS,sub01.(trialName));
%         FreeWalking.rStep_vel =     rStep_vel;
%         FreeWalking.lStep_vel =     lStep_vel;
%         FreeWalking.rStep_Acc =     rStep_Acc;
%         FreeWalking.lStep_Acc =     lStep_Acc;
        sub01.(trialName).rStep_jerk =    rStep_jerk;
        sub01.(trialName).lStep_jerk =    lStep_jerk;
        
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
    end
        %% RFoot calcs and plots
        FreeWalking.RFootVel =      RFoot.marVel;
        FreeWalking.RFootAcc =      RFoot.marAcc;
        FreeWalking.RFootJerk =     RFoot.marJerk;
        
%         figure(12)
%         subplot(2,3,1)
%         plot(FreeWalking.RFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('RFoot Velocity')
%         
%         subplot(2,3,2)
%         plot(FreeWalking.RFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('RFoot Acceleration')
%         
%         subplot(2,3,3)
%         plot(FreeWalking.RFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('RFoot Jerk') 
        
        %% LFoot calcs and plots
        FreeWalking.LFootVel =      LFoot.marVel;
        FreeWalking.LFootAcc =      LFoot.marAcc;
        FreeWalking.LFootJerk =     LFoot.marJerk;

%         subplot(2,3,4)
%         plot(FreeWalking.LFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('LFoot Velocity')
%         
%         subplot(2,3,5)
%         plot(FreeWalking.LFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('LFoot Acceleration')
%         
%         subplot(2,3,6)
%         plot(FreeWalking.LFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('LFoot Jerk')         
        
 
    if fid == 'trial042' %condTitle == 'Full Vision'
% % %         processedData.FullVisionData.filteredData =             data_mar_dim_frame;
% % %         processedData.FullVisionData.allSteps =                 allSteps;
% % %         processedData.FullVisionData.step_hs_to_ft_XYZ =        step_hs_to_ft_XYZ;
% % %         processedData.FullVisionData.peaks =                    peaks;
      
        %% calcSegCOM function
        %Function outputs totalCOM considering marker location
        [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
        FullVision.segCenter = segCenter; %{iter}
        
        %% calcSegWeightCOM function
        %Function outputs totalCOM depending on seg weight
        [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
        FullVision.totalCOMXYZ = totalCOMXYZ;
        
        %% locEmptySegFrames function
        % Function outputs marker frames evaluation
        [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
        
        %% calcMar_Vel_Acc_Jerk function
        [marVel,marAcc,marJerk,marJerk_squared,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ);        
        FullVision.COMVel =    marVel;
        FullVision.COMAcc =    marAcc;
        FullVision.COMJerk =   marJerk;

        %% ZeniStepFinder
        % Identify all heel-toe step locations
        [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);

        %% Vel_Acc_Jerk_per_step
        [rStep_vel,lStep_vel,rStep_Acc,lStep_Acc,rStep_Jerk,lStep_Jerk] = Vel_Acc_Jerk_per_step(allSteps,hs_to_ft_Data);
        FullVision.rStep_Jerk =    rStep_Jerk;
        FullVision.lStep_Jerk =    lStep_Jerk;
        
        % Plots for velocity, acceleration, and jerk
        figure(42)
        subplot(1,3,1)
        plot(FullVision.COMVel,'r-o','MarkerSize',2)
        hold on
        grid on
        title('COM Velocity')
        
        subplot(1,3,2)
        plot(FullVision.COMAcc,'b-o','MarkerSize',2)
        hold on
        title('COM Acceleration')
        
        subplot(1,3,3)
        plot(FullVision.COMJerk,'g-o','MarkerSize',2)
        hold on
        title('COM Jerk')

        %% RFoot calcs and plots
        FullVision.RFootVel =      RFoot.marVel;
        FullVision.RFootAcc =      RFoot.marAcc;
        FullVision.RFootJerk =     RFoot.marJerk;
        
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
        FullVision.LFootVel =      LFoot.marVel;
        FullVision.LFootAcc =      LFoot.marAcc;
        FullVision.LFootJerk =     LFoot.marJerk;

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
        
    end

    if fid == 'trial015' %condTitle == 'Limited Vision'
% %         processedData.LimitedVisionData.filteredData =          data_mar_dim_frame;
% %         processedData.LimitedVisionData.allSteps =              allSteps;
% %         processedData.LimitedVisionData.step_hs_to_ft_XYZ =     step_hs_to_ft_XYZ;
% %         processedData.LimitedVisionData.peaks =                 peaks;
         
        %% calcSegCOM function
        %Function outputs totalCOM considering marker location
        [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
        LimitedVision.segCenter = segCenter; %{iter}
        
        %% calcSegWeightCOM function
        %Function outputs totalCOM depending on seg weight
        [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
        LimitedVision.totalCOMXYZ = totalCOMXYZ;
        
        %% locEmptySegFrames function
        % Function outputs marker frames evaluation
        [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
        
        %% calcMar_Vel_Acc_Jerk function
        [marVel,marAcc,marJerk,marJerk_squared,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ);
        LimitedVision.COMVel =    marVel;
        LimitedVision.COMAcc =    marAcc;
        LimitedVision.COMJerk =   marJerk;

        %% ZeniStepFinder
        % Identify all heel-toe step locations
        [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);

        %% Vel_Acc_Jerk_per_step
        [rStep_vel,lStep_vel,rStep_Acc,lStep_Acc,rStep_Jerk,lStep_Jerk] = Vel_Acc_Jerk_per_step(allSteps,hs_to_ft_Data);
        LimitedVision.rStep_Jerk =    rStep_Jerk;
        LimitedVision.lStep_Jerk =    lStep_Jerk;
        
        % Plots for velocity, acceleration, and jerk
        figure(15)
        subplot(1,3,1)
        plot(LimitedVision.COMVel,'r-o','MarkerSize',2)
        hold on
        grid on
        title('COM Velocity')
        
        subplot(1,3,2)
        plot(LimitedVision.COMAcc,'b-o','MarkerSize',2)
        hold on
        title('COM Acceleration')
        
        subplot(1,3,3)
        plot(LimitedVision.COMJerk,'g-o','MarkerSize',2)
        hold on
        title('COM Jerk')
        
        %% RFoot calcs and plots
        LimitedVision.RFootVel =      RFoot.marVel;
        LimitedVision.RFootAcc =      RFoot.marAcc;
        LimitedVision.RFootJerk =     RFoot.marJerk;
        
%         figure(16)
%         subplot(2,3,1)
%         plot(LimitedVision.RFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('RFoot Velocity')
%         
%         subplot(2,3,2)
%         plot(LimitedVision.RFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('RFoot Acceleration')
%         
%         subplot(2,3,3)
%         plot(LimitedVision.RFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('RFoot Jerk') 
        
        %% LFoot calcs and plots
        LimitedVision.LFootVel =      LFoot.marVel;
        LimitedVision.LFootAcc =      LFoot.marAcc;
        LimitedVision.LFootJerk =     LFoot.marJerk;

%         subplot(2,3,4)
%         plot(LimitedVision.LFootVel,'r-o','MarkerSize',2)
%         hold on
%         grid on
%         title('LFoot Velocity')
%         
%         subplot(2,3,5)
%         plot(LimitedVision.LFootAcc,'b-o','MarkerSize',2)
%         hold on
%         title('LFoot Acceleration')
%         
%         subplot(2,3,6)
%         plot(LimitedVision.LFootJerk,'g-o','MarkerSize',2)
%         hold on
%         title('LFoot Jerk')
        
    end 

%% Plot data
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



%% Troubleshooting Section
% %% loadPhaseSpaceMoCapData function loads Phase Space Planning data
% fileName = ('trial011');
% 
% [numFrames,framerate,markerLabels,data_mar_dim_frame] ... 
%     = loadPhaseSpaceMoCapData(fileName);
% 
% %% calcSegCOM function
% %Function outputs totalCOM considering marker location
% [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
% FreeWalking.segCenter = segCenter; %{iter}
% 
% %% calcSegWeightCOM function
% %Function outputs totalCOM depending on seg weight
% [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
