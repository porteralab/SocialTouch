%% Smoothened RS Cells Firing

RSS1cellssoc = find(allvolsocS1widths>=400);

WTS1cellssoc = find(groupS1volALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allvolsocS1widths>=400 & groupS1volALL == "WT");

% RSWTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1WT(RSWTS1cellssoc);


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
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellssoc);

RSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(RSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLSOCZ = RSALLS1WTVOLSOCZ;
RSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1WTVOLSOCZ,1)
    RSnewALLS1WTVOLSOCZSM(a,:) = smoothdata(RSnewALLS1WTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-1.85 6.85]);


RSS1cellsobj = find(allvolobjS1widths>=400);

WTS1cellsobj = find(groupS1volALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allvolobjS1widths>=400 & groupS1volALL == "WT");

% RSWTS1cellsobj = find(groupS1volALL == "WT");


WTS1objidx = idxS1WT(RSWTS1cellsobj);


RSALLS1WTVOLOBJZ = ALLS1VOLOBJZ(RSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLOBJZ = RSALLS1WTVOLOBJZ;
RSnewALLS1WTVOLOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1WTVOLOBJZ,1)
    RSnewALLS1WTVOLOBJZSM(a,:) = smoothdata(RSnewALLS1WTVOLOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]);  ylim([-2 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 2]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 6]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");



%% Smoothened FS Cells Firing

FSS1cellssoc = find(allvolsocS1widths<400);

WTS1cellssoc = find(groupS1volALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allvolsocS1widths<400 & groupS1volALL == "WT");

% FSWTS1cellssoc = find(groupS1volALL == "WT");


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

FSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(FSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTVOLSOCZ = FSALLS1WTVOLSOCZ;
FSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];



for a = 1:size(FSnewALLS1WTVOLSOCZ,1)
    FSnewALLS1WTVOLSOCZSM(a,:) = smoothdata(FSnewALLS1WTVOLSOCZ(a,:),'movmean',5);
end

WTFSS1socialMODInd = allvolsocialS1MODInd(FSWTS1cellssoc);
WTFSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(FSWTS1cellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-1.85 6.85]); ylim([-2 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 2]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 4]);


FSS1cellsobj = find(allvolobjS1widths<400);

WTS1cellsobj = find(groupS1volALL == "WT");

%FSWTS1cellsobj = find(ismember(WTS1cellsobj,FSS1cellsobj)==1);

FSWTS1cellsobj = find(allvolobjS1widths<400 & groupS1volALL == "WT");

% FSWTS1cellsobj = find(groupS1volALL == "WT");


WTS1objidx = idxS1WT(FSWTS1cellsobj);


FSALLS1WTVOLOBJZ = ALLS1VOLOBJZ(FSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTVOLOBJZ = FSALLS1WTVOLOBJZ;
FSnewALLS1WTVOLOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];


for a = 1:size(FSnewALLS1WTVOLOBJZ,1)
    FSnewALLS1WTVOLOBJZSM(a,:) = smoothdata(FSnewALLS1WTVOLOBJZ(a,:),'movmean',5);
end

WTFSS1objMODInd = allvolobjS1MODInd(FSWTS1cellsobj);
WTFSS1objMODIndSTIM = allvolobjS1MODIndSTIM(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(FSWTS1cellsobj);
WTFSS1objMODIndPLAT = allvolobjS1MODIndPLAT(FSWTS1cellsobj);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:)),nanstd(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:)),nanstd(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-2 1]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:)),nanstd(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 2]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:)),nanstd(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 2.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:)),nanstd(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(FSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 5]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");

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
RSSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

RSWTSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250 & groupSTRvolALL == "WT");

% RSWTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTR(RSWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellssoc);

RSALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(RSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLSOCZ = RSALLSTRWTVOLSOCZ;
RSnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRWTVOLSOCZ,1)
    RSnewALLSTRWTVOLSOCZSM(a,:) = smoothdata(RSnewALLSTRWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRvolALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250 & groupSTRvolALL == "WT");

% RSWTSTRcellsobj = find(groupSTRvolALL == "WT");


WTSTRobjidx = idxSTR(RSWTSTRcellsobj);


RSALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(RSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLOBJZ = RSALLSTRWTVOLOBJZ;
RSnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRWTVOLOBJZ,1)
    RSnewALLSTRWTVOLOBJZSM(a,:) = smoothdata(RSnewALLSTRWTVOLOBJZ(a,:),'movmean',5);
end

