%%

allWTS1cellssoc = find(groupS1volALL == "WT");
allWTS1idx = idxS1WT(find(groupS1volALL == "WT"));
allmouseWTRSS1 = S1mouseIDWT(allWTS1cellssoc);
testS1vol = allvolS1WTTRIALSSpks;

    clear RStestS1vol
    mouseallWTS1cellssoc = allWTS1cellssoc;
    RStestS1vol = testS1vol(:,mouseallWTS1cellssoc);
    [badS1INFr,badS1INFc] = find(isnan(RStestS1vol') | ismember(RStestS1vol',Inf));
    badS1INF = unique(badS1INFr);
    clear newtestS1vol
    newtestS1vol = RStestS1vol;
    newtestS1vol(:,badS1INF) = [];
    mousenumidx = allWTS1idx;
    newWTS1allidx = mousenumidx;
    newWTS1allidx(badS1INF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestS1vol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1volclu
    if isempty(newWTS1allidx)==0 
    newalltestS1volclu = newtestS1vol;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1volclu,2));
    
    newtestS1volclu = (newalltestS1volclu(:,numneur(1:minneur)));
%     disp(size(newtestS1volclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestS1volclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1volclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1volclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestS1volclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1WTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzS1VOLALL = allaccuraciesHzS1WTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestS1vol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1volclu
    if isempty(newWTS1allidx)==0 
    newalltestS1volclu = newtestS1vol;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1volclu,2));
    
    newtestS1volclu = (newalltestS1volclu(:,numneur(1:minneur)));
%     disp(size(newtestS1volclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";
    
    switchgroup = randperm(80);

    grouptypeshuff = grouptype(switchgroup);
    

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestS1volclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1volclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1volclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestS1volclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1WTshufALL{m} = testaccuracy;
disp(m)
end

%%
clear accuracymeanWT
clear accuracySEMWT
clear accuracymeanKO
clear accuracySEMKO
clear accuracymult

clear accuracymeanWTshuf
clear accuracySEMWTshuf
clear accuracymeanKOshuf
clear accuracySEMKOshuf
clear accuracymultshuf

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzS1VOLALL{n}(a,:);
        accuracymult(n,:) = accuracy;
    end
    accuracymeanWT(a,:) = nanmean(accuracymult);
    accuracySEMWT(a,:) = nanstd(accuracymult)/(sqrt(50));
end

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzS1WTshufALL{n}(a,:);
        accuracymultshuf(n,:) = accuracy;
    end
    accuracymeanWTshuf(a,:) = nanmean(accuracymultshuf);
    accuracySEMWTshuf(a,:) = nanstd(accuracymultshuf)/(sqrt(50));
end

b = [1,2:2:20];
figure(12);  shadedErrorBar(b,accuracymeanWT,accuracySEMWT,'lineprops','k')
% 
figure(12);  shadedErrorBar(b,accuracymeanWTshuf,accuracySEMWTshuf,'lineprops','k'); 

%%
allWTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths< 400);
allWTS1idx = idxS1WT(find(groupS1volALL == "WT" & allvolsocS1widths< 400));
allmouseWTRSS1 = S1mouseIDWT(allWTS1cellssoc);
testS1vol = allvolS1WTTRIALSSpks;
%%
    clear RStestS1vol
    mouseallWTS1cellssoc = allWTS1cellssoc;
    RStestS1vol = testS1vol(:,mouseallWTS1cellssoc);
    [badS1INFr,badS1INFc] = find(isnan(RStestS1vol') | ismember(RStestS1vol',Inf));
    badS1INF = unique(badS1INFr);
    clear newtestS1vol
    newtestS1vol = RStestS1vol;
    newtestS1vol(:,badS1INF) = [];
    mousenumidx = allWTS1idx;
    newWTS1allidx = mousenumidx;
    newWTS1allidx(badS1INF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestS1vol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1volclu
    if isempty(newWTS1allidx)==0 
    newalltestS1volclu = newtestS1vol;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1volclu,2));
    
    newtestS1volclu = (newalltestS1volclu(:,numneur(1:minneur)));
%     disp(size(newtestS1volclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestS1volclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1volclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1volclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestS1volclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1FSWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzS1FSVOLALL = allaccuraciesHzS1FSWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestS1vol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1volclu
    if isempty(newWTS1allidx)==0 
    newalltestS1volclu = newtestS1vol;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1volclu,2));
    
    newtestS1volclu = (newalltestS1volclu(:,numneur(1:minneur)));
