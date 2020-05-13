function [LFoot,RFoot,totalCOM_calc,trial_start_end] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates vel,acc,and jerk using segCenter of respective foot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x+y+z jerk, average jerk in x y and z what are the differences?
%differences might be magnified in diff dimensions
%free walking people walk faster
%limited walking people walk slower but evaluate diff dimension 

%% Define initial conditions
LFoot =   [];
RFoot =   [];
totalCOM_calc = [];

%% COM vel, acc, and jerk calculations
marVelx =                    diff(totalCOMXYZ(1,:));
marVely =                    diff(totalCOMXYZ(2,:));
marVelz =                    diff(totalCOMXYZ(3,:));
calc_totalmarVel =           plus(marVelx,marVely);

%id start and end point of trial
trial_start_end =           find(calc_totalmarVel > 2);

%velx, accx, and jerkx
totalCOM_calc.marVelx =     marVelx(trial_start_end);
totalCOM_calc.marAccx =     diff(totalCOM_calc.marVelx);
totalCOM_calc.marJerkx =    diff(totalCOM_calc.marAccx);

%vely, accy, and jerky 
totalCOM_calc.marVely =     marVely(trial_start_end);
totalCOM_calc.marAccy =     diff(totalCOM_calc.marVely);
totalCOM_calc.marJerky =    diff(totalCOM_calc.marAccy);

%velz, accz, and jerkz
totalCOM_calc.marVelz =     marVelz(trial_start_end);
totalCOM_calc.marAccz =     diff(totalCOM_calc.marVelz);
totalCOM_calc.marJerkz =    diff(totalCOM_calc.marAccz);

%total marker vel, acc, and jerk calc
totalCOM_calc.totalmarVel =              calc_totalmarVel(trial_start_end);
totalCOM_calc.totalmarAcc =              diff(totalCOM_calc.marVel);
totalCOM_calc.totalmarJerk =             diff(totalCOM_calc.marAcc);
totalCOM_calc.totalmarJerk_abs =         abs(totalCOM_calc.marJerk);

%% RAnkle & LAnkle vel, acc, and jerk calculations
% locate RFoot and LFoot position at start and end of trial
RFoot_marPosx =             segCenter.RFootCenter_mar_dim_frame(1,:);
RFoot_marVelx =             diff(RFoot_marPosx(trial_start_end));
RFoot_marPosy =             segCenter.RFootCenter_mar_dim_frame(2,:);
RFoot_marVely =             diff(RFoot_marPosy(trial_start_end));
RFoot_marPosz =             segCenter.RFootCenter_mar_dim_frame(3,:);
RFoot_marVelz =             diff(RFoot_marPosz(trial_start_end));

LFoot_marPosx =             segCenter.LFootCenter_mar_dim_frame(1,:);
LFoot_marVelx =             diff(LFoot_marPosx(trial_start_end));
LFoot_marPosy =             segCenter.LFootCenter_mar_dim_frame(2,:);
LFoot_marVely =             diff(LFoot_marPosy(trial_start_end));
LFoot_marPosz =             segCenter.LFootCenter_mar_dim_frame(3,:);
LFoot_marVelz =             diff(LFoot_marPosz(trial_start_end));

%Calc vel, acc, and jerk for RFoot and LFoot
RFoot.marVel =              plus(RFoot_marVelx,RFoot_marVely);
RFoot.marAcc =              diff(RFoot.marVel);
RFoot.marJerk =             diff(RFoot.marAcc);
RFoot.marJerk_abs =         abs(RFoot.marJerk);

LFoot.marVel =              plus(LFoot_marVelx,LFoot_marVely);
LFoot.marAcc =              diff(LFoot.marVel);
LFoot.marJerk =             diff(LFoot.marAcc);
LFoot.marJerk_abs =         abs(LFoot.marJerk);

end