WTRSSTRsocialMODInd = allvolsocialSTRMODInd(RSWTSTRcellssoc);

WTRSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(RSWTSTRcellssoc);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 2.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 10]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 20]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");





%%
%
%
%
%% FS STR CELLS

%%
FSSTRcellssoc = find(allvolsocSTRwidths<475);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%FSWTSTRcellssoc = find(ismember(WTSTRcellssoc,FSSTRcellssoc)==1);

FSWTSTRcellssoc = find(allvolsocSTRwidths<475 & groupSTRvolALL == "WT");

% FSWTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTR(FSWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellssoc);

FSALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(FSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTVOLSOCZ = FSALLSTRWTVOLSOCZ;
FSnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];

WTFSSTRsocialMODInd = allvolsocialSTRMODInd(FSWTSTRcellssoc);

WTFSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(FSWTSTRcellssoc);


for a = 1:size(FSnewALLSTRWTVOLSOCZ,1)
    FSnewALLSTRWTVOLSOCZSM(a,:) = smoothdata(FSnewALLSTRWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]);


FSSTRcellsobj = find(allvolsocSTRwidths<475);

WTSTRcellsobj = find(groupSTRvolALL == "WT");

%FSWTSTRcellsobj = find(ismember(WTSTRcellsobj,FSSTRcellsobj)==1);

FSWTSTRcellsobj = find(allvolsocSTRwidths<475 & groupSTRvolALL == "WT");

% FSWTSTRcellsobj = find(groupSTRvolALL == "WT");


WTSTRobjidx = idxSTR(FSWTSTRcellsobj);


FSALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(FSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTVOLOBJZ = FSALLSTRWTVOLOBJZ;
FSnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];


for a = 1:size(FSnewALLSTRWTVOLOBJZ,1)
    FSnewALLSTRWTVOLOBJZSM(a,:) = smoothdata(FSnewALLSTRWTVOLOBJZ(a,:),'movmean',5);
end

WTFSSTRobjMODInd = allvolobjSTRMODInd(FSWTSTRcellsobj);

WTFSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(FSWTSTRcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 2]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 3]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 6]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 6]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");

%%%% ALL STR CELLS

%%

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%ALLWTSTRcellssoc = find(ismember(WTSTRcellssoc,ALLSTRcellssoc)==1);

ALLWTSTRcellssoc = find(groupSTRvolALL == "WT");

% ALLWTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTRWT(ALLWTSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRALLWT = newmouseSTRWT(ALLWTSTRcellssoc);

ALLALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(ALLWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRWTVOLSOCZ = ALLALLSTRWTVOLSOCZ;
ALLnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRALLWTnoinf = newmouseSTRALLWT;
% newmouseSTRALLWTnoinf(badSTRINF) = [];

WTSTRsocialMODInd = allvolsocialSTRMODInd(WTSTRcellssoc);

WTSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(WTSTRcellssoc);
WTSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(WTSTRcellssoc);
WTSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(WTSTRcellssoc);

WTSTRvolAUCSTIM = allvolSTRAUCSTIM(WTSTRcellssoc);
WTSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(WTSTRcellssoc);
WTSTRvolAUCPLAT = allvolSTRAUCPLAT(WTSTRcellssoc);



for a = 1:size(ALLnewALLSTRWTVOLSOCZ,1)
    ALLnewALLSTRWTVOLSOCZSM(a,:) = smoothdata(ALLnewALLSTRWTVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(ALLnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);



WTSTRcellsobj = find(groupSTRvolALL == "WT");

%ALLWTSTRcellsobj = find(ismember(WTSTRcellsobj,ALLSTRcellsobj)==1);

ALLWTSTRcellsobj = find(groupSTRvolALL == "WT");

% ALLWTSTRcellsobj = find(groupSTRvolALL == "WT");


WTSTRobjidx = idxSTRWT(ALLWTSTRcellsobj);


ALLALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(ALLWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRALLWT = newmouseSTRWT(ALLWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRWTVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRWTVOLOBJZ = ALLALLSTRWTVOLOBJZ;
ALLnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRALLWTnoinf = newmouseSTRALLWT;
% newmouseSTRALLWTnoinf(badSTRINF) = [];

WTSTRobjMODInd = allvolobjSTRMODInd(WTSTRcellsobj);

WTSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(WTSTRcellsobj);
WTSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(WTSTRcellsobj);
WTSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(WTSTRcellsobj);

WTSTRvolAUCSTIM = allvolSTRAUCSTIM(WTSTRcellsobj);
WTSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(WTSTRcellsobj);
WTSTRvolAUCPLAT = allvolSTRAUCPLAT(WTSTRcellsobj);



for a = 1:size(ALLnewALLSTRWTVOLOBJZ,1)
    ALLnewALLSTRWTVOLOBJZSM(a,:) = smoothdata(ALLnewALLSTRWTVOLOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 2]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 10]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 12]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(ALLnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 10]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");


%% BLA



WTBLAcellssoc = find(groupBLAvolALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAvolALL == "WT");

WTBLAsocidx = idxBLAWT(RSWTBLAcellssoc);



RSALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLSOCZ = RSALLBLAWTVOLSOCZ;
RSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTVOLSOCZ,1)
    RSnewALLBLAWTVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAWTVOLSOCZ(a,:),'movmean',5);
end

WTBLAsocialMODInd = allvolsocialBLAMODInd(WTBLAcellssoc);

WTBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(WTBLAcellssoc);
WTBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(WTBLAcellssoc);
WTBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(WTBLAcellssoc);

WTBLAvolAUCSTIM = allvolBLAAUCSTIM(WTBLAcellssoc);
WTBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(WTBLAcellssoc);
WTBLAvolAUCPLAT = allvolBLAAUCPLAT(WTBLAcellssoc);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]); hold on;



