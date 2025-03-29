%% Smoothened RS Cells Firing

RSS1cellssoc = find(allforsocS1widths>=400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allforsocS1widths>=400 & groupS1forcALL == "WT");


% RSWTS1cellssoc = findsav(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(RSWTS1cellssoc);

% 
% RSYWT = Y(RSWTS1cellssoc,:);
% figure;
% plot(RSYWT(WTS1socidx==1,1),RSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
% hold on
% plot(RSYWT(WTS1socidx==2,1),RSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
% hold on; plot(RSYWT(WTS1socidx==3,1),RSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
% hold on
% plot(RSYWT(WTS1socidx==4,1),RSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
% hold on
% plot(RSYWT(WTS1socidx==5,1),RSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)
% % 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
newmouseS1RSWT = S1mouseIDWT(RSWTS1cellssoc);

RSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(RSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTFORCSOCZ = RSALLS1WTFORCSOCZ;
RSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
newmouseS1RSWTnoinf = newmouseS1RSWT;
newmouseS1RSWTnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1WTFORCSOCZ,1)
    RSnewALLS1WTFORCSOCZSM(a,:) = smoothdata(RSnewALLS1WTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-1.85 6.85]);

%%
RSS1cellsobj = find(allforobjS1widths>=400);

WTS1cellsobj = find(groupS1forcALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allforobjS1widths>=400 & groupS1forcALL == "WT");

% RSWTS1cellsobj = find(groupS1forcALL == "WT");


WTS1objidx = idxS1WT(RSWTS1cellsobj);


RSALLS1WTFORCOBJZ = ALLS1FORCOBJZ(RSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
newmouseS1RSWT = S1mouseIDWT(RSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTFORCOBJZ = RSALLS1WTFORCOBJZ;
RSnewALLS1WTFORCOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
newmouseS1RSWTnoinf = newmouseS1RSWT;
newmouseS1RSWTnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1WTFORCOBJZ,1)
    RSnewALLS1WTFORCOBJZSM(a,:) = smoothdata(RSnewALLS1WTFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 1]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-2.5 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 4]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 6])
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 25]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");



%% Smoothened FS Cells Firing

FSS1cellssoc = find(allforsocS1widths<400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allforsocS1widths<400 & groupS1forcALL == "WT");

% FSWTS1cellssoc = find(groupS1forcALL == "WT");


WTS1socidx = idxS1WT(FSWTS1cellssoc);


FSYWT = Y(FSWTS1cellssoc,:);
figure;
plot(FSYWT(WTS1socidx==1,1),FSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==2,1),FSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(WTS1socidx==3,1),FSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==4,1),FSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==5,1),FSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellssoc);

FSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(FSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTFORCSOCZ = FSALLS1WTFORCSOCZ;
FSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];



for a = 1:size(FSnewALLS1WTFORCSOCZ,1)
    FSnewALLS1WTFORCSOCZSM(a,:) = smoothdata(FSnewALLS1WTFORCSOCZ(a,:),'movmean',5);
end

WTFSS1socialMODInd = allforcsocialS1MODInd(FSWTS1cellssoc);
WTFSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(FSWTS1cellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-1.85 6.85]);


FSS1cellsobj = find(allforobjS1widths<400);

WTS1cellsobj = find(groupS1forcALL == "WT");

%FSWTS1cellsobj = find(ismember(WTS1cellsobj,FSS1cellsobj)==1);

FSWTS1cellsobj = find(allforobjS1widths<400 & groupS1forcALL == "WT");

% FSWTS1cellsobj = find(groupS1forcALL == "WT");


WTS1objidx = idxS1WT(FSWTS1cellsobj);


FSALLS1WTFORCOBJZ = ALLS1FORCOBJZ(FSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTFORCOBJZ = FSALLS1WTFORCOBJZ;
FSnewALLS1WTFORCOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];


for a = 1:size(FSnewALLS1WTFORCOBJZ,1)
    FSnewALLS1WTFORCOBJZSM(a,:) = smoothdata(FSnewALLS1WTFORCOBJZ(a,:),'movmean',5);
end

