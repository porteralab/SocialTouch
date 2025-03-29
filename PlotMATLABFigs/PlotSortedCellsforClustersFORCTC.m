[~,Indexofmax] = max(testSTRALL,[],2);

[minum, indxall] = sort(idxSTR,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsSTRsortPCA(i,:) = testSTRALL(newindex,:);
end

clear newmeansortedcells

numcluSTR = length(unique(idxSTR));
newmeansortedcellsSTRsortpeak = [];

for n = 1:numcluSTR
    setclu = find(minum == n);
    [~,Indexofmax] = max(newmeansortedcellsSTRsortPCA(setclu,:),[],2);
    [newmax, indxmax] = sort(Indexofmax,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsSTRsortPCA(setclu(setindxmax),:);
    end
end
newmeansortedcellsSTRsortpeak = newmeansortedcells;

clear newmeansortedcells
%
%
%
%

[~,Indexofmax] = max(testBLAALL,[],2);

[minum, indxall] = sort(idxBLA,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsBLAsortPCA(i,:) = testBLAALL(newindex,:);
end

clear newmeansortedcells

numcluBLA = length(unique(idxBLA));
newmeansortedcellsBLAsortpeak = [];

for n = 1:numcluBLA
    setclu = find(minum == n);
    [~,Indexofmax] = max(newmeansortedcellsBLAsortPCA(setclu,:),[],2);
    [newmax, indxmax] = sort(Indexofmax,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsBLAsortPCA(setclu(setindxmax),:);
    end
end
newmeansortedcellsBLAsortpeak = newmeansortedcells;
clear newmeansortedcells
%
%
%
%
%


[~,Indexofmax] = max(testS1ALL,[],2);

[minum, indxall] = sort(idxS1,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsS1sortPCA(i,:) = testS1ALL(newindex,:);
end

numcluS1 = length(unique(idxS1));
newmeansortedcellsS1sortpeak = [];

for n = 1:numcluS1
    setclu = find(minum == n);
    [~,Indexofmax] = max(newmeansortedcellsS1sortPCA(setclu,:),[],2);
    [newmax, indxmax] = sort(Indexofmax,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsS1sortPCA(setclu(setindxmax),:);
    end
end
newmeansortedcellsS1sortpeak = newmeansortedcells;
clear newmeansortedcells

%%
%%
% Get max and mins S1

mins(1) = min(min(newmeansortedcellsS1sortpeak));
mins(2) = min(min(newmeansortedcellsSTRsortpeak));
mins(3) = min(min(newmeansortedcellsBLAsortpeak));

maxs(1) = max(max(newmeansortedcellsS1sortpeak));
maxs(2) = max(max(newmeansortedcellsSTRsortpeak));
maxs(3) = max(max(newmeansortedcellsBLAsortpeak));
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
binsize = 0.05;
fig = figure(111);
sub11 = subplot(1,3,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsS1sortpeak,1),newmeansortedcellsS1sortpeak);
hold on
plot([0,0],[0,size(newmeansortedcellsS1sortpeak,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsS1sortpeak,1)],'--w')
ylabel('Cell #')
caxis(sub11,[minColorLimit,maxColorLimit]); 
title('All S1')

%%

binsize = 0.05;
hold on;
sub12 = subplot(1,3,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsSTRsortpeak,1),newmeansortedcellsSTRsortpeak);
hold on
plot([0,0],[0,size(newmeansortedcellsSTRsortpeak,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsSTRsortpeak,1)],'--w')
ylabel('Cell #')
caxis(sub12,[minColorLimit,maxColorLimit]); 
title('All STR')

%%
binsize = 0.05;
hold on;
sub13 = subplot(1,3,3);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsBLAsortpeak,1),newmeansortedcellsBLAsortpeak);
hold on
plot([0,0],[0,size(newmeansortedcellsBLAsortpeak,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsBLAsortpeak,1)],'--w')
ylabel('Cell #')
caxis(sub13,[minColorLimit,maxColorLimit]); 
title('All BLA')
%%

%
%
%
%
%
%
%
%
%

%% PLOT BY GENOTYPE

%%
S1WT = find(groupS1forcALL == "WT");
S1KO = find(groupS1forcALL == "KO");

testS1WTALL = testS1ALL(S1WT,:);
idxS1WT = idxS1(S1WT);
cluorder = [4,2,3,1,5];
idxS1WTdup = idxS1WT;

for a = 1:5
    idxS1WTdup(find(idxS1WT == a)) = cluorder(a);
end

idxS1WT = idxS1WTdup;


[~,IndexofmaxWT] = max(testS1WTALL,[],2);

[minumWT, indxallWT] = sort(idxS1WT,'ascend');

for i = 1:length(indxallWT)
    newindex = indxallWT(i);
    newmeansortedcellsS1sortPCAWT(i,:) = testS1WTALL(newindex,:);
end

numcluS1 = length(unique(idxS1WT));
newmeansortedcellsS1sortpeakWT = [];


for n = 1:numcluS1
    setclu = find(minumWT == cluorder(n));
    [~,IndexofmaxWT] = max(newmeansortedcellsS1sortPCAWT(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxWT,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsS1sortPCAWT(setclu(setindxmax),:);
    end
end
newmeansortedcellsS1sortpeakWT = newmeansortedcells;

clear newmeansortedcells


testS1KOALL = testS1ALL(S1KO,:);
idxS1KO = idxS1(S1KO);
cluorder = [4,2,3,1,5];
idxS1KOdup = idxS1KO;

for a = 1:5
    idxS1KOdup(find(idxS1KO == a)) = cluorder(a);
end

idxS1KO = idxS1KOdup;


[~,IndexofmaxKO] = max(testS1KOALL,[],2);

[minumKO, indxallKO] = sort(idxS1KO,'ascend');

for i = 1:length(indxallKO)
    newindex = indxallKO(i);
    newmeansortedcellsS1sortPCAKO(i,:) = testS1KOALL(newindex,:);
end

numcluS1 = length(unique(idxS1KO));
newmeansortedcellsS1sortpeakKO = [];

for n = 1:numcluS1
    setclu = find(minumKO == cluorder(n));
    [~,IndexofmaxKO] = max(newmeansortedcellsS1sortPCAKO(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxKO,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsS1sortPCAKO(setclu(setindxmax),:);
    end
end
newmeansortedcellsS1sortpeakKO = newmeansortedcells;

clear newmeansortedcells

%%

STRWT = find(groupSTRforcALL == "WT");
STRKO = find(groupSTRforcALL == "KO");

testSTRWTALL = testSTRALL(STRWT,:);
idxSTRWT = idxSTR(STRWT);
cluorder = [2,3,4,1,5,6]';
idxSTRWTdup = idxSTRWT;

for a = 1:6
    idxSTRWTdup(find(idxSTRWT == a)) = cluorder(a);
end

idxSTRWT = idxSTRWTdup;


[~,IndexofmaxWT] = max(testSTRWTALL,[],2);

[minumWT, indxallWT] = sort(idxSTRWT,'ascend');

for i = 1:length(indxallWT)
    newindex = indxallWT(i);
    newmeansortedcellsSTRsortPCAWT(i,:) = testSTRWTALL(newindex,:);
end

numcluSTR = length(unique(idxSTRWT));
newmeansortedcellsSTRsortpeakWT = [];

cluorder = [3,5,1,6,2,4];
for n = 1:numcluSTR
    setclu = find(minumWT == n);
    [~,IndexofmaxWT] = max(newmeansortedcellsSTRsortPCAWT(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxWT,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsSTRsortPCAWT(setclu(setindxmax),:);
    end
end
newmeansortedcellsSTRsortpeakWT = newmeansortedcells;

clear newmeansortedcells


testSTRKOALL = testSTRALL(STRKO,:);
idxSTRKO = idxSTR(STRKO);
cluorder = [2,3,4,1,5,6]';
idxSTRKOdup = idxSTRKO;

for a = 1:6
    idxSTRKOdup(find(idxSTRKO == a)) = cluorder(a);
end

idxSTRKO = idxSTRKOdup;


[~,IndexofmaxKO] = max(testSTRKOALL,[],2);

[minumKO, indxallKO] = sort(idxSTRKO,'ascend');

for i = 1:length(indxallKO)
    newindex = indxallKO(i);
    newmeansortedcellsSTRsortPCAKO(i,:) = testSTRKOALL(newindex,:);
end

numcluSTR = length(unique(idxSTRKO));
newmeansortedcellsSTRsortpeakKO = [];

cluorder = [3,5,1,6,2,4];
for n = 1:numcluSTR
    setclu = find(minumKO == n);
    [~,IndexofmaxKO] = max(newmeansortedcellsSTRsortPCAKO(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxKO,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsSTRsortPCAKO(setclu(setindxmax),:);
    end
end
newmeansortedcellsSTRsortpeakKO = newmeansortedcells;

clear newmeansortedcells

%%

BLAWT = find(groupBLAforcALL == "WT");
BLAKO = find(groupBLAforcALL == "KO");

testBLAWTALL = testBLAALL(BLAWT,:);
idxBLAWT = idxBLA(BLAWT);
cluorder = [2,1,4,3];
idxBLAWTdup = idxBLAWT;

for a = 1:4
    idxBLAWTdup(find(idxBLAWT == a)) = cluorder(a);
end

idxBLAWT = idxBLAWTdup;


[~,IndexofmaxWT] = max(testBLAWTALL,[],2);

[minumWT, indxallWT] = sort(idxBLAWT,'ascend');

for i = 1:length(indxallWT)
    newindex = indxallWT(i);
    newmeansortedcellsBLAsortPCAWT(i,:) = testBLAWTALL(newindex,:);
end

numcluBLA = length(unique(idxBLAWT));
newmeansortedcellsBLAsortpeakWT = [];


for n = 1:numcluBLA
    setclu = find(minumWT == cluorder(n));
    [~,IndexofmaxWT] = max(newmeansortedcellsBLAsortPCAWT(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxWT,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsBLAsortPCAWT(setclu(setindxmax),:);
    end
end
newmeansortedcellsBLAsortpeakWT = newmeansortedcells;

clear newmeansortedcells


testBLAKOALL = testBLAALL(BLAKO,:);
idxBLAKO = idxBLA(BLAKO);
cluorder = [2,1,4,3];
idxBLAKOdup = idxBLAKO;

for a = 1:4
    idxBLAKOdup(find(idxBLAKO == a)) = cluorder(a);
end

idxBLAKO = idxBLAKOdup;


[~,IndexofmaxKO] = max(testBLAKOALL,[],2);

[minumKO, indxallKO] = sort(idxBLAKO,'ascend');

for i = 1:length(indxallKO)
    newindex = indxallKO(i);
    newmeansortedcellsBLAsortPCAKO(i,:) = testBLAKOALL(newindex,:);
end

numcluBLA = length(unique(idxBLAKO));
newmeansortedcellsBLAsortpeakKO = [];

for n = 1:numcluBLA
    setclu = find(minumKO == cluorder(n));
    [~,IndexofmaxKO] = max(newmeansortedcellsBLAsortPCAKO(setclu,:),[],2);
    [newmax, indxmax] = sort(IndexofmaxKO,'ascend');
    for m = 1:length(setclu)
    setindxmax = indxmax(m);
    newmeansortedcells(setclu(m),:) = newmeansortedcellsBLAsortPCAKO(setclu(setindxmax),:);
    end
end
newmeansortedcellsBLAsortpeakKO = newmeansortedcells;

clear newmeansortedcells

%%
% Get max and mins S1

mins(1) = min(min(newmeansortedcellsS1sortpeakWT));
mins(2) = min(min(newmeansortedcellsS1sortpeakKO));
mins(3) = min(min(newmeansortedcellsSTRsortpeakWT));
mins(4) = min(min(newmeansortedcellsSTRsortpeakKO));
mins(5) = min(min(newmeansortedcellsBLAsortpeakWT));
mins(6) = min(min(newmeansortedcellsBLAsortpeakKO));

maxs(1) = max(max(newmeansortedcellsS1sortpeakWT));
maxs(2) = max(max(newmeansortedcellsS1sortpeakKO));
maxs(3) = max(max(newmeansortedcellsSTRsortpeakWT));
maxs(4) = max(max(newmeansortedcellsSTRsortpeakKO));
maxs(5) = max(max(newmeansortedcellsBLAsortpeakWT));
maxs(6) = max(max(newmeansortedcellsBLAsortpeakKO));
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
binsize = 0.05;
fig = figure(101);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsS1sortpeakWT,1),newmeansortedcellsS1sortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsS1sortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsS1sortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT S1')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsS1sortpeakKO,1),newmeansortedcellsS1sortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsS1sortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsS1sortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO S1')

%%

binsize = 0.05;
fig = figure(102);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsSTRsortpeakWT,1),newmeansortedcellsSTRsortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsSTRsortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsSTRsortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT STR')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsSTRsortpeakKO,1),newmeansortedcellsSTRsortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsSTRsortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsSTRsortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO STR')

%%
binsize = 0.05;
fig = figure(103);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsBLAsortpeakWT,1),newmeansortedcellsBLAsortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsBLAsortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsBLAsortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT BLA')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsBLAsortpeakKO,1),newmeansortedcellsBLAsortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsBLAsortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsBLAsortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO BLA')


%%

%%
% Get max and mins S1

mins(1) = min(min(newmeansortedcellsS1sortpeakWT));
mins(2) = min(min(newmeansortedcellsS1sortpeakKO));
mins(3) = min(min(newmeansortedcellsSTRsortpeakWT));
mins(4) = min(min(newmeansortedcellsSTRsortpeakKO));
mins(5) = min(min(newmeansortedcellsBLAsortpeakWT));
mins(6) = min(min(newmeansortedcellsBLAsortpeakKO));

maxs(1) = max(max(newmeansortedcellsS1sortpeakWT));
maxs(2) = max(max(newmeansortedcellsS1sortpeakKO));
maxs(3) = max(max(newmeansortedcellsSTRsortpeakWT));
maxs(4) = max(max(newmeansortedcellsSTRsortpeakKO));
maxs(5) = max(max(newmeansortedcellsBLAsortpeakWT));
maxs(6) = max(max(newmeansortedcellsBLAsortpeakKO));
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
binsize = 0.05;
fig = figure(101);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsS1sortpeakWT,1),newmeansortedcellsS1sortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsS1sortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsS1sortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT S1')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsS1sortpeakKO,1),newmeansortedcellsS1sortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsS1sortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsS1sortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO S1')

%%

binsize = 0.05;
fig = figure(102);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsSTRsortpeakWT,1),newmeansortedcellsSTRsortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsSTRsortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsSTRsortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT STR')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsSTRsortpeakKO,1),newmeansortedcellsSTRsortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsSTRsortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsSTRsortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO STR')

%%
binsize = 0.05;
fig = figure(103);
sub1 = subplot(1,2,1);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsBLAsortpeakWT,1),newmeansortedcellsBLAsortpeakWT);
hold on
plot([0,0],[0,size(newmeansortedcellsBLAsortpeakWT,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsBLAsortpeakWT,1)],'--w')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('WT BLA')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:6.95,1:size(newmeansortedcellsBLAsortpeakKO,1),newmeansortedcellsBLAsortpeakKO);
hold on
plot([0,0],[0,size(newmeansortedcellsBLAsortpeakKO,1)],'--w')
plot([5,5],[0,size(newmeansortedcellsBLAsortpeakKO,1)],'--w')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('KO BLA')