WTBLAcellsobj = find(groupBLAvolALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAvolALL == "WT");

WTBLAobjidx = idxBLAWT(RSWTBLAcellsobj);




RSALLBLAWTVOLOBJZ = ALLBLAVOLOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLOBJZ = RSALLBLAWTVOLOBJZ;
RSnewALLBLAWTVOLOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAWTVOLOBJZ,1)
    RSnewALLBLAWTVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAWTVOLOBJZ(a,:),'movmean',5);
end

WTBLAobjMODInd = allvolobjBLAMODInd(WTBLAcellsobj);

WTBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(WTBLAcellsobj);
WTBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(WTBLAcellsobj);
WTBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(WTBLAcellsobj);

WTBLAvolAUCSTIM = allvolBLAAUCSTIM(WTBLAcellsobj);
WTBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(WTBLAcellsobj);
WTBLAvolAUCPLAT = allvolBLAAUCPLAT(WTBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 5]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 4]); hold on;
xlabel("Time (s)")
legend("Vol Social", "Vol Object");


%%
RSBLAcellssoc = find(allvolsocBLAwidths>550 & allvolsocialBLASpont<6);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(allvolsocBLAwidths>550 & allvolsocialBLASpont<6 & groupBLAvolALL == "WT");

% RSWTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLAWT(RSWTBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);

RSALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(RSWTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLSOCZ = RSALLBLAWTVOLSOCZ;
RSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];



for a = 1:size(RSnewALLBLAWTVOLSOCZ,1)
    RSnewALLBLAWTVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAWTVOLSOCZ(a,:),'movmean',5);
end

WTRSBLAsocialMODInd = allvolsocialBLAMODInd(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(RSWTBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);


RSBLAcellsobj = find(allvolobjBLAwidths>550 & allvolobjBLASpont<6);

WTBLAcellsobj = find(groupBLAvolALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(allvolobjBLAwidths>550 & allvolobjBLASpont<6 & groupBLAvolALL == "WT");

% RSWTBLAcellsobj = find(groupBLAvolALL == "WT");


WTBLAobjidx = idxBLAWT(RSWTBLAcellsobj);


RSALLBLAWTVOLOBJZ = ALLBLAVOLOBJZ(RSWTBLAcellsobj,:);



% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLOBJZ = RSALLBLAWTVOLOBJZ;
RSnewALLBLAWTVOLOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTVOLOBJZ,1)
    RSnewALLBLAWTVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAWTVOLOBJZ(a,:),'movmean',5);
end

WTRSBLAobjMODInd = allvolobjBLAMODInd(RSWTBLAcellsobj);
WTRSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(RSWTBLAcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 7]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 3]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");



%%
%
%
%
%% FS BLA CELLS

%%
FSBLAcellssoc = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6);

WTBLAcellssoc = find(groupBLAvolALL == "WT");

%FSWTBLAcellssoc = find(ismember(WTBLAcellssoc,FSBLAcellssoc)==1);

FSWTBLAcellssoc = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6 & groupBLAvolALL == "WT");

% FSWTBLAcellssoc = find(groupBLAvolALL == "WT");


