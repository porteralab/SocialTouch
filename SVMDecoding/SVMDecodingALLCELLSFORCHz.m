%%

allWTS1cellssoc = find(groupS1forcALL == "WT");
allWTS1idx = idxS1WT(find(groupS1forcALL == "WT"));
allmouseWTRSS1 = S1mouseIDWT(allWTS1cellssoc);
testS1forc = allforcS1WTTRIALSSpks;

    clear RStestS1forc
    mouseallWTS1cellssoc = allWTS1cellssoc;
    RStestS1forc = testS1forc(:,mouseallWTS1cellssoc);
    [badS1INFr,badS1INFc] = find(isnan(RStestS1forc') | ismember(RStestS1forc',Inf));
    badS1INF = unique(badS1INFr);
    clear newtestS1forc
    newtestS1forc = RStestS1forc;
    newtestS1forc(:,badS1INF) = [];
    mousenumidx = allWTS1idx;
    newWTS1allidx = mousenumidx;
    newWTS1allidx(badS1INF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestS1forc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1forcclu
    if isempty(newWTS1allidx)==0 
    newalltestS1forcclu = newtestS1forc;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1forcclu,2));
    
    newtestS1forcclu = (newalltestS1forcclu(:,numneur(1:minneur)));
%     disp(size(newtestS1forcclu,2))

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
   Xtrain(:,t) = newtestS1forcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1forcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1forcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestS1forcclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1WTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzS1FORCALL = allaccuraciesHzS1WTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestS1forc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1forcclu
    if isempty(newWTS1allidx)==0 
    newalltestS1forcclu = newtestS1forc;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1forcclu,2));
    
    newtestS1forcclu = (newalltestS1forcclu(:,numneur(1:minneur)));
%     disp(size(newtestS1forcclu,2))

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
   Xtrain(:,t) = newtestS1forcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1forcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1forcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestS1forcclu,2);
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
        accuracy = allaccuraciesHzS1FORCALL{n}(a,:);
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
allWTS1cellssoc = find(groupS1forcALL == "WT" & allforcsocS1widths< 400);
allWTS1idx = idxS1WT(find(groupS1forcALL == "WT" & allforcsocS1widths< 400));
allmouseWTRSS1 = S1mouseIDWT(allWTS1cellssoc);
testS1forc = allforcS1WTTRIALSSpks;
%%
    clear RStestS1forc
    mouseallWTS1cellssoc = allWTS1cellssoc;
    RStestS1forc = testS1forc(:,mouseallWTS1cellssoc);
    [badS1INFr,badS1INFc] = find(isnan(RStestS1forc') | ismember(RStestS1forc',Inf));
    badS1INF = unique(badS1INFr);
    clear newtestS1forc
    newtestS1forc = RStestS1forc;
    newtestS1forc(:,badS1INF) = [];
    mousenumidx = allWTS1idx;
    newWTS1allidx = mousenumidx;
    newWTS1allidx(badS1INF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestS1forc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1forcclu
    if isempty(newWTS1allidx)==0 
    newalltestS1forcclu = newtestS1forc;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1forcclu,2));
    
    newtestS1forcclu = (newalltestS1forcclu(:,numneur(1:minneur)));
%     disp(size(newtestS1forcclu,2))

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
   Xtrain(:,t) = newtestS1forcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1forcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1forcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestS1forcclu,2);
    elseif isempty(newWTS1allidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzS1FSWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzS1FSFORCALL = allaccuraciesHzS1FSWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestS1forc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestS1forcclu
    if isempty(newWTS1allidx)==0 
    newalltestS1forcclu = newtestS1forc;
    
%     edges = unique(newWTS1allidx);
%     counts = histc(newWTS1allidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestS1forcclu,2));
    
    newtestS1forcclu = (newalltestS1forcclu(:,numneur(1:minneur)));
%     disp(size(newtestS1forcclu,2))

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
   Xtrain(:,t) = newtestS1forcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestS1forcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestS1forcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestS1forcclu,2);
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
        accuracy = allaccuraciesHzS1FSFORCALL{n}(a,:);
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
allWTSTRcellssoc = find(groupSTRforcALL == "WT");
allWTSTRidx = idxSTRWT(find(groupSTRforcALL == "WT"));
allmouseWTRSSTR = STRmouseIDWT(allWTSTRcellssoc);
testSTRforc = allforcSTRWTTRIALSSpks;
%%
    clear RStestSTRforc
    mouseallWTSTRcellssoc = allWTSTRcellssoc;
    RStestSTRforc = testSTRforc(:,mouseallWTSTRcellssoc);
    [badSTRINFr,badSTRINFc] = find(isnan(RStestSTRforc') | ismember(RStestSTRforc',Inf));
    badSTRINF = unique(badSTRINFr);
    clear newtestSTRforc
    newtestSTRforc = RStestSTRforc;
    newtestSTRforc(:,badSTRINF) = [];
    mousenumidx = allWTSTRidx;
    newWTSTRallidx = mousenumidx;
    newWTSTRallidx(badSTRINF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestSTRforc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestSTRforcclu
    if isempty(newWTSTRallidx)==0 
    newalltestSTRforcclu = newtestSTRforc;
    
%     edges = unique(newWTSTRallidx);
%     counts = histc(newWTSTRallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestSTRforcclu,2));
    
    newtestSTRforcclu = (newalltestSTRforcclu(:,numneur(1:minneur)));
