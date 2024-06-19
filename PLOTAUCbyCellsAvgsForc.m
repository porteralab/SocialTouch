%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT");

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCSOCZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCsocS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCsocS1(AUCsocS1(find(testFORCsocS1 == 1))) = 1;
allIDFORCsocS1cells = allgoodtestFORCsocS1(WTS1cellssoc);

newtestFORCsocS1 = allIDFORCsocS1cells;
newtestFORCsocS1(badS1INF) = [];

newS1mouseIDWT = S1mouseIDWT(WTS1cellssoc);
newS1mouseIDWT(badS1INF) = [];


clear newALLS1WTFORCSOCZSM
for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(22); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

figure(220); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;

% figure(222); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

% WTS1cellssoc = find(groupS1forcALL == "WT" & allforsocS1widths>=400);

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCOBJZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCsocS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCsocS1(AUCsocS1(find(testFORCsocS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCsocS1(WTS1cellssoc);

newtestFORCsocS1 = allIDFORCobjS1cells;
newtestFORCsocS1(badS1INF) = [];


clear newALLS1WTFORCSOCZSM
for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(22); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


figure(220); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT");

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCSOCZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCobjS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCobjS1(AUCobjS1(find(testFORCobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCobjS1(WTS1cellssoc);

newtestFORCobjS1 = allIDFORCobjS1cells;
newtestFORCobjS1(badS1INF) = [];

newS1mouseIDWT = S1mouseIDWT(WTS1cellssoc);
newS1mouseIDWT(badS1INF) = [];


clear newALLS1WTFORCSOCZSM
for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

figure(210); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;



%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT");

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCOBJZ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCobjS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCobjS1(AUCobjS1(find(testFORCobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCobjS1(WTS1cellssoc);

newtestFORCobjS1 = allIDFORCobjS1cells;
newtestFORCobjS1(badS1INF) = [];


clear newALLS1WTFORCSOCZSM
for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


figure(210); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;

% figure(211); shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

% WTS1cellssoc = find(groupS1forcALL == "WT" & allforsocS1widths>=400);

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCSOC(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCsocS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCsocS1(AUCsocS1(find(testFORCsocS1 == 1))) = 1;
allIDFORCsocS1cells = allgoodtestFORCsocS1(WTS1cellssoc);

newtestFORCsocS1 = allIDFORCsocS1cells;
newtestFORCsocS1(badS1INF) = [];



for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT" & allforsocS1widths>=400);

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCOBJ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCsocS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCsocS1(AUCsocS1(find(testFORCsocS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCsocS1(WTS1cellssoc);

newtestFORCsocS1 = allIDFORCobjS1cells;
newtestFORCsocS1(badS1INF) = [];



for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT" & allforsocS1widths>=400);

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCSOC(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCobjS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCobjS1(AUCobjS1(find(testFORCobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCobjS1(WTS1cellssoc);

newtestFORCobjS1 = allIDFORCobjS1cells;
newtestFORCobjS1(badS1INF) = [];



for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%WTS1cellssoc = find(ismember(WTS1cellssoc,S1cellssoc)==1);

WTS1cellssoc = find(groupS1forcALL == "WT" & allforsocS1widths>=400);

% WTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(WTS1cellssoc);



ALLS1WTFORCSOCZ = ALLS1FORCOBJ(WTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1WTFORCSOCZ = ALLS1WTFORCSOCZ;
newALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1WTnoinf = newmouseS1WT;
% newmouseS1WTnoinf(badS1INF) = [];

allgoodtestFORCobjS1 = zeros(size(AUCS1WTallFORC,1),1);
allgoodtestFORCobjS1(AUCobjS1(find(testFORCobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCobjS1(WTS1cellssoc);

newtestFORCobjS1 = allIDFORCobjS1cells;
newtestFORCobjS1(badS1INF) = [];



for a = 1:size(newALLS1WTFORCSOCZ,1)
    newALLS1WTFORCSOCZSM(a,:) = smoothdata(newALLS1WTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==1 & newtestFORCobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==2 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==3 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==4 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:)),nanstd(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:))/(sqrt(size(newALLS1WTFORCSOCZSM(find(newWTS1socidx==5 & newtestFORCobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%%

%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCsocSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCsocSTR(AUCsocSTR(find(testFORCsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCsocSTR(WTSTRcellssoc);

newtestFORCsocSTR = allIDFORCsocSTRcells;
newtestFORCsocSTR(badSTRINF) = [];

newSTRmouseIDWT = STRmouseIDWT(WTSTRcellssoc);
newSTRmouseIDWT(badSTRINF) = [];

clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);

figure(300);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCOBJZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCsocSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCsocSTR(AUCsocSTR(find(testFORCsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCsocSTR(WTSTRcellssoc);

newtestFORCsocSTR = allIDFORCsocSTRcells;
newtestFORCsocSTR(badSTRINF) = [];



clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCobjSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCobjSTR(AUCobjSTR(find(testFORCobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCobjSTR(WTSTRcellssoc);

newtestFORCobjSTR = allIDFORCobjSTRcells;
newtestFORCobjSTR(badSTRINF) = [];


newSTRmouseIDWT = STRmouseIDWT(WTSTRcellssoc);
newSTRmouseIDWT(badS1INF) = [];

clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCOBJZ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCobjSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCobjSTR(AUCobjSTR(find(testFORCobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCobjSTR(WTSTRcellssoc);

newtestFORCobjSTR = allIDFORCobjSTRcells;
newtestFORCobjSTR(badSTRINF) = [];

clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCSOC(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCsocSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCsocSTR(AUCsocSTR(find(testFORCsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCsocSTR(WTSTRcellssoc);

newtestFORCsocSTR = allIDFORCsocSTRcells;
newtestFORCsocSTR(badSTRINF) = [];


clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(34); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCOBJ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCsocSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCsocSTR(AUCsocSTR(find(testFORCsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCsocSTR(WTSTRcellssoc);

newtestFORCsocSTR = allIDFORCsocSTRcells;
newtestFORCsocSTR(badSTRINF) = [];

clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(34); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCsocSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCSOC(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCobjSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCobjSTR(AUCobjSTR(find(testFORCobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCobjSTR(WTSTRcellssoc);

newtestFORCobjSTR = allIDFORCobjSTRcells;
newtestFORCobjSTR(badSTRINF) = [];


clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(35); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


WTSTRcellssoc = find(groupSTRforcALL == "WT");

%WTSTRcellssoc = find(ismember(WTSTRcellssoc,STRcellssoc)==1);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

% WTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(WTSTRcellssoc);



ALLSTRWTFORCSOCZ = ALLSTRFORCOBJ(WTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRWTFORCSOCZ = ALLSTRWTFORCSOCZ;
newALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRWTnoinf = newmouseSTRWT;
% newmouseSTRWTnoinf(badSTRINF) = [];

allgoodtestFORCobjSTR = zeros(size(AUCSTRWTallFORC,1),1);
allgoodtestFORCobjSTR(AUCobjSTR(find(testFORCobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCobjSTR(WTSTRcellssoc);

newtestFORCobjSTR = allIDFORCobjSTRcells;
newtestFORCobjSTR(badSTRINF) = [];

clear newALLSTRWTFORCSOCZSM
for a = 1:size(newALLSTRWTFORCSOCZ,1)
    newALLSTRWTFORCSOCZSM(a,:) = smoothdata(newALLSTRWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(35); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1 & newtestFORCobjSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:)),nanstd(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:))/(sqrt(size(newALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6 & newtestFORCobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCsocBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCsocBLA(AUCsocBLA(find(testFORCsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCsocBLA(WTBLAcellssoc);

newtestFORCsocBLA = allIDFORCsocBLAcells;
newtestFORCsocBLA(badBLAINF) = [];

newBLAmouseIDWT = BLAmouseIDWT(WTBLAcellssoc);
newBLAmouseIDWT(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

figure(400); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCOBJZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCsocBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCsocBLA(AUCsocBLA(find(testFORCsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCsocBLA(WTBLAcellssoc);

newtestFORCsocBLA = allIDFORCsocBLAcells;
newtestFORCsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(400); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCobjBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCobjBLA(AUCobjBLA(find(testFORCobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCobjBLA(WTBLAcellssoc);

newtestFORCobjBLA = allIDFORCobjBLAcells;
newtestFORCobjBLA(badBLAINF) = [];


newBLAmouseIDWT = BLAmouseIDWT(WTBLAcellssoc);
newBLAmouseIDWT(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

figure(410); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCOBJZ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCobjBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCobjBLA(AUCobjBLA(find(testFORCobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCobjBLA(WTBLAcellssoc);

newtestFORCobjBLA = allIDFORCobjBLAcells;
newtestFORCobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(410); shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

% BLAcellssoc = find(allforcsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCSOC(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCsocBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCsocBLA(AUCsocBLA(find(testFORCsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCsocBLA(WTBLAcellssoc);

newtestFORCsocBLA = allIDFORCsocBLAcells;
newtestFORCsocBLA(badBLAINF) = [];



for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

% BLAcellssoc = find(allforcsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCOBJ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCsocBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCsocBLA(AUCsocBLA(find(testFORCsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCsocBLA(WTBLAcellssoc);

newtestFORCsocBLA = allIDFORCsocBLAcells;
newtestFORCsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

% BLAcellssoc = find(allforcsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCSOC(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCobjBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCobjBLA(AUCobjBLA(find(testFORCobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCobjBLA(WTBLAcellssoc);

newtestFORCobjBLA = allIDFORCobjBLAcells;
newtestFORCobjBLA(badBLAINF) = [];



for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

% BLAcellssoc = find(allforcsocBLAwidths<400);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%WTBLAcellssoc = find(ismember(WTBLAcellssoc,BLAcellssoc)==1);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

% WTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(WTBLAcellssoc);



ALLBLAWTFORCSOCZ = ALLBLAFORCOBJ(WTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAWTFORCSOCZ = ALLBLAWTFORCSOCZ;
newALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAWTnoinf = newmouseBLAWT;
% newmouseBLAWTnoinf(badBLAINF) = [];

allgoodtestFORCobjBLA = zeros(size(AUCBLAWTallFORC,1),1);
allgoodtestFORCobjBLA(AUCobjBLA(find(testFORCobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCobjBLA(WTBLAcellssoc);

newtestFORCobjBLA = allIDFORCobjBLAcells;
newtestFORCobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAWTFORCSOCZ,1)
    newALLBLAWTFORCSOCZSM(a,:) = smoothdata(newALLBLAWTFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1 & newtestFORCobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:)),nanstd(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:))/(sqrt(size(newALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4 & newtestFORCobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
