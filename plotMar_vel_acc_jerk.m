function plotMar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trialNum,rev_step_TO_HS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the x y z vel, acc, and jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Velocity for markers in the x & y coordinate frames

figure(trialNum)

%head essentials

%head marker coordinates
subplot(3,2,1)
plot(head.marVelx,'k')
hold on
head_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[head_ylim(1) head_ylim(2)],'b')
end
title('Head Velx')


%chest marker coordinates
subplot(3,2,3)
plot(chest.marVelx,'k')
hold on
chest_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[chest_ylim(1) chest_ylim(2)],'b')
end
title('Chest Velx')

%hip marker coordinates
subplot(3,2,5)
plot(hip.marVelx,'k')
hold on
hip_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii) rev_step_TO_HS(ii)],[hip_ylim(1) hip_ylim(2)],'b')
end
title('Hip Velx')

%LThigh & RThigh marker overlayed
subplot(3,2,2)
plot(LThigh.marVelx,'b')
hold on
plot(RThigh.marVelx,'r')
thigh_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii) rev_step_TO_HS(ii)],[thigh_ylim(1) thigh_ylim(2)],'k')
end
title('LThigh & RThigh Velx')

%LLeg & RLeg marker overlayed
subplot(3,2,4)
plot(LLeg.marVelx,'b')
hold on
plot(RLeg.marVelx,'r')
leg_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii) rev_step_TO_HS(ii)],[leg_ylim(1) leg_ylim(2)],'k')
end
title('LLeg & RLeg Velx')

%LFoot & RFoot marker overlayed
subplot(3,2,6)
plot(LFoot.marVelx,'b')
hold on
plot(RFoot.marVelx,'r')
foot_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii) rev_step_TO_HS(ii)],[foot_ylim(1) foot_ylim(2)],'k')
end
title('LFoot & RFoot Velx')
end