%     disp(size(newtestSTRforcclu,2))

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
   Xtrain(:,t) = newtestSTRforcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestSTRforcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestSTRforcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestSTRforcclu,2);
    elseif isempty(newWTSTRallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzSTRWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzSTRFORCALL = allaccuraciesHzSTRWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestSTRforc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestSTRforcclu
    if isempty(newWTSTRallidx)==0 
    newalltestSTRforcclu = newtestSTRforc;
    
%     edges = unique(newWTSTRallidx);
%     counts = histc(newWTSTRallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestSTRforcclu,2));
    
    newtestSTRforcclu = (newalltestSTRforcclu(:,numneur(1:minneur)));
%     disp(size(newtestSTRforcclu,2))

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
   Xtrain(:,t) = newtestSTRforcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestSTRforcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestSTRforcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestSTRforcclu,2);
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
        accuracy = allaccuraciesHzSTRFORCALL{n}(a,:);
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
allWTBLAcellssoc = find(groupBLAforcALL == "WT");
allWTBLAidx = idxBLAWT(find(groupBLAforcALL == "WT"));
allmouseWTRSBLA = BLAmouseIDWT(allWTBLAcellssoc);
testBLAforc = allforcBLAWTTRIALSSpks;
%%
    clear RStestBLAforc
    mouseallWTBLAcellssoc = allWTBLAcellssoc;
    RStestBLAforc = testBLAforc(:,mouseallWTBLAcellssoc);
    [badBLAINFr,badBLAINFc] = find(isnan(RStestBLAforc') | ismember(RStestBLAforc',Inf));
    badBLAINF = unique(badBLAINFr);
    clear newtestBLAforc
    newtestBLAforc = RStestBLAforc;
    newtestBLAforc(:,badBLAINF) = [];
    mousenumidx = allWTBLAidx;
    newWTBLAallidx = mousenumidx;
    newWTBLAallidx(badBLAINF) = [];
    
    %%
for m = 1:50
% rando = randperm(size(newtestBLAforc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestBLAforcclu
    if isempty(newWTBLAallidx)==0 
    newalltestBLAforcclu = newtestBLAforc;
    
%     edges = unique(newWTBLAallidx);
%     counts = histc(newWTBLAallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestBLAforcclu,2));
    
    newtestBLAforcclu = (newalltestBLAforcclu(:,numneur(1:minneur)));
%     disp(size(newtestBLAforcclu,2))

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
   Xtrain(:,t) = newtestBLAforcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptype(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestBLAforcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestBLAforcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestBLAforcclu,2);
    elseif isempty(newWTBLAallidx) == 1
        testaccuracy(i) = NaN;
        svmcellcount(i) = 0;
    end
    i = i+1;
    end 
allaccuraciesHzBLAWTALL{m} = testaccuracy;
disp(m)
end


allaccuraciesHzBLAFORCALL = allaccuraciesHzBLAWTALL;


%%

    %%
for m = 1:50
% rando = randperm(size(newtestBLAforc,2));
    i = 1;
    for a = [1,2:2:20]
    clear newtestBLAforcclu
    if isempty(newWTBLAallidx)==0 
    newalltestBLAforcclu = newtestBLAforc;
    
%     edges = unique(newWTBLAallidx);
%     counts = histc(newWTBLAallidx(:), edges);
    minneur = a;
    
    numneur = randperm(size(newalltestBLAforcclu,2));
    
    newtestBLAforcclu = (newalltestBLAforcclu(:,numneur(1:minneur)));
%     disp(size(newtestBLAforcclu,2))

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
   Xtrain(:,t) = newtestBLAforcclu(newnidxtrain(t),:);
   Ytrain(t) = grouptypeshuff(newnidxtrain(t));
end

newnidxtest = nidxtest(randperm(length(nidxtest)));
testshuffidx2 = nidxtest(randperm(length(nidxtest)));

for t = 1:length(nidxtest)
   Xtest(:,t) = newtestBLAforcclu(newnidxtest(t),:);
   Ytest(t) = grouptype(newnidxtest(t));
end

% for t = 1:length(nidx)
%    Xall(:,t) = newtestBLAforcclu4(nidx(t),:);
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
svmcellcount(i) = size(newtestBLAforcclu,2);
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
        accuracy = allaccuraciesHzBLAFORCALL{n}(a,:);
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
