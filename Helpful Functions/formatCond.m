function [condMatrix] = formatCond(totalCOM_jerk_per_trial,COMx_totalJerk_per_trial,...
    COMy_totalJerk_per_trial,COMz_totalJerk_per_trial,totalCond,totalExp) %configMatrix_mean,configMatrix_std
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Organize conditions into formatted matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Format of conditions for the subject
condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];

%% Formatting of trial condition matrix
condMatrix_unformatted = reshape(totalCOM_jerk_per_trial,[totalExp,2.*totalCond]);
COMx = reshape(COMx_totalJerk_per_trial,[totalExp,2.*totalCond]);
COMy = reshape(COMy_totalJerk_per_trial,[totalExp,2.*totalCond]);
COMz = reshape(COMz_totalJerk_per_trial,[totalExp,2.*totalCond]);

for ii = condNum
    if ii == 0
        y = find(condNum == 0,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,1) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        freeWalking_matrix = condMatrix(:,1);
        if freeWalking_matrix == condMatrix(:,1)
            COMx_data(:,y) =        COMx(:,y);
            condMatrix_COMx(:,1) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
            COMy_data(:,y) =        COMy(:,y);
            condMatrix_COMy(:,1) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
            COMz_data(:,y) =        COMz(:,y);
            condMatrix_COMz(:,1) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2)));
        end
    end
    if ii == 1
        y = find(condNum == 1,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,2) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

%         COMx_data(:,y) =        COMx(:,y);
%         condMatrix_COMx(:,2) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
%         COMy_data(:,y) =        COMy(:,y);
%         condMatrix_COMy(:,2) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
%         COMz_data(:,y) =        COMz(:,y);
%         condMatrix_COMz(:,2) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2))); 

    end
    if ii == 2
        y = find(condNum == 2,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,3) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        limitedVision_matrix = condMatrix(:,3);
        if limitedVision_matrix == condMatrix(:,3)
            COMx_data(:,y) =        COMx(:,y);
            condMatrix_COMx(:,3) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
            COMy_data(:,y) =        COMy(:,y);
            condMatrix_COMy(:,3) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
            COMz_data(:,y) =        COMz(:,y);
            condMatrix_COMz(:,3) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2))); 
        end 
    end
    if ii == 3
        y = find(condNum == 3,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,4) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));

%         COMx_data(:,y) =        COMx(:,y);
%         condMatrix_COMx(:,4) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
%         COMy_data(:,y) =        COMy(:,y);
%         condMatrix_COMy(:,4) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
%         COMz_data(:,y) =        COMz(:,y);
%         condMatrix_COMz(:,4) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2))); 

    end
    if ii == 4
        y = find(condNum == 4,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,5) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        fullVision_matrix = condMatrix(:,5);
        if fullVision_matrix == condMatrix(:,5)
            COMx_data(:,y) =        COMx(:,y);
            condMatrix_COMx(:,5) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
            COMy_data(:,y) =        COMy(:,y);
            condMatrix_COMy(:,5) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
            COMz_data(:,y) =        COMz(:,y);
            condMatrix_COMz(:,5) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2)));
        end
    end
    if ii == 5
        y = find(condNum == 5,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,6) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        
%         COMx_data(:,y) =        COMx(:,y);
%         condMatrix_COMx(:,6) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
%         COMy_data(:,y) =        COMy(:,y);
%         condMatrix_COMy(:,6) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
%         COMz_data(:,y) =        COMz(:,y);
%         condMatrix_COMz(:,6) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2))); 

    end
    if ii == 6
        y = find(condNum == 6,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,7) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        
%         COMx_data(:,y) =        COMx(:,y);
%         condMatrix_COMx(:,7) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
%         COMy_data(:,y) =        COMy(:,y);
%         condMatrix_COMy(:,7) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
%         COMz_data(:,y) =        COMz(:,y);
%         condMatrix_COMz(:,7) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2)));

    end
    if ii == 7
        y = find(condNum == 7,2);
        condMatrix_new(:,y) =  condMatrix_unformatted(:,y);
        condMatrix(:,8) = vertcat(condMatrix_new(:,y(1)),condMatrix_new(:,y(2)));
        
%         COMx_data(:,y) =        COMx(:,y);
%         condMatrix_COMx(:,8) =  vertcat(COMx_data(:,y(1)),COMx_data(:,y(2)));
%         COMy_data(:,y) =        COMy(:,y);
%         condMatrix_COMy(:,8) =  vertcat(COMy_data(:,y(1)),COMy_data(:,y(2)));
%         COMz_data(:,y) =        COMz(:,y);
%         condMatrix_COMz(:,8) =  vertcat(COMz_data(:,y(1)),COMz_data(:,y(2))); 

    end
end

%% Analyze COMx,COMy, and COMz
% for COMx = 2:length(condMatrix_COMx)
%     currCol = condMatrix_COMx(COMx);
%     prevCol = condMatrix_COMx(COMx-1);
%     
% %     if prevCol ~= 0
% %         continue
%     if currCol == 0
%         condMatrix_COMx(COMx,:) = [];
%     end
% end

%Remove unwanted columns in COMx
condMatrix_COMx(:,4) = [];
condMatrix_COMx(:,2) = [];
condMatrix_COMx_mean =  mean(condMatrix_COMx);
condMatrix_COMx_stdev = std(condMatrix_COMx);

%Remove unwanted columns in COMy
condMatrix_COMy(:,4) = [];
condMatrix_COMy(:,2) = [];
condMatrix_COMy_mean =  mean(condMatrix_COMy);
condMatrix_COMy_stdev = std(condMatrix_COMy);

%Remove unwanted columns in COMz
condMatrix_COMz(:,4) = [];
condMatrix_COMz(:,2) = [];
condMatrix_COMz_mean =  mean(condMatrix_COMz);
condMatrix_COMz_stdev = std(condMatrix_COMz);

COM_mean =   [condMatrix_COMx_mean condMatrix_COMy_mean condMatrix_COMz_mean];
COM_stdev =   [condMatrix_COMx_stdev condMatrix_COMy_stdev condMatrix_COMz_stdev];

%Individual COMx calcs
figure(3000)
bar(condMatrix_COMx_mean)
% COM_Title = {'COMx';'COMy';'COMz'};
% set(gca,'xticklabel',COM_Title)
hold on
errorbar(condMatrix_COMx_mean,condMatrix_COMx_stdev);
title('X Total Jerk per Trial')

figure(3100)
bar(condMatrix_COMy_mean)
% COM_Title = {'COMx';'COMy';'COMz'};
% set(gca,'xticklabel',COM_Title)
hold on
errorbar(condMatrix_COMy_mean,condMatrix_COMy_stdev);
title('Y Total Jerk per Trial')

%Individual COMx calcs
figure(3200)
bar(condMatrix_COMz_mean)
% COM_Title = {'COMx';'COMy';'COMz'};
% set(gca,'xticklabel',COM_Title)
hold on
errorbar(condMatrix_COMz_mean,condMatrix_COMy_stdev);
title('Z Total Jerk per Trial')

% %Total individual COM calcs
% figure(3939)
% bar(COM_mean)
% COM_Title = {'COMx';'COMy';'COMz'};
% set(gca,'xticklabel',COM_Title)
% hold on
% errorbar(COM_mean,COM_stdev);
% title('X Y Z Total Jerk per Trial')

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