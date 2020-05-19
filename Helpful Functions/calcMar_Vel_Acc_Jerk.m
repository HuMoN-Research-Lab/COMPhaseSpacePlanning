function[head,chest,hip,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calc vel, acc, jerk for specified segCenters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%question: how does the acc and jerk in x,y,z jerk differ for markers?

%% Initial structuring of markers of interest
head =      [];
chest =     [];
hip =       [];
LFoot =     [];
RFoot =     [];

%% Head vel, acc, and jerk calculations
%head individual (x y z) position
head.marPosx =             segCenter.headCenter_mar_dim_frame(1,:);
head.marPosy =             segCenter.headCenter_mar_dim_frame(2,:);
head.marPosz =             segCenter.headCenter_mar_dim_frame(3,:);

%head individual (x y z)velocity
head.marVelx =             diff(head.marPosx(trial_start_end));
head.marVely =             diff(head.marPosy(trial_start_end));
head.marVelz =             diff(head.marPosz(trial_start_end));

%head individual (x y z) acceleration
head.marAccx =             diff(head.marVelx);
head.marAccy =             diff(head.marVely);
head.marAccz =             diff(head.marVelz);

%head individual (x y z) jerk
head.marJerkx =            diff(head.marAccx);
head.marJerky =            diff(head.marAccy);
head.marJerkz =            diff(head.marAccz);

%Total vel, acc, and jerk for head
head.totalmarVel =         plus(head.marVelx,head.marVely);
head.totalmarAcc =         diff(head.totalmarVel);
head.totalmarJerk =        diff(head.totalmarAcc);
head.totalmarJerk_abs =    abs(head.totalmarJerk);

% figure(10)
% subplot(1,3,1)
% plot(head.marVelx)
% title('Head Velx')
% subplot(1,3,2)
% plot(head.marVely)
% title('Head Vely')
% subplot(1,3,3)
% plot(head.marVelz)
% title('Head Velz')
% 
% figure(11)
% subplot(1,3,1)
% plot(head.marAccx)
% title('Head Accx')
% subplot(1,3,2)
% plot(head.marAccy)
% title('Head Accy')
% subplot(1,3,3)
% plot(head.marAccz)
% title('Head Accz')
% 
% figure(12)
% subplot(1,3,1)
% plot(head.totalmarJerk_abs)
% title('Head Jerkx')
% subplot(1,3,2)
% plot(head.totalmarJerk_abs)
% title('Head Jerky')
% subplot(1,3,3)
% plot(head.totalmarJerk_abs)
% title('Head Jerkz')

%% Chest vel, acc, and jerk calculations
%chest individual (x y z) position
chest_marPosx =             segCenter.chestCenter_mar_dim_frame(1,:);
chest_marPosy =             segCenter.chestCenter_mar_dim_frame(2,:);
chest_marPosz =             segCenter.chestCenter_mar_dim_frame(3,:);

%chest individual (x y z) velocity
chest.marVelx =             diff(chest_marPosx(trial_start_end));
chest.marVely =             diff(chest_marPosy(trial_start_end));
chest.marVelz =             diff(chest_marPosz(trial_start_end));

%chest individual (x y z) acceleration
chest.marAccx =             diff(chest.marVelx);
chest.marAccy =             diff(chest.marVely);
chest.marAccz =             diff(chest.marVelz);

%chest individual (x y z) jerk
chest.marJerkx =            diff(chest.marAccx);
chest.marJerky =            diff(chest.marAccy);
chest.marJerkz =            diff(chest.marAccz);

%chest total vel,acc, and jerk per trial
chest.totalmarVel =         plus(chest.marVelx,chest.marVely);
chest.totalmarAcc =         diff(chest.totalmarVel);
chest.totalmarJerk =        diff(chest.totalmarAcc);
chest.totalmarJerk_abs =    abs(chest.totalmarJerk);

% figure(20)
% subplot(1,3,1)
% plot(chest.marVelx)
% title('Chest Velx')
% subplot(1,3,2)
% plot(chest.marVely)
% title('Chest Vely')
% subplot(1,3,3)
% plot(chest.marVelz)
% title('Chest Velz')
% 
% figure(21)
% subplot(1,3,1)
% plot(chest.marAccx)
% title('Chest Accx')
% subplot(1,3,2)
% plot(chest.marAccy)
% title('Chest Accy')
% subplot(1,3,3)
% plot(chest.marAccz)
% title('Chest Accz')
% 
% % figure(22)
% % subplot(1,3,1)
% % plot(chest.marJerkx)
% % title('Chest Jerkx')
% % subplot(1,3,2)
% % plot(chest.marJerky)
% % title('Chest Jerky')
% % subplot(1,3,3)
% % plot(chest.marJerkz)
% % title('Chest Jerkz')
% 
% figure(25)
% subplot(1,3,1)
% plot(chest.totalmarVel)
% title('Chest Total Vel')
% subplot(1,3,2)
% plot(chest.totalmarAcc)
% title('Chest Total Acc')
% subplot(1,3,3)
% plot(chest.totalmarJerk_abs)
% title('Chest Total Jerk')

%% Hips vel, acc, and jerk calculations
%hips individual (x y z) position
hip_marPosx =             segCenter.hipCenter_mar_dim_frame(1,:);
hip_marPosy =             segCenter.hipCenter_mar_dim_frame(2,:);
hip_marPosz =             segCenter.hipCenter_mar_dim_frame(3,:);

%hip individual (x y z) velocity
hip.marVelx =             diff(hip_marPosx(trial_start_end));
hip.marVely =             diff(hip_marPosy(trial_start_end));
hip.marVelz =             diff(hip_marPosz(trial_start_end));

%hip individual (x y z) acceleration
hip.marAccx =             diff(hip.marVelx);
hip.marAccy =             diff(hip.marVely);
hip.marAccz =             diff(hip.marVelz);

%hip individual (x y z) jerk
hip.marJerkx =            diff(hip.marAccx);
hip.marJerky =            diff(hip.marAccy);
hip.marJerkz =            diff(hip.marAccz);

%hip total vel,acc, and jerk per trial
hip.totalmarVel =         plus(hip.marVelx,hip.marVely);
hip.totalmarAcc =         diff(hip.totalmarVel);
hip.totalmarJerk =        diff(hip.totalmarAcc);
hip.totalmarJerk_abs =    abs(hip.totalmarJerk);

% figure(30)
% subplot(1,3,1)
% plot(hip.marVelx)
% title('Hip Velx')
% subplot(1,3,2)
% plot(hip.marVely)
% title('Hip Vely')
% subplot(1,3,3)
% plot(hip.marVelz)
% title('Hip Velz')
% 
% figure(31)
% subplot(1,3,1)
% plot(hip.marAccx)
% title('Hip Accx')
% subplot(1,3,2)
% plot(hip.marAccy)
% title('Hip Accy')
% subplot(1,3,3)
% plot(hip.marAccz)
% title('Hip Accz')
% 
% % figure(32)
% % subplot(1,3,1)
% % plot(hip.marJerkx)
% % title('Hip Jerkx')
% % subplot(1,3,2)
% % plot(hip.marJerky)
% % title('Hip Jerky')
% % subplot(1,3,3)
% % plot(hip.marJerkz)
% % title('Hip Jerkz')
% 
% figure(35)
% subplot(1,3,1)
% plot(hip.totalmarVel)
% title('Hip Total Vel')
% subplot(1,3,2)
% plot(hip.totalmarAcc)
% title('Hip Total Acc')
% subplot(1,3,3)
% plot(hip.totalmarJerk_abs)
% title('Hip Total Jerk')

%% LAnkle & RAnkle vel, acc, and jerk calculations
%LFoot individual (x y z) position
LFoot.marPosx =             segCenter.LFootCenter_mar_dim_frame(1,:);
LFoot.marPosy =             segCenter.LFootCenter_mar_dim_frame(2,:);
LFoot.marPosz =             segCenter.LFootCenter_mar_dim_frame(3,:);

%LFoot individual (x y z) velocity
LFoot.marVelx =             diff(LFoot.marPosx(trial_start_end));
LFoot.marVely =             diff(LFoot.marPosy(trial_start_end));
LFoot.marVelz =             diff(LFoot.marPosz(trial_start_end));

%LFoot individual (x y z) acceleration
LFoot.marAccx =             diff(LFoot.marVelx);
LFoot.marAccy =             diff(LFoot.marVely);
LFoot.marAccz =             diff(LFoot.marVelz);

%LFoot individual (x y z) jerk
LFoot.marJerkx =            diff(LFoot.marAccx);
LFoot.marJerky =            diff(LFoot.marAccy);
LFoot.marJerkz =            diff(LFoot.marAccz);

%Total vel, acc, and jerk for LFoot
LFoot.totalmarVel =         plus(LFoot.marVelx,LFoot.marVely);
LFoot.totalmarAcc =         diff(LFoot.totalmarVel);
LFoot.totalmarJerk =        diff(LFoot.totalmarAcc);
LFoot.totalmarJerk_abs =    abs(LFoot.totalmarJerk);

% figure(40)
% subplot(1,3,1)
% plot(LFoot.marVelx)
% title('LFoot Velx')
% subplot(1,3,2)
% plot(LFoot.marVely)
% title('LFoot Vely')
% subplot(1,3,3)
% plot(LFoot.marVelz)
% title('LFoot Velz')
% 
% figure(41)
% subplot(1,3,1)
% plot(LFoot.marAccx)
% title('LFoot Accx')
% subplot(1,3,2)
% plot(LFoot.marAccy)
% title('LFoot Accy')
% subplot(1,3,3)
% plot(LFoot.marAccz)
% title('LFoot Accz')
% 
% % figure(42)
% % subplot(1,3,1)
% % plot(LFoot.marJerkx)
% % title('LFoot Jerkx')
% % subplot(1,3,2)
% % plot(LFoot.marJerky)
% % title('LFoot Jerky')
% % subplot(1,3,3)
% % plot(LFoot.marJerkz)
% % title('LFoot Jerkz')
% 
% figure(45)
% subplot(1,3,1)
% plot(LFoot.totalmarVel)
% title('LFoot Total Vel')
% subplot(1,3,2)
% plot(LFoot.totalmarAcc)
% title('LFoot Total Acc')
% subplot(1,3,3)
% plot(LFoot.totalmarJerk_abs)
% title('LFoot Total Jerk')

%RFoot individual (x y z) position
RFoot.marPosx =             segCenter.RFootCenter_mar_dim_frame(1,:);
RFoot.marPosy =             segCenter.RFootCenter_mar_dim_frame(2,:);
RFoot.marPosz =             segCenter.RFootCenter_mar_dim_frame(3,:);

%RFoot individual (x y z)velocity
RFoot.marVelx =             diff(RFoot.marPosx(trial_start_end));
RFoot.marVely =             diff(RFoot.marPosy(trial_start_end));
RFoot.marVelz =             diff(RFoot.marPosz(trial_start_end));

%RFoot individual (x y z) acceleration
RFoot.marAccx =             diff(RFoot.marVelx);
RFoot.marAccy =             diff(RFoot.marVely);
RFoot.marAccz =             diff(RFoot.marVelz);

%RFoot individual (x y z) jerk
RFoot.marJerkx =            diff(RFoot.marAccx);
RFoot.marJerky =            diff(RFoot.marAccy);
RFoot.marJerkz =            diff(RFoot.marAccz);

%Total vel, acc, and jerk for RFoot
RFoot.totalmarVel =         plus(RFoot.marVelx,RFoot.marVely);
RFoot.totalmarAcc =         diff(RFoot.totalmarVel);
RFoot.totalmarJerk =        diff(RFoot.totalmarAcc);
RFoot.totalmarJerk_abs =    abs(RFoot.totalmarJerk);

% figure(50)
% subplot(1,3,1)
% plot(RFoot.marVelx)
% title('RFoot Velx')
% subplot(1,3,2)
% plot(RFoot.marVely)
% title('RFoot Vely')
% subplot(1,3,3)
% plot(RFoot.marVelz)
% title('RFoot Velz')

% figure(51)
% subplot(1,3,1)
% plot(RFoot.marAccx)
% title('RFoot Accx')
% subplot(1,3,2)
% plot(RFoot.marAccy)
% title('RFoot Accy')
% subplot(1,3,3)
% plot(RFoot.marAccz)
% title('RFoot Accz')

% figure(52)
% subplot(1,3,1)
% plot(RFoot.marJerkx)
% title('RFoot Jerkx')
% subplot(1,3,2)
% plot(RFoot.marJerky)
% title('RFoot Jerky')
% subplot(1,3,3)
% plot(RFoot.marJerkz)
% title('RFoot Jerkz')

% figure(55)
% subplot(1,3,1)
% plot(RFoot.totalmarVel)
% title('RFoot Total Vel')
% subplot(1,3,2)
% plot(RFoot.totalmarAcc)
% title('RFoot Total Acc')
% subplot(1,3,3)
% plot(RFoot.totalmarJerk_abs)
% title('RFoot Total Jerk')

end