WTFSS1objMODInd = allforcobjS1MODInd(FSWTS1cellsobj);
WTFSS1objMODIndSTIM = allforcobjS1MODIndSTIM(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(FSWTS1cellsobj);
WTFSS1objMODIndPLAT = allforcobjS1MODIndPLAT(FSWTS1cellsobj);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:)),nanstd(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:)),nanstd(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-3 1]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:)),nanstd(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 2.5]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:)),nanstd(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:)),nanstd(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(FSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 25]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");

%%
%
%
%
%
%
%%
%
%
%
%
%
%%
RSSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

RSWTSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250 & groupSTRforcALL == "WT");

% RSWTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(RSWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellssoc);

RSALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(RSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCSOCZ = RSALLSTRWTFORCSOCZ;
RSnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRWTFORCSOCZ,1)
    RSnewALLSTRWTFORCSOCZSM(a,:) = smoothdata(RSnewALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRforcALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250 & groupSTRforcALL == "WT");

% RSWTSTRcellsobj = find(groupSTRforcALL == "WT");


WTSTRobjidx = idxSTR(RSWTSTRcellsobj);


RSALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(RSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCOBJZ = RSALLSTRWTFORCOBJZ;
RSnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRWTFORCOBJZ,1)
    RSnewALLSTRWTFORCOBJZSM(a,:) = smoothdata(RSnewALLSTRWTFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 4]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 10]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 20]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 80]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");



%%
%
%
%
%% FS STR CELLS

%%
FSSTRcellssoc = find(allforsocSTRwidths<475);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%FSWTSTRcellssoc = find(ismember(WTSTRcellssoc,FSSTRcellssoc)==1);

FSWTSTRcellssoc = find(allforsocSTRwidths<475 & groupSTRforcALL == "WT");

% FSWTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTR(FSWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellssoc);

FSALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(FSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTFORCSOCZ = FSALLSTRWTFORCSOCZ;
FSnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];

WTFSSTRsocialMODInd = allforcsocialSTRMODInd(FSWTSTRcellssoc);

WTFSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(FSWTSTRcellssoc);


for a = 1:size(FSnewALLSTRWTFORCSOCZ,1)
    FSnewALLSTRWTFORCSOCZSM(a,:) = smoothdata(FSnewALLSTRWTFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


FSSTRcellsobj = find(allforsocSTRwidths<475);

WTSTRcellsobj = find(groupSTRforcALL == "WT");

%FSWTSTRcellsobj = find(ismember(WTSTRcellsobj,FSSTRcellsobj)==1);

FSWTSTRcellsobj = find(allforsocSTRwidths<475 & groupSTRforcALL == "WT");

% FSWTSTRcellsobj = find(groupSTRforcALL == "WT");


WTSTRobjidx = idxSTR(FSWTSTRcellsobj);


FSALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(FSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTFORCOBJZ = FSALLSTRWTFORCOBJZ;
FSnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];


for a = 1:size(FSnewALLSTRWTFORCOBJZ,1)
    FSnewALLSTRWTFORCOBJZSM(a,:) = smoothdata(FSnewALLSTRWTFORCOBJZ(a,:),'movmean',5);
end

WTFSSTRobjMODInd = allforcobjSTRMODInd(FSWTSTRcellsobj);

WTFSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(FSWTSTRcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 1.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 2]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 5]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 15]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");

%%%% ALL STR CELLS

%%

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%ALLWTSTRcellssoc = find(ismember(WTSTRcellssoc,ALLSTRcellssoc)==1);

ALLWTSTRcellssoc = find(groupSTRforcALL == "WT");

% ALLWTSTRcellssoc = find(groupSTRforcALL == "WT");