WTBLAsocidx = idxBLA(FSWTBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLAFSWT = newmouseBLAWT(FSWTBLAcellssoc);

FSALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(FSWTBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTVOLSOCZ = FSALLBLAWTVOLSOCZ;
FSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLAFSWTnoinf = newmouseBLAFSWT;
% newmouseBLAFSWTnoinf(badBLAINF) = [];



for a = 1:size(FSnewALLBLAWTVOLSOCZ,1)
    FSnewALLBLAWTVOLSOCZSM(a,:) = smoothdata(FSnewALLBLAWTVOLSOCZ(a,:),'movmean',5);
end

WTFSBLAsocialMODInd = allvolsocialBLAMODInd(FSWTBLAcellssoc);
WTFSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(FSWTBLAcellssoc);
WTFSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(FSWTBLAcellssoc);
WTFSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(FSWTBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-1.85 6.85]);


FSBLAcellsobj = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6);

WTBLAcellsobj = find(groupBLAvolALL == "WT");

%FSWTBLAcellsobj = find(ismember(WTBLAcellsobj,FSBLAcellsobj)==1);

FSWTBLAcellsobj = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6 & groupBLAvolALL == "WT");

% FSWTBLAcellsobj = find(groupBLAvolALL == "WT");


WTBLAobjidx = idxBLA(FSWTBLAcellsobj);


FSALLBLAWTVOLOBJZ = ALLBLAVOLOBJZ(FSWTBLAcellsobj,:);



% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLAFSWT = newmouseBLAWT(FSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTVOLOBJZ = FSALLBLAWTVOLOBJZ;
FSnewALLBLAWTVOLOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLAFSWTnoinf = newmouseBLAFSWT;
% newmouseBLAFSWTnoinf(badBLAINF) = [];


for a = 1:size(FSnewALLBLAWTVOLOBJZ,1)
    FSnewALLBLAWTVOLOBJZSM(a,:) = smoothdata(FSnewALLBLAWTVOLOBJZ(a,:),'movmean',5);
end

WTFSBLAobjMODInd = allvolobjBLAMODInd(FSWTBLAcellsobj);
WTFSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(FSWTBLAcellsobj);
WTFSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(FSWTBLAcellsobj);
WTFSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(FSWTBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-8 6]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-4 3]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 6]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(FSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 4]);xlabel("Time (s)")
legend("Vol Social", "Vol Object");


%%
%
%
%

meanallforcobjSTRWTTRIALSSpks = nanmean(allforcobjSTRWTTRIALS');
a = meanallforcobjSTRWTTRIALSSpks(idxSTRWT == 4 | idxSTRWT == 5 | idxSTRWT == 6)';
open a
meanallforcobjSTRKOTRIALSSpks = nanmean(allforcobjSTRKOTRIALS');
b = meanallforcobjSTRKOTRIALSSpks(idxSTRKO == 4 | idxSTRKO == 5 | idxSTRKO == 6)';
open b
meanallforcobjSTRWTTRIALSSpks = nanmean(allforcobjSTRWTTRIALSSpks');
c = meanallforcobjSTRWTTRIALSSpks(idxSTRWT == 4 | idxSTRWT == 5 | idxSTRWT == 6)';
open c
meanallforcobjSTRKOTRIALSSpks = nanmean(allforcobjSTRKOTRIALSSpks');
d = meanallforcobjSTRKOTRIALSSpks(idxSTRKO == 4 | idxSTRKO == 5 | idxSTRKO == 6)';
open d


%%

 idxS1RSWT = idxS1WT(RSWTS1cellssoc);
meanallforcobjS1WTTRIALSSpks = nanmean(allforcobjS1WTTRIALS');
a = meanallforcobjS1WTTRIALSSpks(idxS1RSWT == 2)';
open a
idxS1RSKO = idxS1KO(RSKOS1cellssoc-525);
meanallforcobjS1KOTRIALSSpks = nanmean(allforcobjS1KOTRIALS');
b = meanallforcobjS1KOTRIALSSpks(idxS1RSKO == 2)';
open b
idxS1RSWT = idxS1WT(RSWTS1cellssoc);
meanallforcobjS1WTTRIALSSpks = nanmean(allforcobjS1WTTRIALSSpks');
c = meanallforcobjS1WTTRIALSSpks(idxS1RSWT == 2)';
open c
idxS1RSKO = idxS1KO(RSKOS1cellssoc-525);
meanallforcobjS1KOTRIALSSpks = nanmean(allforcobjS1KOTRIALSSpks');
d = meanallforcobjS1KOTRIALSSpks(idxS1RSKO == 2)';
open d