%     disp(size(newtestS1volclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";
    
    switchgroup = randperm(80);

    grouptypeshuff = grouptype(switchgroup);
    

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestS1volclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1volclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1volclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestS1volclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1FSWTshufALL{m} = testaccuracy;
disp(m)
end

%%
%%
clear accuracymeanWT
clear accuracySEMWT
clear accuracymeanKO
clear accuracySEMKO
clear accuracymult

clear accuracymeanWTshuf
clear accuracySEMWTshuf
clear accuracymeanKOshuf
clear accuracySEMKOshuf
clear accuracymultshuf

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzS1FSVOLALL{n}(a,:);
        accuracymult(n,:) = accuracy;
    end
    accuracymeanWT(a,:) = nanmean(accuracymult);
    accuracySEMWT(a,:) = nanstd(accuracymult)/(sqrt(50));
end

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzS1FSWTshufALL{n}(a,:);
        accuracymultshuf(n,:) = accuracy;
    end
    accuracymeanWTshuf(a,:) = nanmean(accuracymultshuf);
    accuracySEMWTshuf(a,:) = nanstd(accuracymultshuf)/(sqrt(50));
end

b = [1,2:2:20];
figure(12);  hold on;shadedErrorBar(b,accuracymeanWT,accuracySEMWT,'lineprops','r')
% 
figure(12);  hold on;shadedErrorBar(b,accuracymeanWTshuf,accuracySEMWTshuf,'lineprops','r'); 


%%
allWTSTRcellssoc = find(groupSTRvolALL == "WT");
allWTSTRidx = idxSTRWT(find(groupSTRvolALL == "WT"));
allmouseWTRSSTR = STRmouseIDWT(allWTSTRcellssoc);
testSTRvol = allvolSTRWTTRIALSSpks;
%%
    clear RStestSTRvol
    mouseallWTSTRcellssoc = allWTSTRcellssoc;
    RStestSTRvol = testSTRvol(:,mouseallWTSTRcellssoc);
    [badSTRINFr,badSTRINFc] = find(isnan(RStestSTRvol') | ismember(RStestSTRvol',Inf));
    badSTRINF = unique(badSTRINFr);
    clear newtestSTRvol
    newtestSTRvol = RStestSTRvol;
    newtestSTRvol(:,badSTRINF) = [];
    mousenumidx = allWTSTRidx;
    newWTSTRallidx = mousenumidx;
    newWTSTRallidx(badSTRINF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestSTRvol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestSTRvolclu
    if isempty(newWTSTRallidx)==0 
    newalltestSTRvolclu = newtestSTRvol;
    
%     edges = unique(newWTSTRallidx);
%     counts = histc(newWTSTRallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestSTRvolclu,2));
    
    newtestSTRvolclu = (newalltestSTRvolclu(:,numneur(1:minneur)));
%     disp(size(newtestSTRvolclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestSTRvolclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestSTRvolclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestSTRvolclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestSTRvolclu,2);
    elseif isempty(newWTSTRallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzSTRWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzSTRVOLALL = allaccuraciesHzSTRWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestSTRvol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestSTRvolclu
    if isempty(newWTSTRallidx)==0 
    newalltestSTRvolclu = newtestSTRvol;
    
%     edges = unique(newWTSTRallidx);
%     counts = histc(newWTSTRallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestSTRvolclu,2));
    
    newtestSTRvolclu = (newalltestSTRvolclu(:,numneur(1:minneur)));
%     disp(size(newtestSTRvolclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";
    
    switchgroup = randperm(80);

    grouptypeshuff = grouptype(switchgroup);
    

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestSTRvolclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestSTRvolclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestSTRvolclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestSTRvolclu,2);
    elseif isempty(newWTSTRallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzSTRWTshufALL{m} = testaccuracy;
disp(m)
end

%%
%%
clear accuracymeanWT
clear accuracySEMWT
clear accuracymeanKO
clear accuracySEMKO
clear accuracymult

clear accuracymeanWTshuf
clear accuracySEMWTshuf
clear accuracymeanKOshuf
clear accuracySEMKOshuf
clear accuracymultshuf

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzSTRVOLALL{n}(a,:);
        accuracymult(n,:) = accuracy;
    end
    accuracymeanWT(a,:) = nanmean(accuracymult);
    accuracySEMWT(a,:) = nanstd(accuracymult)/(sqrt(50));
end

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzSTRWTshufALL{n}(a,:);
        accuracymultshuf(n,:) = accuracy;
    end
    accuracymeanWTshuf(a,:) = nanmean(accuracymultshuf);
    accuracySEMWTshuf(a,:) = nanstd(accuracymultshuf)/(sqrt(50));
end

b = [1,2:2:20];
figure(12);  hold on;shadedErrorBar(b,accuracymeanWT,accuracySEMWT,'lineprops','b')
% 
figure(12);  hold on;shadedErrorBar(b,accuracymeanWTshuf,accuracySEMWTshuf,'lineprops','b'); 

%%
allWTBLAcellssoc = find(groupBLAvolALL == "WT");
allWTBLAidx = idxBLAWT(find(groupBLAvolALL == "WT"));
allmouseWTRSBLA = BLAmouseIDWT(allWTBLAcellssoc);
testBLAvol = allvolBLAWTTRIALSSpks;
%%
    clear RStestBLAvol
    mouseallWTBLAcellssoc = allWTBLAcellssoc;
    RStestBLAvol = testBLAvol(:,mouseallWTBLAcellssoc);
    [badBLAINFr,badBLAINFc] = find(isnan(RStestBLAvol') | ismember(RStestBLAvol',Inf));
    badBLAINF = unique(badBLAINFr);
    clear newtestBLAvol
    newtestBLAvol = RStestBLAvol;
    newtestBLAvol(:,badBLAINF) = [];
    mousenumidx = allWTBLAidx;
    newWTBLAallidx = mousenumidx;
    newWTBLAallidx(badBLAINF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestBLAvol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestBLAvolclu
    if isempty(newWTBLAallidx)==0 
    newalltestBLAvolclu = newtestBLAvol;
    
%     edges = unique(newWTBLAallidx);
%     counts = histc(newWTBLAallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestBLAvolclu,2));
    
    newtestBLAvolclu = (newalltestBLAvolclu(:,numneur(1:minneur)));
%     disp(size(newtestBLAvolclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestBLAvolclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestBLAvolclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestBLAvolclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestBLAvolclu,2);
    elseif isempty(newWTBLAallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzBLAWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzBLAVOLALL = allaccuraciesHzBLAWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestBLAvol,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestBLAvolclu
    if isempty(newWTBLAallidx)==0 
    newalltestBLAvolclu = newtestBLAvol;
    
%     edges = unique(newWTBLAallidx);
%     counts = histc(newWTBLAallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestBLAvolclu,2));
    
    newtestBLAvolclu = (newalltestBLAvolclu(:,numneur(1:minneur)));
%     disp(size(newtestBLAvolclu,2))

    nidx1 = randperm(40);
    nidx2 = randperm(40)+40;

    nidxtrain1 = nidx1(1:40*0.8);
    nidxtrain2 = nidx2(1:40*0.8);
    nidxtrain = [nidxtrain1,nidxtrain2];

    nidxtest1 = nidx1(length(nidxtrain1)+1:length(nidx1));
    nidxtest2 = nidx2(length(nidxtrain2)+1:length(nidx2));
    nidxtest = [nidxtest1,nidxtest2];


    grouptype(1:80) = "Mo";
    grouptype(41:80) = "Obj";
    
    switchgroup = randperm(80);

    grouptypeshuff = grouptype(switchgroup);
    

    clear Xtrain
    clear Xtest
    clear Xall
    clear Ytrain
    clear Ytest

newnidxtrain = nidxtrain(randperm(length(nidxtrain)));

testshuffidx = nidxtrain(randperm(length(nidxtrain)));

for t = 1:length(nidxtrain)
   Xtrain(:,t) = newtestBLAvolclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestBLAvolclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestBLAvolclu4(nidx(t),:);
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
testaccuracy(i) = nanmean(test_accuracy_for_iter);
svmcellcount(i) = size(newtestBLAvolclu,2);
    elseif isempty(newWTBLAallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzBLAWTshufALL{m} = testaccuracy;
disp(m)
end

%%
clear accuracymeanWT
clear accuracySEMWT
clear accuracymeanKO
clear accuracySEMKO
clear accuracymult

clear accuracymeanWTshuf
clear accuracySEMWTshuf
clear accuracymeanKOshuf
clear accuracySEMKOshuf
clear accuracymultshuf

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzBLAVOLALL{n}(a,:);
        accuracymult(n,:) = accuracy;
    end
    accuracymeanWT(a,:) = nanmean(accuracymult);
    accuracySEMWT(a,:) = nanstd(accuracymult)/(sqrt(50));
end

for a = 1
    for n = 1:50
        accuracy = allaccuraciesHzBLAWTshufALL{n}(a,:);
        accuracymultshuf(n,:) = accuracy;
    end
    accuracymeanWTshuf(a,:) = nanmean(accuracymultshuf);
    accuracySEMWTshuf(a,:) = nanstd(accuracymultshuf)/(sqrt(50));
end

b = [1,2:2:20];
figure(12);  hold on;shadedErrorBar(b,accuracymeanWT,accuracySEMWT,'lineprops','g')
% 
figure(12);  hold on;shadedErrorBar(b,accuracymeanWTshuf,accuracySEMWTshuf,'lineprops','g'); 