%%

files = dir('*TouchCat*');
for u = 1:9

load(files(u).name);

alltrialbehavioraldataWTS1AVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.S1FORCMO;
for r = 1:length(alltrialbehavioraldataWTS1AVERS)
    alltrialbehavioraldataWTS1AVERS{r} = [alltrialbehavioraldataWTS1AVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.S1FORCOBJ{r}];
end
alltrialbehavioraldataWTS1NONAVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.S1FORCMO;
for r = 1:length(alltrialbehavioraldataWTS1NONAVERS)
    alltrialbehavioraldataWTS1NONAVERS{r} = [alltrialbehavioraldataWTS1NONAVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.S1FORCOBJ{r}];
end
alltrialbehavioraldataWTSTRAVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.STRFORCMO;
for r = 1:length(alltrialbehavioraldataWTSTRAVERS)
    alltrialbehavioraldataWTSTRAVERS{r} = [alltrialbehavioraldataWTSTRAVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.STRFORCOBJ{r}];
end
alltrialbehavioraldataWTSTRNONAVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.STRFORCMO;
for r = 1:length(alltrialbehavioraldataWTSTRNONAVERS)
    alltrialbehavioraldataWTSTRNONAVERS{r} = [alltrialbehavioraldataWTSTRNONAVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.STRFORCOBJ{r}];
end
alltrialbehavioraldataWTBLAAVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.BLAFORCMO;
for r = 1:length(alltrialbehavioraldataWTBLAAVERS)
    alltrialbehavioraldataWTBLAAVERS{r} = [alltrialbehavioraldataWTBLAAVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.Avers.BLAFORCOBJ{r}];
end
alltrialbehavioraldataWTBLANONAVERS = allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.BLAFORCMO;
for r = 1:length(alltrialbehavioraldataWTBLANONAVERS)
    alltrialbehavioraldataWTBLANONAVERS{r} = [alltrialbehavioraldataWTBLANONAVERS{r}; allAverBehaviorFiringProperties.SPFiringPerTrial.NonAvers.BLAFORCOBJ{r}];
end

trialnum = size(alltrialbehavioraldataWTS1AVERS{1},1);
trialnum2 = trialnum;
while floor(trialnum2*0.8)~= trialnum2*0.8
    trialnum2 = trialnum2 - 1;
end

newtrialnum = randperm(trialnum);
newtrialnum2 = newtrialnum(1:trialnum-trialnum2);
for a = 1:length(alltrialbehavioraldataWTS1AVERS)
    alltrialbehavioraldataWTS1AVERS{a}(newtrialnum2,:) = [];
    alltrialbehavioraldataWTS1NONAVERS{a}(newtrialnum2,:) = [];
end


RStestforc = alltrialbehavioraldataWTS1AVERS;
for a = 1:length(alltrialbehavioraldataWTS1NONAVERS)
RStestforc{a}(size(alltrialbehavioraldataWTS1AVERS{1},1)+1:size(alltrialbehavioraldataWTS1AVERS{1},1)+size(alltrialbehavioraldataWTS1AVERS{1},1),:) = alltrialbehavioraldataWTS1NONAVERS{a};
end

clear allaccuracies
clear testaccuracy
mincell = min([length(alltrialbehavioraldataWTS1AVERS), length(alltrialbehavioraldataWTSTRAVERS), length(alltrialbehavioraldataWTBLAAVERS)]);



RStestforc = RStestforc(~cellfun('isempty',RStestforc));

%%




    clear newRStestforc
    clear newRStestforc2
    newRStestforc = RStestforc;
    newRStestforc2 = newRStestforc;
