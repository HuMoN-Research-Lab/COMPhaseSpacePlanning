function [reactForces] = calcReactForces(segCenter,segPropWeight,kgMass,RFoot,LFoot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates reaction forces around joint centers
%Chapter 4 in David A. Winters book
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bodyWeight = kgMass * 9.8; %units in N

%% Sum forces in x and z to evaluate horizontal movement


%% Sum forces in y and z to evaluate vertical movement