WTSTRsocidx = idxSTRWT(ALLWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
newmouseSTRALLWT = STRmouseIDWT(ALLWTSTRcellssoc);

ALLALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(ALLWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRWTFORCSOCZ = ALLALLSTRWTFORCSOCZ;
ALLnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
newmouseSTRALLWTnoinf = newmouseSTRALLWT;
newmouseSTRALLWTnoinf(badSTRINF) = [];

WTSTRsocialMODInd = allforcsocialSTRMODInd(WTSTRcellssoc);

WTSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(WTSTRcellssoc);
WTSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(WTSTRcellssoc);
WTSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(WTSTRcellssoc);

WTSTRforcAUCSTIM = allforcSTRAUCSTIM(WTSTRcellssoc);
WTSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(WTSTRcellssoc);
WTSTRforcAUCPLAT = allforcSTRAUCPLAT(WTSTRcellssoc);



for a = 1:size(ALLnewALLSTRWTFORCSOCZ,1)
    ALLnewALLSTRWTFORCSOCZSM(a,:) = smoothdata(ALLnewALLSTRWTFORCSOCZ(a,:),'movmean',5);
end


%%
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(ALLnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);
%%


WTSTRcellsobj = find(groupSTRforcALL == "WT");

%ALLWTSTRcellsobj = find(ismember(WTSTRcellsobj,ALLSTRcellsobj)==1);

ALLWTSTRcellsobj = find(groupSTRforcALL == "WT");

% ALLWTSTRcellsobj = find(groupSTRforcALL == "WT");


WTSTRobjidx = idxSTRWT(ALLWTSTRcellsobj);


ALLALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(ALLWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
newmouseSTRALLWT = STRmouseIDWT(ALLWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRWTFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRWTFORCOBJZ = ALLALLSTRWTFORCOBJZ;
ALLnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
newmouseSTRALLWTnoinf = newmouseSTRALLWT;
newmouseSTRALLWTnoinf(badSTRINF) = [];

WTSTRobjMODInd = allforcobjSTRMODInd(WTSTRcellsobj);

WTSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(WTSTRcellsobj);
WTSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(WTSTRcellsobj);
WTSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(WTSTRcellsobj);

WTSTRforcAUCSTIM = allforcSTRAUCSTIM(WTSTRcellsobj);
WTSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(WTSTRcellsobj);
WTSTRforcAUCPLAT = allforcSTRAUCPLAT(WTSTRcellsobj);



for a = 1:size(ALLnewALLSTRWTFORCOBJZ,1)
    ALLnewALLSTRWTFORCOBJZSM(a,:) = smoothdata(ALLnewALLSTRWTFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 3]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 30]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(ALLnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 50]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");


%% BLA



WTBLAcellssoc = find(groupBLAforcALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAforcALL == "WT");

WTBLAsocidx = idxBLAWT(RSWTBLAcellssoc);



RSALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
newmouseBLARSWT = BLAmouseIDWT(RSWTBLAcellssoc);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCSOCZ = RSALLBLAWTFORCSOCZ;
RSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
newmouseBLARSWTnoinf = newmouseBLARSWT;
newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTFORCSOCZ,1)
    RSnewALLBLAWTFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAWTFORCSOCZ(a,:),'movmean',5);
end

WTBLAsocialMODInd = allforcsocialBLAMODInd(WTBLAcellssoc);

WTBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(WTBLAcellssoc);
WTBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(WTBLAcellssoc);
WTBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(WTBLAcellssoc);

WTBLAforcAUCSTIM = allforcBLAAUCSTIM(WTBLAcellssoc);
WTBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(WTBLAcellssoc);
WTBLAforcAUCPLAT = allforcBLAAUCPLAT(WTBLAcellssoc);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]); hold on;
%%


WTBLAcellsobj = find(groupBLAforcALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAforcALL == "WT");

WTBLAobjidx = idxBLAWT(RSWTBLAcellsobj);




RSALLBLAWTFORCOBJZ = ALLBLAFORCOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
newmouseBLARSWT = BLAmouseIDWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCOBJZ = RSALLBLAWTFORCOBJZ;
RSnewALLBLAWTFORCOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
newmouseBLARSWTnoinf = newmouseBLARSWT;
newmouseBLARSWTnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAWTFORCOBJZ,1)
    RSnewALLBLAWTFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAWTFORCOBJZ(a,:),'movmean',5);
end

WTBLAobjMODInd = allforcobjBLAMODInd(WTBLAcellsobj);

WTBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(WTBLAcellsobj);
WTBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(WTBLAcellsobj);
WTBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(WTBLAcellsobj);

WTBLAforcAUCSTIM = allforcBLAAUCSTIM(WTBLAcellsobj);
WTBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(WTBLAcellsobj);
WTBLAforcAUCPLAT = allforcBLAAUCPLAT(WTBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 5]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 4]); hold on;
xlabel("Time (s)")
legend("Forc Social", "Forc Object");


%%
RSBLAcellssoc = find(allforsocBLAwidths>550 & allforcsocialBLASpont<6);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(allforsocBLAwidths>550 & allforcsocialBLASpont<6 & groupBLAforcALL == "WT");

% RSWTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLAWT(RSWTBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);

RSALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(RSWTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCSOCZ = RSALLBLAWTFORCSOCZ;
RSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];



for a = 1:size(RSnewALLBLAWTFORCSOCZ,1)
    RSnewALLBLAWTFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAWTFORCSOCZ(a,:),'movmean',5);
end

WTRSBLAsocialMODInd = allforcsocialBLAMODInd(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(RSWTBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);


RSBLAcellsobj = find(allforobjBLAwidths>550 & allforcobjBLASpont<6);

WTBLAcellsobj = find(groupBLAforcALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(allforobjBLAwidths>550 & allforcobjBLASpont<6 & groupBLAforcALL == "WT");

% RSWTBLAcellsobj = find(groupBLAforcALL == "WT");


WTBLAobjidx = idxBLA(RSWTBLAcellsobj);


RSALLBLAWTFORCOBJZ = ALLBLAFORCOBJZ(RSWTBLAcellsobj,:);



% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCOBJZ = RSALLBLAWTFORCOBJZ;
RSnewALLBLAWTFORCOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTFORCOBJZ,1)
    RSnewALLBLAWTFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAWTFORCOBJZ(a,:),'movmean',5);
end

WTRSBLAobjMODInd = allforcobjBLAMODInd(RSWTBLAcellsobj);
WTRSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(RSWTBLAcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 4]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");



%%
%
%
%
%% FS BLA CELLS

%%
FSBLAcellssoc = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6);

WTBLAcellssoc = find(groupBLAforcALL == "WT");

%FSWTBLAcellssoc = find(ismember(WTBLAcellssoc,FSBLAcellssoc)==1);

FSWTBLAcellssoc = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6 & groupBLAforcALL == "WT");

% FSWTBLAcellssoc = find(groupBLAforcALL == "WT");


WTBLAsocidx = idxBLA(FSWTBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLAFSWT = newmouseBLAWT(FSWTBLAcellssoc);

FSALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(FSWTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTFORCSOCZ = FSALLBLAWTFORCSOCZ;
FSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAFSWTnoinf = newmouseBLAFSWT;
% newmouseBLAFSWTnoinf(badBLAINF) = [];



for a = 1:size(FSnewALLBLAWTFORCSOCZ,1)
    FSnewALLBLAWTFORCSOCZSM(a,:) = smoothdata(FSnewALLBLAWTFORCSOCZ(a,:),'movmean',5);
end

WTFSBLAsocialMODInd = allforcsocialBLAMODInd(FSWTBLAcellssoc);
WTFSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(FSWTBLAcellssoc);
WTFSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(FSWTBLAcellssoc);
WTFSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(FSWTBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);


FSBLAcellsobj = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6);

WTBLAcellsobj = find(groupBLAforcALL == "WT");

%FSWTBLAcellsobj = find(ismember(WTBLAcellsobj,FSBLAcellsobj)==1);

FSWTBLAcellsobj = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6 & groupBLAforcALL == "WT");

% FSWTBLAcellsobj = find(groupBLAforcALL == "WT");


WTBLAobjidx = idxBLA(FSWTBLAcellsobj);


FSALLBLAWTFORCOBJZ = ALLBLAFORCOBJZ(FSWTBLAcellsobj,:);



% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLAFSWT = newmouseBLAWT(FSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTFORCOBJZ = FSALLBLAWTFORCOBJZ;
FSnewALLBLAWTFORCOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLAFSWTnoinf = newmouseBLAFSWT;
% newmouseBLAFSWTnoinf(badBLAINF) = [];


for a = 1:size(FSnewALLBLAWTFORCOBJZ,1)
    FSnewALLBLAWTFORCOBJZSM(a,:) = smoothdata(FSnewALLBLAWTFORCOBJZ(a,:),'movmean',5);
end

WTFSBLAobjMODInd = allforcobjBLAMODInd(FSWTBLAcellsobj);
WTFSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(FSWTBLAcellsobj);
WTFSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(FSWTBLAcellsobj);
WTFSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(FSWTBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-3 3.5]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-3.5 1]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 8]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(FSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 8]);xlabel("Time (s)")
legend("Forc Social", "Forc Object");


