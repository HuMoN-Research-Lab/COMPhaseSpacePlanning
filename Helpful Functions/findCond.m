function [condMatrix] = findCond(totalCOM_jerk_per_trial) %configMatrix_mean,configMatrix_std
%Find and organize conditions into matrix

%Condition structure for sub01
% condNum = ones(1,16);
condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];

% condNum_p1 = [0 4 7 2 1 5 6 3];
% sort_condNum_p1 = sort(condNum_p1);
% condNum_p2 = [0 3 6 5 1 2 7 4];
% sort_condNum_p2 = sort(condNum_p1);

% condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];
% condMatrix = ones(12,16);
condMatrix_unformatted = reshape(totalCOM_jerk_per_trial,[12,16]);
condMatrix(:,1) = vertcat(condMatrix(:,1),condMatrix(:,9));
condMatrix(:,2) = vertcat(condMatrix(:,5),condMatrix(:,13));
condMatrix(:,3) = vertcat(condMatrix(:,4),condMatrix(:,14));
condMatrix(:,4) = vertcat(condMatrix(:,8),condMatrix(:,10));
condMatrix(:,5) = vertcat(condMatrix(:,2),condMatrix(:,16));
condMatrix(:,6) = vertcat(condMatrix(:,6),condMatrix(:,12));
condMatrix(:,7) = vertcat(condMatrix(:,7),condMatrix(:,11));
condMatrix(:,8) = vertcat(condMatrix(:,3),condMatrix(:,15));

% for ii = 1:size(condMatrix_new,2)
%     if ii(find(ii == 0))
configMatrix_mean = mean(condMatrix);
configMatrix_std =  std(condMatrix,0,1);
figure(length(condNum))
bar(configMatrix_mean)
hold on
errorbar(configMatrix_mean,configMatrix_std);

% condTitle = string(condNum);
% T = table(condMatrix,'RowNames',condTitle);

% for ii = condNum %(1,1):condNum(1,1:length(condNum))

%format cells into one array
% y = find(condNum == 0,2);
% condMatrix_new(:,y) =  condMatrix(y:12,y);
% condMatrix_format = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,2));
% 
% y = find(condNum == 1,2);
% condMatrix_new(:,y) =  condMatrix(y:12,y);
% 
% y = find(condNum == 2,2);
% condMatrix_new(:,y) =  condMatrix(y:12,y);
% 
% condMatrix_format = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,2));
    
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