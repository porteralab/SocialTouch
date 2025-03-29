%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT");

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLSOCZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
badS1INF = [];
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLsocS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLsocS1(AUCsocS1(find(testVOLsocS1 == 1))) = 1;
allIDVOLsocS1cells = allgoodtestVOLsocS1(WTS1cellssoc);

newtestVOLsocS1 = allIDVOLsocS1cells;
newtestVOLsocS1(badS1INF) = [];

newS1mouseIDWT = S1mouseIDWT(WTS1cellssoc);
newS1mouseIDWT(badS1INF) = [];


clear newALLS1WTVOLSOCZSM
for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(22); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

figure(122); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1))));

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths>=400);

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLOBJZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLsocS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLsocS1(AUCsocS1(find(testVOLsocS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLsocS1(WTS1cellssoc);

newtestVOLsocS1 = allIDVOLobjS1cells;
newtestVOLsocS1(badS1INF) = [];

newS1mouseIDWT = S1mouseIDWT(WTS1cellssoc);
newS1mouseIDWT(badS1INF) = [];

clear newALLS1WTVOLSOCZSM
for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(22); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(122);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1 2]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT");

WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLSOCZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLobjS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLobjS1(AUCobjS1(find(testVOLobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLobjS1(WTS1cellssoc);

newtestVOLobjS1 = allIDVOLobjS1cells;
newtestVOLobjS1(badS1INF) = [];


newS1mouseIDWT = S1mouseIDWT(WTS1cellssoc);
newS1mouseIDWT(badS1INF) = [];
clear newALLS1WTVOLSOCZSM
for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);


figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1)))); 

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT");

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLOBJZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLobjS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLobjS1(AUCobjS1(find(testVOLobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLobjS1(WTS1cellssoc);

newtestVOLobjS1 = allIDVOLobjS1cells;
newtestVOLobjS1(badS1INF) = [];


clear newALLS1WTVOLSOCZSM
for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm');

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths>=400);

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLSOC(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLsocS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLsocS1(AUCsocS1(find(testVOLsocS1 == 1))) = 1;
allIDVOLsocS1cells = allgoodtestVOLsocS1(WTS1cellssoc);

newtestVOLsocS1 = allIDVOLsocS1cells;
newtestVOLsocS1(badS1INF) = [];



for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths>=400);

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLOBJ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLsocS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLsocS1(AUCsocS1(find(testVOLsocS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLsocS1(WTS1cellssoc);

newtestVOLsocS1 = allIDVOLobjS1cells;
newtestVOLsocS1(badS1INF) = [];



for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths>=400);

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLSOC(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLobjS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLobjS1(AUCobjS1(find(testVOLobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLobjS1(WTS1cellssoc);

newtestVOLobjS1 = allIDVOLobjS1cells;
newtestVOLobjS1(badS1INF) = [];



for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:),1)))); xlim([-1.85 6.85]);



%%
%% Smoothened  Cells Firing

S1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1volALL == "WT" & allvolsocS1widths>=400);

% WTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTVOLSOCZ = ALLS1VOLOBJ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTVOLSOCZ = ALLS1WTVOLSOCZ;
newALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestVOLobjS1 = zeros(size(AUCS1WTallVOL,1),1);
allgoodtestVOLobjS1(AUCobjS1(find(testVOLobjS1 == 1))) = 1;
allIDVOLobjS1cells = allgoodtestVOLobjS1(WTS1cellssoc);

newtestVOLobjS1 = allIDVOLobjS1cells;
newtestVOLobjS1(badS1INF) = [];



for a = 1:size(newALLS1WTVOLSOCZ,1)
    newALLS1WTVOLSOCZSM(a,:) = smoothdata(newALLS1WTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==1 & newtestVOLobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==2 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==3 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==4 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:)),nanstd(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:))/(sqrt(size(newALLS1WTVOLSOCZSM(find(newWTS1socidx==5 & newtestVOLobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%%

%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRvolALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

% WTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTVOLSOCZ = ALLSTRWTVOLSOCZ;
newALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestVOLsocSTR = zeros(size(AUCSTRWTallVOL,1),1);
allgoodtestVOLsocSTR(AUCsocSTR(find(testVOLsocSTR == 1))) = 1;
allIDVOLsocSTRcells = allgoodtestVOLsocSTR(WTSTRcellssoc);

newtestVOLsocSTR = allIDVOLsocSTRcells;
newtestVOLsocSTR(badSTRINF) = [];

newSTRmouseIDWT = STRmouseIDWT;
newSTRmouseIDWT(badSTRINF) = [];


clear newALLSTRWTVOLSOCZSM
for a = 1:size(newALLSTRWTVOLSOCZ,1)
    newALLSTRWTVOLSOCZSM(a,:) = smoothdata(newALLSTRWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:),1)))); xlim([-1.85 6.85]);


figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:),1)))); xlim([-1 2]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRvolALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

% WTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTVOLSOCZ = ALLSTRVOLOBJZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTVOLSOCZ = ALLSTRWTVOLSOCZ;
newALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestVOLsocSTR = zeros(size(AUCSTRWTallVOL,1),1);
allgoodtestVOLsocSTR(AUCsocSTR(find(testVOLsocSTR == 1))) = 1;
allIDVOLsocSTRcells = allgoodtestVOLsocSTR(WTSTRcellssoc);

newtestVOLsocSTR = allIDVOLsocSTRcells;
newtestVOLsocSTR(badSTRINF) = [];

clear newALLSTRWTVOLSOCZSM
for a = 1:size(newALLSTRWTVOLSOCZ,1)
    newALLSTRWTVOLSOCZSM(a,:) = smoothdata(newALLSTRWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLsocSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1 2]);

