function [AUCresp, AUCrespSH, sigexccells, S1RSexccells, S1FSexccells, strRSexccells, strFSexccells, strUCexccells, blaRSexccells, blaFSexccells, blaUCexccells, sigsupcells, S1RSsupcells, S1FSsupcells, strRSsupcells, strFSsupcells, strUCsupcells, blaRSsupcells, blaFSsupcells, blaUCsupcells] = getAUC(bspallstims, trials, cellsS1RS, cellsS1FS, cellsSTRRS, cellsSTRFS, cellsSTRUC, cellsBLARS, cellsBLAFS, cellsBLAUC, S1good, strgood, blagood)

for a = 1:length(bspallstims)
tests1 = bspallstims{a}; meanISI = nanmean(tests1(trials(1):trials(end),1:50));
meanTR = nanmean(tests1(trials(1):trials(end),71:120));
testISI = tests1(trials(1):trials(end),1:50);
testTR = tests1(trials(1):trials(end),71:120);
for i = 1:size(testTR,1)
firstTR = testTR(i,:);
firstISI = testISI(i,:);
DVTR(i) = nanmean(firstTR);
DVISI(i) = nanmean(firstISI);
end
% figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
dvmin = min([DVISI DVTR]);
dvmax = max([DVISI DVTR]);
dvstp = (dvmax-dvmin)/100;
p1 = [];
p2 = [];
i=1;
for cr=dvmin:dvstp:dvmax
p1(i) = length(find(DVISI < cr))/length(DVISI);
p2(i) = length(find(DVTR < cr))/length(DVTR);
i = i+1;
end
p1 = sort(p1);
p2 = sort(p2);
if isempty(p1) == 1
    p1all(:,a) = zeros(101,1);
    p2all(:,a) = zeros(101,1);
    AUCnegresp(a) = 0.5;
elseif isempty(p1) == 0
    p1all(:,a) = p1;
    p2all(:,a) = p2;
    AUCnegresp(a) = trapz(p1,p2);
end
end

AUCresp = abs(AUCnegresp-1);

% HERE SHUFFLE THE DATA
for a = 1:length(bspallstims)
    for sh = 1:1000
        for j = 1:size(bspallstims{a}, 1)
            bspcurr = bspallstims{a};
            bspallshuffle(j,:) = Shuffle(bspcurr(j,:));
        end
        tests1 = bspallshuffle; meanISI = nanmean(tests1(trials(1):trials(end),1:50));
        meanTR = nanmean(tests1(trials(1):trials(end),71:120));
        testISI = tests1(trials(1):trials(end),1:50);
        testTR = tests1(trials(1):trials(end),71:120);
        for i = 1:size(testTR,1)
            firstTR = testTR(i,:);
            firstISI = testISI(i,:);
            DVTR(i) = nanmean(firstTR);
            DVISI(i) = nanmean(firstISI);
        end
% figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
        dvmin = min([DVISI DVTR]);
        dvmax = max([DVISI DVTR]);
        dvstp = (dvmax-dvmin)/100;
        p1 = [];
        p2 = [];
        i=1;
        for cr=dvmin:dvstp:dvmax
        p1(i) = length(find(DVISI < cr))/length(DVISI);
        p2(i) = length(find(DVTR < cr))/length(DVTR);
        i = i+1;
        end
        p1 = sort(p1);
        p2 = sort(p2);
        if isempty(p1) == 1
        p1all = zeros(101,1);
        p2all = zeros(101,1);
        AUCnegrespSH(a,sh) = 0.5;
        elseif isempty(p1) == 0
        p1all = p1;
        p2all = p2;
        AUCnegrespSH(a,sh) = trapz(p1,p2);
        end
        AUCrespSH(a,sh) = abs(AUCnegrespSH(a,sh)-1);
    end
end


AUCcat = [AUCresp', AUCrespSH];

sigexccells = [];
sigsupcells = [];

for y = 1:size(AUCcat,1)
    lowp = prctile(AUCcat(y,:),2.5);
    upp = prctile(AUCcat(y,:),97.5);
    if AUCcat(y,1) > upp
        sigexccells(length(sigexccells)+1) = y;
    elseif AUCcat(y,1) < lowp
        sigsupcells(length(sigsupcells)+1) = y;
    end
end


S1RSexccells = find(ismember(S1good(cellsS1RS), sigexccells) == 1);
S1FSexccells = find(ismember(S1good(cellsS1FS), sigexccells) == 1);

strRSexccells = find(ismember(strgood(cellsSTRRS), sigexccells) == 1);
strFSexccells = find(ismember(strgood(cellsSTRFS), sigexccells) == 1);
strUCexccells = find(ismember(strgood(cellsSTRUC), sigexccells) == 1);

blaRSexccells = find(ismember(blagood(cellsBLARS), sigexccells) == 1);
blaFSexccells = find(ismember(blagood(cellsBLAFS), sigexccells) == 1);
blaUCexccells = find(ismember(blagood(cellsBLAUC), sigexccells) == 1);

S1RSsupcells = find(ismember(S1good(cellsS1RS), sigsupcells) == 1);
S1FSsupcells = find(ismember(S1good(cellsS1FS), sigsupcells) == 1);


strRSsupcells = find(ismember(strgood(cellsSTRRS), sigsupcells) == 1);
strFSsupcells = find(ismember(strgood(cellsSTRFS), sigsupcells) == 1);
strUCsupcells = find(ismember(strgood(cellsSTRUC), sigsupcells) == 1);

blaRSsupcells = find(ismember(blagood(cellsBLARS), sigsupcells) == 1);
blaFSsupcells = find(ismember(blagood(cellsBLAFS), sigsupcells) == 1);
blaUCsupcells = find(ismember(blagood(cellsBLAUC), sigsupcells) == 1);

end
