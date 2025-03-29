%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1forcALL == "KO");

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCSOCZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOsocS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOsocS1(AUCsocKOS1(find(testFORCKOsocS1 == 1))) = 1;
allIDFORCsocS1cells = allgoodtestFORCKOsocS1(KOS1cellssoc-525);

newtestFORCKOsocS1 = allIDFORCsocS1cells;
newtestFORCKOsocS1(badS1INF) = [];

newS1mouseIDKO = S1mouseIDKO(KOS1cellssoc-525);
newS1mouseIDKO(badS1INF) = [];

clear newALLS1KOFORCSOCZSM
for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

figure(144);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);


%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1forcALL == "KO");

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCOBJZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOsocS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOsocS1(AUCsocKOS1(find(testFORCKOsocS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOsocS1(KOS1cellssoc-525);

newtestFORCKOsocS1 = allIDFORCobjS1cells;
newtestFORCKOsocS1(badS1INF) = [];


clear newALLS1KOFORCSOCZSM
for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(144);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1forcALL == "KO");

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCSOCZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOobjS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOobjS1(AUCobjKOS1(find(testFORCKOobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOobjS1(KOS1cellssoc-525);

newtestFORCKOobjS1 = allIDFORCobjS1cells;
newtestFORCKOobjS1(badS1INF) = [];

newS1mouseIDKO = S1mouseIDKO(KOS1cellssoc-525);
newS1mouseIDKO(badS1INF) = [];

clear newALLS1KOFORCSOCZSM
for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);


figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1forcALL == "KO");

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCOBJZ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOobjS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOobjS1(AUCobjKOS1(find(testFORCKOobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOobjS1(KOS1cellssoc-525);

newtestFORCKOobjS1 = allIDFORCobjS1cells;
newtestFORCKOobjS1(badS1INF) = [];


clear newALLS1KOFORCSOCZSM
for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(123); shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

KOS1cellssoc = find(groupS1forcALL == "KO");

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCSOC(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOsocS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOsocS1(AUCsocKOS1(find(testFORCKOsocS1 == 1))) = 1;
allIDFORCsocS1cells = allgoodtestFORCKOsocS1(KOS1cellssoc-525);

newtestFORCKOsocS1 = allIDFORCsocS1cells;
newtestFORCKOsocS1(badS1INF) = [];



for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1)))); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

% KOS1cellssoc = find(groupS1forcALL == "KO" & allforsocS1widths>=400);

KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCOBJ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOsocS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOsocS1(AUCsocKOS1(find(testFORCKOsocS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOsocS1(KOS1cellssoc-525);

newtestFORCKOsocS1 = allIDFORCobjS1cells;
newtestFORCKOsocS1(badS1INF) = [];



for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(25); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOsocS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOsocS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

% KOS1cellssoc = find(groupS1forcALL == "KO" & allforsocS1widths>=400);

KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCSOC(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOobjS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOobjS1(AUCobjKOS1(find(testFORCKOobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOobjS1(KOS1cellssoc-525);

newtestFORCKOobjS1 = allIDFORCobjS1cells;
newtestFORCKOobjS1(badS1INF) = [];



for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

S1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%KOS1cellssoc = find(ismember(KOS1cellssoc,S1cellssoc)==1);

% KOS1cellssoc = find(groupS1forcALL == "KO" & allforsocS1widths>=400);

% KOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(KOS1cellssoc-525);



ALLS1KOFORCSOCZ = ALLS1FORCOBJ(KOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(ALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1KOFORCSOCZ = ALLS1KOFORCSOCZ;
newALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1KOnoinf = newmouseS1KO;
% newmouseS1KOnoinf(badS1INF) = [];

allgoodtestFORCKOobjS1 = zeros(size(AUCS1KOallFORC,1),1);
allgoodtestFORCKOobjS1(AUCobjKOS1(find(testFORCKOobjS1 == 1))) = 1;
allIDFORCobjS1cells = allgoodtestFORCKOobjS1(KOS1cellssoc-525);

newtestFORCKOobjS1 = allIDFORCobjS1cells;
newtestFORCKOobjS1(badS1INF) = [];



for a = 1:size(newALLS1KOFORCSOCZ,1)
    newALLS1KOFORCSOCZSM(a,:) = smoothdata(newALLS1KOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(26); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==1 & newtestFORCKOobjS1 == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==2 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==3 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==4 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:)),nanstd(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:))/(sqrt(size(newALLS1KOFORCSOCZSM(find(newKOS1socidx==5 & newtestFORCKOobjS1 == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%%

%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRforcALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

% KOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-265);



ALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOFORCSOCZ = ALLSTRKOFORCSOCZ;
newALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestFORCKOsocSTR = zeros(size(AUCSTRKOallFORC,1),1);
allgoodtestFORCKOsocSTR(AUCsocKOSTR(find(testFORCKOsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCKOsocSTR(KOSTRcellssoc-265);

newtestFORCKOsocSTR = allIDFORCsocSTRcells;
newtestFORCKOsocSTR(badSTRINF) = [];

newSTRmouseIDKO = STRmouseIDKO(KOSTRcellssoc-265);
newSTRmouseIDKO(badSTRINF) = [];

clear newALLSTRKOFORCSOCZSM
for a = 1:size(newALLSTRKOFORCSOCZ,1)
    newALLSTRKOFORCSOCZSM(a,:) = smoothdata(newALLSTRKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
% subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
% subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);
% subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);


figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRforcALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

% KOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-265);



ALLSTRKOFORCSOCZ = ALLSTRFORCOBJZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOFORCSOCZ = ALLSTRKOFORCSOCZ;
newALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestFORCKOsocSTR = zeros(size(AUCSTRKOallFORC,1),1);
allgoodtestFORCKOsocSTR(AUCsocKOSTR(find(testFORCKOsocSTR == 1))) = 1;
allIDFORCsocSTRcells = allgoodtestFORCKOsocSTR(KOSTRcellssoc-265);

newtestFORCKOsocSTR = allIDFORCsocSTRcells;
newtestFORCKOsocSTR(badSTRINF) = [];

clear newALLSTRKOFORCSOCZSM
for a = 1:size(newALLSTRKOFORCSOCZ,1)
    newALLSTRKOFORCSOCZSM(a,:) = smoothdata(newALLSTRKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(30); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOsocSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
% subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
% subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
% subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


figure(300); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOsocSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);


%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRforcALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

% KOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-265);



ALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOFORCSOCZ = ALLSTRKOFORCSOCZ;
newALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestFORCKOobjSTR = zeros(size(AUCSTRKOallFORC,1),1);
allgoodtestFORCKOobjSTR(AUCobjKOSTR(find(testFORCKOobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCKOobjSTR(KOSTRcellssoc-265);

newtestFORCKOobjSTR = allIDFORCobjSTRcells;
newtestFORCKOobjSTR(badSTRINF) = [];

newSTRmouseIDKO = STRmouseIDKO(KOSTRcellssoc-265);
newSTRmouseIDKO(badSTRINF) = [];

clear newALLSTRKOFORCSOCZSM
for a = 1:size(newALLSTRKOFORCSOCZ,1)
    newALLSTRKOFORCSOCZSM(a,:) = smoothdata(newALLSTRKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:),1)))); xlim([-1.85 6.85]);

%%
%%%% Smoothened  Cells Firing


KOSTRcellssoc = find(groupSTRforcALL == "KO");

%KOSTRcellssoc = find(ismember(KOSTRcellssoc,STRcellssoc)==1);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

% KOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(KOSTRcellssoc-265);



ALLSTRKOFORCSOCZ = ALLSTRFORCOBJZ(KOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRKOFORCSOCZ = ALLSTRKOFORCSOCZ;
newALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRKOnoinf = newmouseSTRKO;
% newmouseSTRKOnoinf(badSTRINF) = [];

allgoodtestFORCKOobjSTR = zeros(size(AUCSTRKOallFORC,1),1);
allgoodtestFORCKOobjSTR(AUCobjKOSTR(find(testFORCKOobjSTR == 1))) = 1;
allIDFORCobjSTRcells = allgoodtestFORCKOobjSTR(KOSTRcellssoc-265);

newtestFORCKOobjSTR = allIDFORCobjSTRcells;
newtestFORCKOobjSTR(badSTRINF) = [];

clear newALLSTRKOFORCSOCZSM
for a = 1:size(newALLSTRKOFORCSOCZ,1)
    newALLSTRKOFORCSOCZSM(a,:) = smoothdata(newALLSTRKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(31); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1 & newtestFORCKOobjSTR == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

figure(310); shadedErrorBar(-2:0.05:7,nanmean(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:)),nanstd(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:))/(sqrt(size(newALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4 & newtestFORCKOobjSTR == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOsocBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOsocBLA(AUCsocKOBLA(find(testFORCKOsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCKOsocBLA(KOBLAcellssoc-240);

newtestFORCKOsocBLA = allIDFORCsocBLAcells;
newtestFORCKOsocBLA(badBLAINF) = [];

newBLAmouseIDKO = BLAmouseIDKO(KOBLAcellssoc-240);
newBLAmouseIDKO(badBLAINF) = [];

for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCOBJZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOsocBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOsocBLA(AUCsocKOBLA(find(testFORCKOsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCKOsocBLA(KOBLAcellssoc-240);

newtestFORCKOsocBLA = allIDFORCsocBLAcells;
newtestFORCKOsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(40); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOobjBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOobjBLA(AUCobjKOBLA(find(testFORCKOobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCKOobjBLA(KOBLAcellssoc-240);

newtestFORCKOobjBLA = allIDFORCobjBLAcells;
newtestFORCKOobjBLA(badBLAINF) = [];

newBLAmouseIDKO = BLAmouseIDKO(KOBLAcellssoc-240);
newBLAmouseIDKO(badBLAINF) = [];

for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCOBJZ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOobjBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOobjBLA(AUCobjKOBLA(find(testFORCKOobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCKOobjBLA(KOBLAcellssoc-240);

newtestFORCKOobjBLA = allIDFORCobjBLAcells;
newtestFORCKOobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(41); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCSOC(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOsocBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOsocBLA(AUCsocKOBLA(find(testFORCKOsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCKOsocBLA(KOBLAcellssoc-240);

newtestFORCKOsocBLA = allIDFORCsocBLAcells;
newtestFORCKOsocBLA(badBLAINF) = [];



for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCOBJ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOsocBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOsocBLA(AUCsocKOBLA(find(testFORCKOsocBLA == 1))) = 1;
allIDFORCsocBLAcells = allgoodtestFORCKOsocBLA(KOBLAcellssoc-240);

newtestFORCKOsocBLA = allIDFORCsocBLAcells;
newtestFORCKOsocBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(42); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOsocBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOsocBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);

%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCSOC(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOobjBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOobjBLA(AUCobjKOBLA(find(testFORCKOobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCKOobjBLA(KOBLAcellssoc-240);

newtestFORCKOobjBLA = allIDFORCobjBLAcells;
newtestFORCKOobjBLA(badBLAINF) = [];



for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:),1)))); xlim([-1.85 6.85]);

%%
%% Smoothened  Cells Firing

BLAcellssoc = find(allforsocBLAwidths<400);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%KOBLAcellssoc = find(ismember(KOBLAcellssoc,BLAcellssoc)==1);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

% KOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLAKO(KOBLAcellssoc-240);



ALLBLAKOFORCSOCZ = ALLBLAFORCOBJ(KOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(ALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
newALLBLAKOFORCSOCZ = ALLBLAKOFORCSOCZ;
newALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAKOnoinf = newmouseBLAKO;
% newmouseBLAKOnoinf(badBLAINF) = [];

allgoodtestFORCKOobjBLA = zeros(size(AUCBLAKOallFORC,1),1);
allgoodtestFORCKOobjBLA(AUCobjKOBLA(find(testFORCKOobjBLA == 1))) = 1;
allIDFORCobjBLAcells = allgoodtestFORCKOobjBLA(KOBLAcellssoc-240);

newtestFORCKOobjBLA = allIDFORCobjBLAcells;
newtestFORCKOobjBLA(badBLAINF) = [];


for a = 1:size(newALLBLAKOFORCSOCZ,1)
    newALLBLAKOFORCSOCZSM(a,:) = smoothdata(newALLBLAKOFORCSOCZ(a,:),'movmean',5);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(44); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1 & newtestFORCKOobjBLA == 1),:),1))), 'lineprops', 'm'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:)),nanstd(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:))/(sqrt(size(newALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4 & newtestFORCKOobjBLA == 1),:),1))),'lineprops', 'm'); xlim([-1.85 6.85]);