%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRvolALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

% WTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTVOLSOCZ = ALLSTRWTVOLSOCZ;
newALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestVOLobjSTR = zeros(size(AUCSTRWTallVOL,1),1);
allgoodtestVOLobjSTR(AUCobjSTR(find(testVOLobjSTR == 1))) = 1;
allIDVOLobjSTRcells = allgoodtestVOLobjSTR(WTSTRcellssoc);

newtestVOLobjSTR = allIDVOLobjSTRcells;
newtestVOLobjSTR(badSTRINF) = [];

newSTRmouseIDWT = STRmouseIDWT;
newSTRmouseIDWT(badSTRINF) = [];

clear newALLSTRWTVOLSOCZSM
for a = 1:size(newALLSTRWTVOLSOCZ,1)
    newALLSTRWTVOLSOCZSM(a,:) = smoothdata(newALLSTRWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:),1)))); xlim([-1.85 6.85]);


figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:),1)))); xlim([-1 2]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRvolALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

% WTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTVOLSOCZ = ALLSTRVOLOBJZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTVOLSOCZ = ALLSTRWTVOLSOCZ;
newALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestVOLobjSTR = zeros(size(AUCSTRWTallVOL,1),1);
allgoodtestVOLobjSTR(AUCobjSTR(find(testVOLobjSTR == 1))) = 1;
allIDVOLobjSTRcells = allgoodtestVOLobjSTR(WTSTRcellssoc);

newtestVOLobjSTR = allIDVOLobjSTRcells;
newtestVOLobjSTR(badSTRINF) = [];

clear newALLSTRWTVOLSOCZSM
for a = 1:size(newALLSTRWTVOLSOCZ,1)
    newALLSTRWTVOLSOCZSM(a,:) = smoothdata(newALLSTRWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1 & newtestVOLobjSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:)),nanstd(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:))/(sqrt(size(newALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6 & newtestVOLobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1 2]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLsocBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLsocBLA(AUCsocBLA(find(testVOLsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLsocBLA(WTBLAcellssoc);

newtestVOLsocBLA = allIDVOLsocBLAcells;
newtestVOLsocBLA(badBLAINF) = [];

newBLAmouseIDWT = BLAmouseIDWT;
newBLAmouseIDWT(badBLAINF) = [];




for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
% subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

figure(400); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1)))); xlim([-1 2]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLOBJZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLsocBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLsocBLA(AUCsocBLA(find(testVOLsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLsocBLA(WTBLAcellssoc);

newtestVOLsocBLA = allIDVOLsocBLAcells;
newtestVOLsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
% subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(400); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1 2]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLobjBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLobjBLA(AUCobjBLA(find(testVOLobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLobjBLA(WTBLAcellssoc);

newtestVOLobjBLA = allIDVOLobjBLAcells;
newtestVOLobjBLA(badBLAINF) = [];

newBLAmouseIDWT = BLAmouseIDWT;
newBLAmouseIDWT(badBLAINF) = [];

for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);


figure(410); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1)))); xlim([-1 2]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLOBJZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLobjBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLobjBLA(AUCobjBLA(find(testVOLobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLobjBLA(WTBLAcellssoc);

newtestVOLobjBLA = allIDVOLobjBLAcells;
newtestVOLobjBLA(badBLAINF) = [];



for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(410); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1 2]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLSOC(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLsocBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLsocBLA(AUCsocBLA(find(testVOLsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLsocBLA(WTBLAcellssoc);

newtestVOLsocBLA = allIDVOLsocBLAcells;
newtestVOLsocBLA(badBLAINF) = [];



for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLOBJ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLsocBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLsocBLA(AUCsocBLA(find(testVOLsocBLA == 1))) = 1;
allIDVOLsocBLAcells = allgoodtestVOLsocBLA(WTBLAcellssoc);

newtestVOLsocBLA = allIDVOLsocBLAcells;
newtestVOLsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLSOC(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLobjBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLobjBLA(AUCobjBLA(find(testVOLobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLobjBLA(WTBLAcellssoc);

newtestVOLobjBLA = allIDVOLobjBLAcells;
newtestVOLobjBLA(badBLAINF) = [];



for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allvolsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

% WTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTVOLSOCZ = ALLBLAVOLOBJ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTVOLSOCZ = ALLBLAWTVOLSOCZ;
newALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestVOLobjBLA = zeros(size(AUCBLAWTallVOL,1),1);
allgoodtestVOLobjBLA(AUCobjBLA(find(testVOLobjBLA == 1))) = 1;
allIDVOLobjBLAcells = allgoodtestVOLobjBLA(WTBLAcellssoc);

newtestVOLobjBLA = allIDVOLobjBLAcells;
newtestVOLobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTVOLSOCZ,1)
    newALLBLAWTVOLSOCZSM(a,:) = smoothdata(newALLBLAWTVOLSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1 & newtestVOLobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:)),nanstd(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:))/(sqrt(size(newALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4 & newtestVOLobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