for p = 1:160
clear newtestforc
for s = 1:length(newRStestforc2)
newtestforc(:,s) = newRStestforc2{s}(:,p);
end
for m = 1:50
% rando = randperm(size(newtestforc,2));
clear newtestforcclu
%     if isempty(find(newWTallidx==j))==0
newalltestforcclu = newtestforc;
%     edges = unique(newWTallidx);
%     counts = histc(newWTallidx(:), edges);
[rows,cols] = find(isnan(newalltestforcclu));
uniquecols = unique(cols);
newalltestforcclu(:, uniquecols) = [];
numneur = randperm(size(newalltestforcclu,2));
newtestforcclu = (newalltestforcclu(:,numneur(1:mincell)));
neuridx = numneur(1:mincell);
%     disp(size(newtestforcclu,2))
nidx1 = randperm(trialnum2);
nidx2 = randperm(trialnum2)+trialnum2;
nidxtrain1 = nidx1(1:floor(trialnum2*0.8));
nidxtrain2 = nidx2(1:floor(trialnum2*0.8));
nidxtrain = [nidxtrain1,nidxtrain2];
newlength1 = (length(nidxtrain1)/0.8);
newlength2 = (length(nidxtrain2)/0.8);
nidxtest1 = nidx1(length(nidxtrain1)+1:newlength1);
nidxtest2 = nidx2(length(nidxtrain2)+1:newlength2);
nidxtest = [nidxtest1,nidxtest2];
clear grouptype
grouptype(1:(length(nidxtrain1)+length(nidxtest1))*2) = "Avers";
grouptype(length(nidxtrain1)+length(nidxtest1)+1:(length(nidxtrain2)+length(nidxtest2))*2) = "NonAvers";
clear Xtrain
clear Xtest
clear Xall
clear Ytrain
clear Ytest
newnidxtrain = nidxtrain(randperm(length(nidxtrain)));
testshuffidx = nidxtrain(randperm(length(nidxtrain)));
for t = 1:length(nidxtrain)
Xtrain(:,t) = newtestforcclu(newnidxtrain(t),:);
Ytrain(t) = grouptype(newnidxtrain(t));
end
newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));
for t = 1:length(nidxtest)
Xtest(:,t) = newtestforcclu(newnidxtest(t),:);
Ytest(t) = grouptype(newnidxtest(t));
end
% for t = 1:length(nidx)
%    Xall(:,t) = newtestforcclu4(nidx(t),:);
% end
% Yall = grouptype(nidx);
%%
% Mdl = fitcsvm(Xtrain',Ytrain','OptimizeHyperparameters','auto', ...
% 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName', ...
% 'expected-improvement-plus'))
% partitionedModel = crossval(Mdl, 'KFold', 10);
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% % Compute validation accuracy
% validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
% validationAccuracy = 1 - validation_error;
% oofLabel_n = predict(Mdl,Xtest');
% test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
% nanmean(test_accuracy_for_iter)
%%
% SVMModel = fitcsvm(Xtrain',Ytrain','Standardize',true,'KernelFunction','RBF',...
% 'KernelScale','auto');
SVMModel = fitcsvm(Xtrain',Ytrain');
partitionedModel = crossval(SVMModel, 'KFold', 10);
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% Compute validation accuracy
validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
validationAccuracy = 1 - validation_error;
oofLabel_n = predict(SVMModel,Xtest');
test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
testaccuracy = nanmean(test_accuracy_for_iter);
svmcellcount = size(newtestforcclu,2);
%     elseif isempty(find(newWTallidx==j)) == 1
%         testaccuracy(j,i) = NaN;
%         svmcellcount(j,i) = 0;
%     end
allaccuraciesS1bytime(m,p) = testaccuracy;
clear testaccuracy
clear svmcellcount
end
disp(p)
end
allaccuraciesS1bymouseWT{u} = allaccuraciesS1bytime;



%%

for a = 1:length(alltrialbehavioraldataWTSTRAVERS)
    alltrialbehavioraldataWTSTRAVERS{a}(newtrialnum2,:) = [];
    alltrialbehavioraldataWTSTRNONAVERS{a}(newtrialnum2,:) = [];
end

RStestforc = alltrialbehavioraldataWTSTRAVERS;
for a = 1:length(alltrialbehavioraldataWTSTRNONAVERS)
RStestforc{a}(size(alltrialbehavioraldataWTSTRAVERS{1},1)+1:size(alltrialbehavioraldataWTSTRAVERS{1},1)+size(alltrialbehavioraldataWTSTRAVERS{1},1),:) = alltrialbehavioraldataWTSTRNONAVERS{a};
end

clear allaccuracies
clear testaccuracy
mincell = min([length(alltrialbehavioraldataWTS1AVERS), length(alltrialbehavioraldataWTSTRAVERS), length(alltrialbehavioraldataWTBLAAVERS)]);


RStestforc = RStestforc(~cellfun('isempty',RStestforc));

%%



    clear newRStestforc
    clear newRStestforc2
    newRStestforc = RStestforc;
    newRStestforc2 = newRStestforc;
for p = 1:160
clear newtestforc
for s = 1:length(newRStestforc2)
newtestforc(:,s) = newRStestforc2{s}(:,p);
end
for m = 1:50
% rando = randperm(size(newtestforc,2));
clear newtestforcclu
%     if isempty(find(newWTallidx==j))==0
newalltestforcclu = newtestforc;
%     edges = unique(newWTallidx);
%     counts = histc(newWTallidx(:), edges);
[rows,cols] = find(isnan(newalltestforcclu));
uniquecols = unique(cols);
newalltestforcclu(:, uniquecols) = [];
numneur = randperm(size(newalltestforcclu,2));
newtestforcclu = (newalltestforcclu(:,numneur(1:mincell)));
neuridx = numneur(1:mincell);
%     disp(size(newtestforcclu,2))
nidx1 = randperm(trialnum2);
nidx2 = randperm(trialnum2)+trialnum2;
nidxtrain1 = nidx1(1:floor(trialnum2*0.8));
nidxtrain2 = nidx2(1:floor(trialnum2*0.8));
nidxtrain = [nidxtrain1,nidxtrain2];
newlength1 = (length(nidxtrain1)/0.8);
newlength2 = (length(nidxtrain2)/0.8);
nidxtest1 = nidx1(length(nidxtrain1)+1:newlength1);
nidxtest2 = nidx2(length(nidxtrain2)+1:newlength2);
nidxtest = [nidxtest1,nidxtest2];
clear grouptype
grouptype(1:(length(nidxtrain1)+length(nidxtest1))*2) = "Avers";
grouptype(length(nidxtrain1)+length(nidxtest1)+1:(length(nidxtrain2)+length(nidxtest2))*2) = "NonAvers";
clear Xtrain
clear Xtest
clear Xall
clear Ytrain
clear Ytest
newnidxtrain = nidxtrain(randperm(length(nidxtrain)));
testshuffidx = nidxtrain(randperm(length(nidxtrain)));
for t = 1:length(nidxtrain)
Xtrain(:,t) = newtestforcclu(newnidxtrain(t),:);
Ytrain(t) = grouptype(newnidxtrain(t));
end
newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));
for t = 1:length(nidxtest)
Xtest(:,t) = newtestforcclu(newnidxtest(t),:);
Ytest(t) = grouptype(newnidxtest(t));
end
% for t = 1:length(nidx)
%    Xall(:,t) = newtestforcclu4(nidx(t),:);
% end
% Yall = grouptype(nidx);
%%
% Mdl = fitcsvm(Xtrain',Ytrain','OptimizeHyperparameters','auto', ...
% 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName', ...
% 'expected-improvement-plus'))
% partitionedModel = crossval(Mdl, 'KFold', 10);
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% % Compute validation accuracy
% validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
% validationAccuracy = 1 - validation_error;
% oofLabel_n = predict(Mdl,Xtest');
% test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
% nanmean(test_accuracy_for_iter)
%%
% SVMModel = fitcsvm(Xtrain',Ytrain','Standardize',true,'KernelFunction','RBF',...
% 'KernelScale','auto');
SVMModel = fitcsvm(Xtrain',Ytrain');
partitionedModel = crossval(SVMModel, 'KFold', 10);
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% Compute validation accuracy
validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
validationAccuracy = 1 - validation_error;
oofLabel_n = predict(SVMModel,Xtest');
test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
testaccuracy = nanmean(test_accuracy_for_iter);
svmcellcount = size(newtestforcclu,2);
%     elseif isempty(find(newWTallidx==j)) == 1
%         testaccuracy(j,i) = NaN;
%         svmcellcount(j,i) = 0;
%     end
allaccuraciesSTRbytime(m,p) = testaccuracy;
clear testaccuracy
clear svmcellcount
end
disp(p)
end
allaccuraciesSTRbymouseWT{u} = allaccuraciesSTRbytime;


%%


%%
%%

for a = 1:length(alltrialbehavioraldataWTBLAAVERS)
    alltrialbehavioraldataWTBLAAVERS{a}(newtrialnum2,:) = [];
    alltrialbehavioraldataWTBLANONAVERS{a}(newtrialnum2,:) = [];
end


RStestforc = alltrialbehavioraldataWTBLAAVERS;
for a = 1:length(alltrialbehavioraldataWTBLANONAVERS)
RStestforc{a}(size(alltrialbehavioraldataWTBLAAVERS{1},1)+1:size(alltrialbehavioraldataWTBLAAVERS{1},1)+size(alltrialbehavioraldataWTBLAAVERS{1},1),:) = alltrialbehavioraldataWTBLANONAVERS{a};
end


clear allaccuracies
clear testaccuracy
mincell = min([length(alltrialbehavioraldataWTS1AVERS), length(alltrialbehavioraldataWTSTRAVERS), length(alltrialbehavioraldataWTBLAAVERS)]);


RStestforc = RStestforc(~cellfun('isempty',RStestforc));

%%





    clear newRStestforc
    clear newRStestforc2
    newRStestforc = RStestforc;
    newRStestforc2 = newRStestforc;
for p = 1:160
clear newtestforc
for s = 1:length(newRStestforc2)
newtestforc(:,s) = newRStestforc2{s}(:,p);
end
for m = 1:50
% rando = randperm(size(newtestforc,2));
clear newtestforcclu
%     if isempty(find(newWTallidx==j))==0
newalltestforcclu = newtestforc;
%     edges = unique(newWTallidx);
%     counts = histc(newWTallidx(:), edges);
[rows,cols] = find(isnan(newalltestforcclu));
uniquecols = unique(cols);
newalltestforcclu(:, uniquecols) = [];
numneur = randperm(size(newalltestforcclu,2));
newtestforcclu = (newalltestforcclu(:,numneur(1:mincell)));
neuridx = numneur(1:mincell);
%     disp(size(newtestforcclu,2))
nidx1 = randperm(trialnum2);
nidx2 = randperm(trialnum2)+trialnum2;
nidxtrain1 = nidx1(1:floor(trialnum2*0.8));
nidxtrain2 = nidx2(1:floor(trialnum2*0.8));
nidxtrain = [nidxtrain1,nidxtrain2];
newlength1 = (length(nidxtrain1)/0.8);
newlength2 = (length(nidxtrain2)/0.8);
nidxtest1 = nidx1(length(nidxtrain1)+1:newlength1);
nidxtest2 = nidx2(length(nidxtrain2)+1:newlength2);
nidxtest = [nidxtest1,nidxtest2];
clear grouptype
grouptype(1:(length(nidxtrain1)+length(nidxtest1))*2) = "Avers";
grouptype(length(nidxtrain1)+length(nidxtest1)+1:(length(nidxtrain2)+length(nidxtest2))*2) = "NonAvers";
clear Xtrain
clear Xtest
clear Xall
clear Ytrain
clear Ytest
newnidxtrain = nidxtrain(randperm(length(nidxtrain)));
testshuffidx = nidxtrain(randperm(length(nidxtrain)));
for t = 1:length(nidxtrain)
Xtrain(:,t) = newtestforcclu(newnidxtrain(t),:);
Ytrain(t) = grouptype(newnidxtrain(t));
end
newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));
for t = 1:length(nidxtest)
Xtest(:,t) = newtestforcclu(newnidxtest(t),:);
Ytest(t) = grouptype(newnidxtest(t));
end
% for t = 1:length(nidx)
%    Xall(:,t) = newtestforcclu4(nidx(t),:);
% end
% Yall = grouptype(nidx);
%%
% Mdl = fitcsvm(Xtrain',Ytrain','OptimizeHyperparameters','auto', ...
% 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName', ...
% 'expected-improvement-plus'))
% partitionedModel = crossval(Mdl, 'KFold', 10);
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% % Compute validation accuracy
% validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
% validationAccuracy = 1 - validation_error;
% oofLabel_n = predict(Mdl,Xtest');
% test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
% nanmean(test_accuracy_for_iter)
%%
% SVMModel = fitcsvm(Xtrain',Ytrain','Standardize',true,'KernelFunction','RBF',...
% 'KernelScale','auto');
SVMModel = fitcsvm(Xtrain',Ytrain');
partitionedModel = crossval(SVMModel, 'KFold', 10);
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);
% Compute validation accuracy
validation_error = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError'); % validation error
validationAccuracy = 1 - validation_error;
oofLabel_n = predict(SVMModel,Xtest');
test_accuracy_for_iter = sum((oofLabel_n == Ytest'))/length(Ytest')*100;
testaccuracy = nanmean(test_accuracy_for_iter);
svmcellcount = size(newtestforcclu,2);
%     elseif isempty(find(newWTallidx==j)) == 1
%         testaccuracy(j,i) = NaN;
%         svmcellcount(j,i) = 0;
%     end
allaccuraciesBLAbytime(m,p) = testaccuracy;
clear testaccuracy
clear svmcellcount
end
disp(p)
end
allaccuraciesBLAbymouseWT{u} = allaccuraciesBLAbytime;
disp(u)
end
%%

%%

