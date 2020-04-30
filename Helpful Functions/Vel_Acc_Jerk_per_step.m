function [rStep_acc,lStep_acc,rStep_jerk,lStep_jerk] = Vel_Acc_Jerk_per_step(allSteps,subject_trial)

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
    %Find points where toe and heel hit ground start at frame 1
    allSteps_TO = allSteps(:,1) - (allSteps(1,1)-1);
    allSteps_HS = allSteps(:,2) - (allSteps(1,1)-1);
    
    %Right step id
    rStep_id(:,1) = allSteps_TO(find(ii == 1));
    rStep_id(:,2) = allSteps_HS(find(ii == 1));
    
    %Left step id
    lStep_id(:,1) = allSteps_TO(find(ii == 2));
    lStep_id(:,2) = allSteps_HS(find(ii == 2));    
end

%% Create frames of each step and calc vel, acc, and jerk
%Right foot
numSteps = length(rStep_id(:,1));
for ii = 1:numSteps
    iterStep =          rStep_id(ii,1):rStep_id(ii,2);
    rVel =              rAnkVel2D(iterStep);
    rStep_vel(ii) =     sum(rVel);
    rAcc =              rAnkAcc2D(iterStep);
    rStep_acc(ii) =     sum(rAcc);
    rJerk =             rAnkJerk2D(iterStep);
    rStep_jerk(ii) =    sum(rJerk);
end

%Left foot
numSteps = length(lStep_id(:,1));
for ii = 1:numSteps
    iterStep =          lStep_id(ii,1):lStep_id(ii,2);
    lVel =              lAnkVel2D(iterStep);
    lStep_vel(ii) =     sum(lVel);
    lAcc =              lAnkAcc2D(iterStep);
    lStep_acc(ii) =     sum(lAcc);
    lJerk =             lAnkJerk2D(iterStep);
    lStep_jerk(ii) =    sum(lJerk);
end

