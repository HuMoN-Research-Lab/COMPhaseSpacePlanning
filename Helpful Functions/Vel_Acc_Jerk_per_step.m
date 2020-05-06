function [totalCOM_totalJerk_per_step,totalAnkleJerk_per_step] = Vel_Acc_Jerk_per_step(step_TO_HS,RFoot,LFoot,totalCOM_calc,numFrames)

%% Formatting of vel,acc,jerk
%velocity
rAnkVel2D =         RFoot.marVel';
lAnkVel2D =         LFoot.marVel';
totalCOM_vel2D =    totalCOM_calc.marVel';

%acceleration
rAnkAcc2D =         RFoot.marAcc';
lAnkAcc2D =         LFoot.marAcc';
totalCOM_acc2D =    totalCOM_calc.marAcc';

%jerk
rAnkJerk2D =        RFoot.marJerk_abs';
lAnkJerk2D =        LFoot.marJerk_abs';
totalCOM_jerk2D =   totalCOM_calc.marJerk_abs';

%% Formatting step per foot and COM
for ii = step_TO_HS(:,3)    
    %Find points where toe and heel hit ground start at frame 1
    allSteps_TO = step_TO_HS(:,1) - (step_TO_HS(1,1)-1);
    allSteps_HS = step_TO_HS(:,2) - (step_TO_HS(1,1)-1);
    
    %Right step id
    rStep_id(:,1) = allSteps_TO(find(ii == 1));
    rStep_id(:,2) = allSteps_HS(find(ii == 1));
    
    %Left step id
    lStep_id(:,1) = allSteps_TO(find(ii == 2));
    lStep_id(:,2) = allSteps_HS(find(ii == 2));    
    
    %COM step id
    %if right step first use those values
    %if left step first use those values
    if ii(find(ii == 1)) == 1
        totalCOMStep_id(:,1) = allSteps_TO(find(ii == 1));
        totalCOMStep_id(:,2) = allSteps_HS(find(ii == 1));
    elseif ii(find(ii == 1)) == 2
        totalCOMStep_id(:,1) = allSteps_TO(find(ii == 2));
        totalCOMStep_id(:,2) = allSteps_HS(find(ii == 2));
    end
%     COMStep_id = COMStep_id;
end

%% Create frames of each step and calc vel, acc, and jerk
%Right foot
numSteps = length(rStep_id(:,1));
for ii = 1:numSteps
    iterStep =                  rStep_id(ii,1):rStep_id(ii,2);
    rVel_per_step_frame =       rAnkVel2D(iterStep);
    rVel_per_step(ii) =         sum(rVel_per_step_frame);
    rVel_per_time(ii) =         rVel_per_step(ii)./numFrames;        
    rAcc_per_step_frame =       rAnkAcc2D(iterStep);
    rAcc_per_step(ii) =         sum(rAcc_per_step_frame);
    rAcc_per_time(ii) =         rAcc_per_step(ii)./numFrames;        
    rJerk_per_step_frame =      rAnkJerk2D(iterStep);
    rJerk_per_step(ii) =        sum(rJerk_per_step_frame);
    rJerk_per_time(ii) =        rJerk_per_step(ii)./numFrames;
end

rFoot_totalJerk_per_step =      sum(rJerk_per_step);
rFoot_totalJerk_per_time =      sum(rJerk_per_time);


%Left foot
numSteps = length(lStep_id(:,1));
for ii = 1:numSteps
    iterStep =                  lStep_id(ii,1):lStep_id(ii,2);
    lVel_per_step_frame =       lAnkVel2D(iterStep);
    lVel_per_step(ii) =         sum(lVel_per_step_frame);
    lVel_per_time(ii) =         lVel_per_step(ii)./numFrames;
    lAcc_per_step_frame =       lAnkAcc2D(iterStep);
    lAcc_per_step(ii) =         sum(lAcc_per_step_frame);
    lAcc_per_time(ii) =         lAcc_per_step(ii)./numFrames;
    lJerk_per_step_frame =      lAnkJerk2D(iterStep);
    lJerk_per_step(ii) =        sum(lJerk_per_step_frame);
    lJerk_per_time(ii) =        lJerk_per_step(ii)./numFrames;
end

lFoot_totalJerk_per_step =      sum(lJerk_per_step);
lFoot_totalJerk_per_time =      sum(lJerk_per_time);

%Total jerk from LFoot and RFoot
totalAnkleJerk_per_step = plus(rFoot_totalJerk_per_step,lFoot_totalJerk_per_step);
totalAnkleJerk_per_time = plus(rFoot_totalJerk_per_time,lFoot_totalJerk_per_time);

%COM steps
for ii = 1:numSteps
    iterStep =                          totalCOMStep_id(ii,1):totalCOMStep_id(ii,2);
    totalCOMVel_per_step_frame =        totalCOM_vel2D(iterStep);
    totalCOMVel_per_step(ii) =          sum(totalCOMVel_per_step_frame);
    totalCOMVel_per_time(ii) =          totalCOMVel_per_step(ii)./numFrames;
    totalCOMAcc_per_step_frame =        totalCOM_acc2D(iterStep);
    totalCOMAcc_per_step(ii) =          sum(totalCOMAcc_per_step_frame);
    totalCOMAcc_per_time(ii) =          totalCOMAcc_per_step(ii)./numFrames;
    totalCOMJerk_per_step_frame =       totalCOM_jerk2D(iterStep);
    totalCOMJerk_per_step(ii) =         sum(totalCOMJerk_per_step_frame);
    totalCOMJerk_per_time(ii) =         totalCOMJerk_per_step(ii)./numFrames;
end

totalCOM_totalJerk_per_step =      sum(totalCOMJerk_per_step);
totalCOM_totalJerk_per_time =      sum(totalCOMJerk_per_time);

end

