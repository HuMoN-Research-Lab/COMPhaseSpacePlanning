function [rStep_Acc,lStep_Acc,rStep_Jerk,lStep_Jerk] = Vel_Acc_Jerk_per_step(allSteps,subject_trial,trialName)

%% Formatting of vel,acc,jerk
%velocity
rAnkVel2D = subject_trial.RFoot.marVel';
lAnkVel2D = subject_trial.LFoot.marVel';
%acceleration
rAnkAcc2D = subject_trial.RFoot.marAcc';
lAnkAcc2D = subject_trial.LFoot.marAcc';
%jerk
rAnkJerk2D = subject_trial.RFoot.marAcc;
lAnkJerk2D = subject_trial.LFoot.marJerk';

%% Formatting step per foot
for ii = allSteps(:,3)
    allSteps_TO = allSteps(:,1);
    allSteps_HS = allSteps(:,2);
    
    %Right step id
    rStep_finder = find(ii == 1);
    rStep_id(:,1) = allSteps_TO(rStep_finder);
    rStep_id(:,2) = allSteps_HS(rStep_finder);
    
    %Left step id
    lStep_finder = find(ii == 2);    
    lStep_id(:,1) = allSteps_TO(lStep_finder);
    lStep_id(:,2) = allSteps_HS(lStep_finder);
end

%% Create frames of each step to reference
%Right foot
if rStep_id >= 0
    rStep_1(:,1) =  rStep_id(1,1):rStep_id(1,2);
    rStep_2(:,1) =  rStep_id(2,1):rStep_id(2,2);
    rStep_3(:,1) =  rStep_id(3,1):rStep_id(3,2);
    rStep_4(:,1) =  rStep_id(4,1):rStep_id(4,2);
    rStep_5(:,1) =  rStep_id(5,1):rStep_id(5,2);
else 
    
%     rStep_6(:,1) =  rStep_id(6,1):rStep_id(6,2);
end

%Left foot
if lStep_id >= 0
    lStep_1(:,1) =  lStep_id(1,1):lStep_id(1,2);
    lStep_2(:,1) =  lStep_id(2,1):lStep_id(2,2);
    lStep_3(:,1) =  lStep_id(3,1):lStep_id(3,2);
    lStep_4(:,1) =  lStep_id(4,1):lStep_id(4,2);
%     lStep_5(:,1) =  lStep_id(5,1):lStep_id(5,2);
%     lStep_6(:,1) =  lStep_id(6,1):lStep_id(6,2);
end

%% Velocity per step
%Right foot
rVel_step1 =        rAnkVel2D(rStep_1);
rStep_vel.step1 =   sum(rVel_step1);
rVel_step2 =        rAnkVel2D(rStep_2);
rStep_vel.step2 =   sum(rVel_step2);
rVel_step3 =        rAnkVel2D(rStep_3);
rStep_vel.step3 =   sum(rVel_step3);
rVel_step4 =        rAnkVel2D(rStep_4);
rStep_vel.step4 =   sum(rVel_step4);

%Left foot
lVel_step1 =        lAnkVel2D(lStep_1);
lStep_vel.step1 =   sum(lVel_step1);
lVel_step2 =        lAnkVel2D(lStep_2);
lStep_vel.step2 =   sum(lVel_step2);
lVel_step3 =        lAnkVel2D(lStep_3);
lStep_vel.step3 =   sum(lVel_step3);
lVel_step4 =        lAnkVel2D(lStep_4);
lStep_vel.step4 =   sum(lVel_step4);

%Array of velocity taking place for right foot
% rTO_HS_vel = [rAnkVel2D(rTO_HS_frames_firstStep) rAnkVel2D(rTO_HS_frames_secondStep) rAnkVel2D(rTO_HS_frames_thirdStep)];

%% Acceleration per step
%Right foot
rAcc_step1 =        rAnkAcc2D(rStep_1);
rStep_Acc.step1 =   sum(rAcc_step1);
rAcc_step2 =        rAnkAcc2D(rStep_2);
rStep_Acc.step2 =   sum(rAcc_step2);
rAcc_step3 =        rAnkAcc2D(rStep_3);
rStep_Acc.step3 =   sum(rAcc_step3);
rAcc_step4 =        rAnkAcc2D(rStep_4);
rStep_Acc.step4 =   sum(rAcc_step4);

%Left foot
lAcc_step1 =        lAnkAcc2D(lStep_1);
lStep_Acc.step1 =   sum(lAcc_step1);
lAcc_step2 =        lAnkAcc2D(lStep_2);
lStep_Acc.step2 =   sum(lAcc_step2);
lAcc_step3 =        lAnkAcc2D(lStep_3);
lStep_Acc.step3 =   sum(lAcc_step3);
lAcc_step4 =        lAnkAcc2D(lStep_4);
lStep_Acc.step4 =   sum(lAcc_step4);
% lAcc_step5 =        lAnkAcc2D(lStep_5);
% lStep_Acc.step5 =   sum(lAcc_step5);

%% Jerk per step
%Right foot
rJerk_step1 =        rAnkJerk2D(rStep_1);
rStep_Jerk.step1 =   sum(abs(rJerk_step1));
rJerk_step2 =        rAnkJerk2D(rStep_2);
rStep_Jerk.step2 =   sum(abs(rJerk_step2));
rJerk_step3 =        rAnkJerk2D(rStep_3);
rStep_Jerk.step3 =   sum(abs(rJerk_step3));
rJerk_step4 =        rAnkJerk2D(rStep_4);
rStep_Jerk.step5 =   sum(abs(rJerk_step4));

%Left foot
lJerk_step1 =        lAnkJerk2D(lStep_1);
lStep_Jerk.step1 =   sum(abs(lJerk_step1));
lJerk_step2 =        lAnkJerk2D(lStep_2);
lStep_Jerk.step2 =   sum(abs(lJerk_step2));
lJerk_step3 =        lAnkJerk2D(lStep_3);
lStep_Jerk.step3 =   sum(abs(lJerk_step3));
lJerk_step4 =        lAnkJerk2D(lStep_4);
lStep_Jerk.step4 =   sum(abs(lJerk_step4));
lJerk_step5 =        lAnkJerk2D(lStep_5);
lStep_Jerk.step5 =   sum(abs(lJerk_step5));


