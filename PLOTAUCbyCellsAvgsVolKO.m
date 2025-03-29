%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO");

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLSOCZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOsocS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOsocS1(AUCsocKOS1(find(testVOLKOsocS1 == 1))) = 1;
allIDVOLsocS1cells = allgoodtestVOLKOsocS1(KOS1cellssoc-533);

newtestVOLKOsocS1 = allIDVOLsocS1cells;
newtestVOLKOsocS1(badS1INF) = [];

newS1mouseIDKO = S1mouseIDKO(KOS1cellssoc-533);
newS1mouseIDKO(badS1INF) = [];


clear newALLS1KOVOLSOCZSM
for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

figure(144); shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLOBJZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOsocS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOsocS1(AUCsocKOS1(find(testVOLKOsocS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOsocS1(KOS1cellssoc-533);

newtestVOLKOsocS1 = allIDVOLobjS1cells;
newtestVOLKOsocS1(badS1INF) = [];


clear newALLS1KOVOLSOCZSM
for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(144);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLSOCZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOobjS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOobjS1(AUCobjKOS1(find(testVOLKOobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOobjS1(KOS1cellssoc-533);

newtestVOLKOobjS1 = allIDVOLobjS1cells;
newtestVOLKOobjS1(badS1INF) = [];


newS1mouseIDKO = S1mouseIDKO(KOS1cellssoc-533);
newS1mouseIDKO(badS1INF) = [];
clear newALLS1KOVOLSOCZSM
for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);


figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

% KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLOBJZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOobjS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOobjS1(AUCobjKOS1(find(testVOLKOobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOobjS1(KOS1cellssoc-533);

newtestVOLKOobjS1 = allIDVOLobjS1cells;
newtestVOLKOobjS1(badS1INF) = [];


clear newALLS1KOVOLSOCZSM
for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLSOC(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOsocS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOsocS1(AUCsocKOS1(find(testVOLKOsocS1 == 1))) = 1;
allIDVOLsocS1cells = allgoodtestVOLKOsocS1(KOS1cellssoc-533);

newtestVOLKOsocS1 = allIDVOLsocS1cells;
newtestVOLKOsocS1(badS1INF) = [];



for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLOBJ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOsocS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOsocS1(AUCsocKOS1(find(testVOLKOsocS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOsocS1(KOS1cellssoc-533);

newtestVOLKOsocS1 = allIDVOLobjS1cells;
newtestVOLKOsocS1(badS1INF) = [];



for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLSOC(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOobjS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOobjS1(AUCobjKOS1(find(testVOLKOobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOobjS1(KOS1cellssoc-533);

newtestVOLKOobjS1 = allIDVOLobjS1cells;
newtestVOLKOobjS1(badS1INF) = [];



for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1volALL == "KO" & allvolsocS1widths>=400);

% KOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-533);



ALLS1KOVOLSOCZ = ALLS1VOLOBJ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOVOLSOCZ = ALLS1KOVOLSOCZ;
newALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestVOLKOobjS1 = zeros(size(AUCS1KOallVOL,1),1);
allgoodtestVOLKOobjS1(AUCobjKOS1(find(testVOLKOobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLKOobjS1(KOS1cellssoc-533);

newtestVOLKOobjS1 = allIDVOLobjS1cells;
newtestVOLKOobjS1(badS1INF) = [];



for a = 1:size(newALLS1KOVOLSOCZ,1)
    newALLS1KOVOLSOCZSM(a,:) = smoothdata(newALLS1KOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==1 & newtestVOLKOobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==2 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==3 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==4 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:)),nanstd(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:))/(sqrt(size(newALLS1KOVOLSOCZSM(find(newKOS1socidx==5 & newtestVOLKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%%

%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRvolALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

% KOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-266);



ALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOVOLSOCZ = ALLSTRKOVOLSOCZ;
newALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestVOLKOsocSTR = zeros(size(AUCSTRKOallVOL,1),1);
allgoodtestVOLKOsocSTR(AUCsocKOSTR(find(testVOLKOsocSTR == 1))) = 1;
allIDVOLsocSTRcells = allgoodtestVOLKOsocSTR(KOSTRcellssoc-266);

newtestVOLKOsocSTR = allIDVOLsocSTRcells;
newtestVOLKOsocSTR(badSTRINF) = [];

newSTRmouseIDKO = STRmouseIDKO(KOSTRcellssoc-266);
newSTRmouseIDKO(badS1INF) = [];


clear newALLSTRKOVOLSOCZSM
for a = 1:size(newALLSTRKOVOLSOCZ,1)
    newALLSTRKOVOLSOCZSM(a,:) = smoothdata(newALLSTRKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);


figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRvolALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

% KOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-266);



ALLSTRKOVOLSOCZ = ALLSTRVOLOBJZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOVOLSOCZ = ALLSTRKOVOLSOCZ;
newALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestVOLKOsocSTR = zeros(size(AUCSTRKOallVOL,1),1);
allgoodtestVOLKOsocSTR(AUCsocKOSTR(find(testVOLKOsocSTR == 1))) = 1;
allIDVOLsocSTRcells = allgoodtestVOLKOsocSTR(KOSTRcellssoc-266);

newtestVOLKOsocSTR = allIDVOLsocSTRcells;
newtestVOLKOsocSTR(badSTRINF) = [];

clear newALLSTRKOVOLSOCZSM
for a = 1:size(newALLSTRKOVOLSOCZ,1)
    newALLSTRKOVOLSOCZSM(a,:) = smoothdata(newALLSTRKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOsocSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRvolALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

% KOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-266);



ALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOVOLSOCZ = ALLSTRKOVOLSOCZ;
newALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestVOLKOobjSTR = zeros(size(AUCSTRKOallVOL,1),1);
allgoodtestVOLKOobjSTR(AUCobjKOSTR(find(testVOLKOobjSTR == 1))) = 1;
allIDVOLobjSTRcells = allgoodtestVOLKOobjSTR(KOSTRcellssoc-266);

newtestVOLKOobjSTR = allIDVOLobjSTRcells;
newtestVOLKOobjSTR(badSTRINF) = [];

newSTRmouseIDKO = STRmouseIDKO(KOSTRcellssoc-266);
newSTRmouseIDKO(badS1INF) = [];

clear newALLSTRKOVOLSOCZSM
for a = 1:size(newALLSTRKOVOLSOCZ,1)
    newALLSTRKOVOLSOCZSM(a,:) = smoothdata(newALLSTRKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRvolALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

% KOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-266);



ALLSTRKOVOLSOCZ = ALLSTRVOLOBJZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOVOLSOCZ = ALLSTRKOVOLSOCZ;
newALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestVOLKOobjSTR = zeros(size(AUCSTRKOallVOL,1),1);
allgoodtestVOLKOobjSTR(AUCobjKOSTR(find(testVOLKOobjSTR == 1))) = 1;
allIDVOLobjSTRcells = allgoodtestVOLKOobjSTR(KOSTRcellssoc-266);

newtestVOLKOobjSTR = allIDVOLobjSTRcells;
newtestVOLKOobjSTR(badSTRINF) = [];

clear newALLSTRKOVOLSOCZSM
for a = 1:size(newALLSTRKOVOLSOCZ,1)
    newALLSTRKOVOLSOCZSM(a,:) = smoothdata(newALLSTRKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1 & newtestVOLKOobjSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:)),nanstd(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6 & newtestVOLKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOsocBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOsocBLA(AUCsocKOBLA(find(testVOLKOsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLKOsocBLA(KOBLAcellssoc-240);

newtestVOLKOsocBLA = allIDVOLsocBLAcells;
newtestVOLKOsocBLA(badBLAINF) = [];

newBLAmouseIDKO = BLAmouseIDKO(KOBLAcellssoc-240);
newBLAmouseIDKO(badBLAINF) = [];

for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLOBJZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOsocBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOsocBLA(AUCsocKOBLA(find(testVOLKOsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLKOsocBLA(KOBLAcellssoc-240);

newtestVOLKOsocBLA = allIDVOLsocBLAcells;
newtestVOLKOsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOobjBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOobjBLA(AUCobjKOBLA(find(testVOLKOobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLKOobjBLA(KOBLAcellssoc-240);

newtestVOLKOobjBLA = allIDVOLobjBLAcells;
newtestVOLKOobjBLA(badBLAINF) = [];

newBLAmouseIDKO = BLAmouseIDKO(KOBLAcellssoc-240);
newBLAmouseIDKO(badBLAINF) = [];

for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLOBJZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOobjBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOobjBLA(AUCobjKOBLA(find(testVOLKOobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLKOobjBLA(KOBLAcellssoc-240);

newtestVOLKOobjBLA = allIDVOLobjBLAcells;
newtestVOLKOobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLSOC(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOsocBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOsocBLA(AUCsocKOBLA(find(testVOLKOsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLKOsocBLA(KOBLAcellssoc-240);

newtestVOLKOsocBLA = allIDVOLsocBLAcells;
newtestVOLKOsocBLA(badBLAINF) = [];



for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLOBJ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOsocBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOsocBLA(AUCsocKOBLA(find(testVOLKOsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLKOsocBLA(KOBLAcellssoc-240);

newtestVOLKOsocBLA = allIDVOLsocBLAcells;
newtestVOLKOsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLSOC(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOobjBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOobjBLA(AUCobjKOBLA(find(testVOLKOobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLKOobjBLA(KOBLAcellssoc-240);

newtestVOLKOobjBLA = allIDVOLobjBLAcells;
newtestVOLKOobjBLA(badBLAINF) = [];



for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

% KOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOVOLSOCZ = ALLBLAVOLOBJ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOVOLSOCZ = ALLBLAKOVOLSOCZ;
newALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestVOLKOobjBLA = zeros(size(AUCBLAKOallVOL,1),1);
allgoodtestVOLKOobjBLA(AUCobjKOBLA(find(testVOLKOobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLKOobjBLA(KOBLAcellssoc-240);

newtestVOLKOobjBLA = allIDVOLobjBLAcells;
newtestVOLKOobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOVOLSOCZ,1)
    newALLBLAKOVOLSOCZSM(a,:) = smoothdata(newALLBLAKOVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1 & newtestVOLKOobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:)),nanstd(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4 & newtestVOLKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
