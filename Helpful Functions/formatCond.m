function [condMatrix] = formatCond(totalCOM_jerk_per_trial,totalCond,totalExp) %configMatrix_mean,configMatrix_std
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Organize conditions into formatted matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Format of conditions for the subject
condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];

%% Formatting of trial condition matrix
condMatrix_unformatted = reshape(totalCOM_jerk_per_trial,[totalExp,2.*totalCond]);

for ii = condNum
    if ii == 0
        y = find(condNum == 0,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,1) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        freeWalking_matrix = condMatrix(:,1);
    end
    if ii == 1
        y = find(condNum == 1,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,2) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
    end
    if ii == 2
        y = find(condNum == 2,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,3) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        limitedVision_matrix = condMatrix(:,3);
    end
    if ii == 3
        y = find(condNum == 3,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,4) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
    end
    if ii == 4
        y = find(condNum == 4,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,5) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        fullVision_matrix = condMatrix(:,5);
    end
    if ii == 5
        y = find(condNum == 5,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,6) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
    end
    if ii == 6
        y = find(condNum == 6,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,7) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
    end
    if ii == 7
        y = find(condNum == 7,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,8) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
    end
end

%% Analyze trials 0, 4, and 2
%FreeWalking trials, Cond: 0
freeWalking_mean =     mean(freeWalking_matrix);  
freeWalking_stdev =    std(freeWalking_matrix);

%FullVision trials, Cond: 4
fullVision_mean =      mean(fullVision_matrix);  
fullVision_stdev =     std(fullVision_matrix);

%LimitedVision trials, Cond: 2
limitedVision_mean =   mean(limitedVision_matrix);  
limitedVision_stdev =  std(limitedVision_matrix);

trials_mean =   [freeWalking_mean fullVision_mean limitedVision_mean];
trials_stdev =  [freeWalking_stdev fullVision_stdev limitedVision_stdev];

figure(8135);
trialNames = {'Free Walking';'Full Vision';'Limited Vision'};
bar(trials_mean)
set(gca,'xticklabel',trialNames)
hold on
errorbar(trials_mean,trials_stdev);
title('Total X-Z Jerk per Trial')

% %% Mean and stdev calcs for formatted matrix
% configMatrix_mean = mean(condMatrix);
% configMatrix_std =  std(condMatrix,0,1);
% 
% %Visual representation of conditions results
% figure(length(condNum))
% bar(configMatrix_mean)
% hold on
% errorbar(configMatrix_mean,configMatrix_std);

end