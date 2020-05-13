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
%id start and end point of trial
marVelx =                       diff(totalCOMXYZ(1,:));
marVely =                       diff(totalCOMXYZ(2,:));
marVelz =                       diff(totalCOMXYZ(3,:));
calc_totalmarVel =              plus(marVelx,marVely);
trial_start_end =               find(calc_totalmarVel > 2);

%velx, accx, and jerkx
totalCOM_calc.marVelx =         marVelx(trial_start_end);
totalCOM_calc.marAccx =         diff(totalCOM_calc.marVelx);
totalCOM_calc.absMarJerkx =     abs(diff(totalCOM_calc.marAccx));

%vely, accy, and jerky 
totalCOM_calc.marVely =         marVely(trial_start_end);
totalCOM_calc.marAccy =         diff(totalCOM_calc.marVely);
totalCOM_calc.absMarJerky =     abs(diff(totalCOM_calc.marAccy));

%velz, accz, and jerkz
totalCOM_calc.marVelz =         marVelz(trial_start_end);
totalCOM_calc.marAccz =         diff(totalCOM_calc.marVelz);
totalCOM_calc.absMarJerkz =     abs(diff(totalCOM_calc.marAccz));

%total marker vel, acc, and jerk calc
totalCOM_calc.totalmarVel =         calc_totalmarVel(trial_start_end);
totalCOM_calc.totalmarAcc =         diff(totalCOM_calc.totalmarVel);
totalCOM_calc.totalmarJerk =        diff(totalCOM_calc.totalmarAcc);
totalCOM_calc.totalmarJerk_abs =    abs(totalCOM_calc.totalmarJerk);

%% RAnkle & LAnkle vel, acc, and jerk calculations
%RFoot individual (x y z) position
RFoot_marPosx =             segCenter.RFootCenter_mar_dim_frame(1,:);
RFoot_marPosy =             segCenter.RFootCenter_mar_dim_frame(2,:);
RFoot_marPosz =             segCenter.RFootCenter_mar_dim_frame(3,:);

%RFoot individual (x y z)velocity
RFoot.marVelx =             diff(RFoot_marPosx(trial_start_end));
RFoot.marVely =             diff(RFoot_marPosy(trial_start_end));
RFoot.marVelz =             diff(RFoot_marPosz(trial_start_end));

%RFoot individual (x y z) acceleration
RFoot.marAccx =             diff(RFoot.marVelx);
RFoot.marAccy =             diff(RFoot.marVely);
RFoot.marAccz =             diff(RFoot.marVelz);

%RFoot individual (x y z) jerk
RFoot.marJerkx =            diff(RFoot.marAccx);
RFoot.marJerky =            diff(RFoot.marAccy);
RFoot.marJerkz =            diff(RFoot.marAccz);

%LFoot individual (x y z) position
LFoot_marPosx =             segCenter.LFootCenter_mar_dim_frame(1,:);
LFoot_marPosy =             segCenter.LFootCenter_mar_dim_frame(2,:);
LFoot_marPosz =             segCenter.LFootCenter_mar_dim_frame(3,:);

%LFoot individual (x y z) velocity
LFoot.marVelx =             diff(LFoot_marPosx(trial_start_end));
LFoot.marVely =             diff(LFoot_marPosy(trial_start_end));
LFoot.marVelz =             diff(LFoot_marPosz(trial_start_end));

%LFoot individual (x y z) acceleration
LFoot.marAccx =             diff(LFoot.marVelx);
LFoot.marAccy =             diff(LFoot.marVely);
LFoot.marAccz =             diff(LFoot.marVelz);

%LFoot individual (x y z) jerk
LFoot.marJerkx =            diff(LFoot.marAccx);
LFoot.marJerky =            diff(LFoot.marAccy);
LFoot.marJerkz =            diff(LFoot.marAccz);

%Total vel, acc, and jerk for RFoot & LFoot
RFoot.totalmarVel =         plus(RFoot.marVelx,RFoot.marVely);
RFoot.totalmarAcc =         diff(RFoot.totalmarVel);
RFoot.totalmarJerk =        diff(RFoot.totalmarAcc);
RFoot.totalmarJerk_abs =    abs(RFoot.totalmarJerk);

LFoot.totalmarVel =         plus(LFoot.marVelx,LFoot.marVely);
LFoot.totalmarAcc =         diff(LFoot.totalmarVel);
LFoot.totalmarJerk =        diff(LFoot.totalmarAcc);
LFoot.totalmarJerk_abs =    abs(LFoot.totalmarJerk);

end

