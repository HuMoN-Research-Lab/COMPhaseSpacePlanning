function [step_TO_HS] = stepFilter(step_TO_HS,markerXYS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Filter step_TO_HS from zeniStepFinder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
s = step_TO_HS;

% jj = x_diff;
% 
% %% Filter for the start of the trial
% 
% if jj >= 1.0
%     startTrial = find(jj >= 1.0,1);
%     startStep = find(step_TO_HS >= startTrial,1); %references 2nd row
%     revised_step_TO_HS = step_TO_HS(startStep:end,:);
% end

%% Filter out unwanted steps 
for stepNum = 2:length(s)
    stepNum %print out the steps that the loop is on
    currStepLeg = s(stepNum,3);
    prevStepLeg = s(stepNum-1,3);
    
    if isnan(prevStepLeg)
        continue       
    elseif currStepLeg == prevStepLeg
        s(stepNum,:) = nan;
    end
    
end %stepNum

s(isnan(s(:,3)),:) = [];    %delete data in path that has nans

