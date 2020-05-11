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

%% Mean and stdev calcs for formatted matrix
configMatrix_mean = mean(condMatrix);
configMatrix_std =  std(condMatrix,0,1);

%Visual representation of conditions results
figure(length(condNum))
bar(configMatrix_mean)
hold on
errorbar(configMatrix_mean,configMatrix_std);

%% First attempt

% condMatrix_test(:,1) = vertcat(condMatrix_unformatted(:,1),condMatrix_unformatted(:,9)); %cond 0
% condMatrix_test(:,2) = vertcat(condMatrix_unformatted(:,5),condMatrix_unformatted(:,13)); %cond 1
% condMatrix_test(:,3) = vertcat(condMatrix_unformatted(:,4),condMatrix_unformatted(:,14)); %cond 2
% condMatrix_test(:,4) = vertcat(condMatrix_unformatted(:,8),condMatrix_unformatted(:,10)); %cond 3
% condMatrix_test(:,5) = vertcat(condMatrix_unformatted(:,2),condMatrix_unformatted(:,16)); %cond 4
% condMatrix_test(:,6) = vertcat(condMatrix_unformatted(:,6),condMatrix_unformatted(:,12)); %cond 5
% condMatrix_test(:,7) = vertcat(condMatrix_unformatted(:,7),condMatrix_unformatted(:,11)); %cond 6
% condMatrix_test(:,8) = vertcat(condMatrix_unformatted(:,3),condMatrix_unformatted(:,15)); %cond 7

end




%         
        


% condMatrix = reshape(totalCOM_jerk_per_trial,[(length(totalCOM_jerk_per_trial)/12,16]);

% % condMatrix = ones(length(condNum),12);
% for ii = 1:length(condNum)
%     condMatrix(1,ii) = totalCOM_jerk_per_trial(ii); %trials 1:16
%     condMatrix(2,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 17:32
%     condMatrix(3,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 33:48