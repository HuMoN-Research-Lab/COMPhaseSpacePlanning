function [condMatrix] = formatCond(totalCOM_jerk_per_trial,totalCond,totalExp) %configMatrix_mean,configMatrix_std
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Organize conditions into formatted matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Format of conditions for the subject
% condNum = ones(1,16);
condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];

% condNum_p1 = [0 4 7 2 1 5 6 3];
% sort_condNum_p1 = sort(condNum_p1);
% condNum_p2 = [0 3 6 5 1 2 7 4];
% sort_condNum_p2 = sort(condNum_p1);
% condMatrix = ones(12,16);

%% Formatting of trial condition matrix
condMatrix_unformatted = reshape(totalCOM_jerk_per_trial,[totalExp,2.*totalCond]);

%format cells into one array
%find zeros and concatenate trial values 
%when creating for loop, need if statement if values < 12
    
y = find(condNum == 0,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,1) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 1,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,2) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 2,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,3) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 3,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,4) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 4,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,5) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 5,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,6) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 6,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,7) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

y = find(condNum == 7,2);
condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
condMatrix(:,8) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

% for ii = 1:size(condMatrix_new,2)
%     if ii(find(ii == 0))

%% Mean and stdev calcs for formatted matrix
configMatrix_mean = mean(condMatrix);
configMatrix_test_mean = mean(condMatrix_test);
configMatrix_std =  std(condMatrix,0,1);
configMatrix_test_std =  std(condMatrix_test,0,1);

%Visual representation of conditions results
figure(length(condNum))
bar(configMatrix_mean)
hold on
errorbar(configMatrix_mean,configMatrix_std);

figure(length(condNum)+1)
bar(configMatrix_test_mean)
hold on
errorbar(configMatrix_test_mean,configMatrix_test_std);

%% First attempt

% condMatrix_test(:,1) = vertcat(condMatrix_unformatted(:,1),condMatrix_unformatted(:,9)); %cond 0
% condMatrix_test(:,2) = vertcat(condMatrix_unformatted(:,5),condMatrix_unformatted(:,13)); %cond 1
% condMatrix_test(:,3) = vertcat(condMatrix_unformatted(:,4),condMatrix_unformatted(:,14)); %cond 2
% condMatrix_test(:,4) = vertcat(condMatrix_unformatted(:,8),condMatrix_unformatted(:,10)); %cond 3
% condMatrix_test(:,5) = vertcat(condMatrix_unformatted(:,2),condMatrix_unformatted(:,16)); %cond 4
% condMatrix_test(:,6) = vertcat(condMatrix_unformatted(:,6),condMatrix_unformatted(:,12)); %cond 5
% condMatrix_test(:,7) = vertcat(condMatrix_unformatted(:,7),condMatrix_unformatted(:,11)); %cond 6
% condMatrix_test(:,8) = vertcat(condMatrix_unformatted(:,3),condMatrix_unformatted(:,15)); %cond 7

% for ii = condNum %(1,1):condNum(1,1:length(condNum))

%     for y(ii) = find(ii == 0,2)
%         condMatrix_new(:,length(ii)) = condMatrix(y:12,y);
%     end
%     for y = find(ii == 1);
%         condMatrix_new(:,length(ii)) = condMatrix(y:12,y);
%     end
%     if y = find(ii == 2);
%         condMatrix_new(:,length(ii)) = condMatrix(y:12,y);
%     end
%     if y = find(ii == 3);
%         condMatrix_new(:,length(ii)) = condMatrix(y:12,y);
%     end
end




%         
        


% condMatrix = reshape(totalCOM_jerk_per_trial,[(length(totalCOM_jerk_per_trial)/12,16]);

% % condMatrix = ones(length(condNum),12);
% for ii = 1:length(condNum)
%     condMatrix(1,ii) = totalCOM_jerk_per_trial(ii); %trials 1:16
%     condMatrix(2,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 17:32
%     condMatrix(3,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 33:48