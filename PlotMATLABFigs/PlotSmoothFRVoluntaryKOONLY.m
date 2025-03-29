%% Smoothened RS Cells Firing

RSS1cellssoc = find(allvolsocS1widths>=400);

KOS1cellssoc = find(groupS1volALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allvolsocS1widths>=400 & groupS1volALL == "KO");

% RSKOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(RSKOS1cellssoc-533);


% RSYKO = Y(RSKOS1cellssoc,:);
% figure;
% plot(RSYKO(KOS1socidx==1,1),RSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
% hold on
% plot(RSYKO(KOS1socidx==2,1),RSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
% hold on; plot(RSYKO(KOS1socidx==3,1),RSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
% hold on
% plot(RSYKO(KOS1socidx==4,1),RSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
% hold on
% plot(RSYKO(KOS1socidx==5,1),RSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)
% % 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1KO(RSKOS1cellssoc);

RSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(RSKOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLSOCZ = RSALLS1KOVOLSOCZ;
RSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1KOVOLSOCZ,1)
    RSnewALLS1KOVOLSOCZSM(a,:) = smoothdata(RSnewALLS1KOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);

%%
RSS1cellsobj = find(allvolobjS1widths>=400);

KOS1cellsobj = find(groupS1volALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allvolobjS1widths>=400 & groupS1volALL == "KO");

% RSKOS1cellsobj = find(groupS1volALL == "KO");


KOS1objidx = idxS1KO(RSKOS1cellsobj-533);


RSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(RSKOS1cellsobj,:);



% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1KO(RSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLOBJZ = RSALLS1KOVOLOBJZ;
RSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOVOLOBJZ,1)
    RSnewALLS1KOVOLOBJZSM(a,:) = smoothdata(RSnewALLS1KOVOLOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]);  ylim([-2 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 2]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 6]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");


%%

RSS1cellsobj = find(allvolobjS1widths>=400);

KOS1cellsobj = find(groupS1volALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allvolobjS1widths>=400 & groupS1volALL == "KO");

% RSKOS1cellsobj = find(groupS1volALL == "KO");


KOS1objidx = idxS1(RSKOS1cellsobj);


RSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(RSKOS1cellsobj,:);



% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1KO(RSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLOBJZ = RSALLS1KOVOLOBJZ;
RSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOVOLOBJZ,1)
    RSnewALLS1KOVOLOBJZSM(a,:) = smoothdata(RSnewALLS1KOVOLOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); ylim([-0.5 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);  ylim([-2 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); ylim([-0.5 1.5]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); ylim([-0.5 4]);
xlabel("Time (s)")
legend("WT Vol Social", "WT Vol Object", "KO Vol Social", "KO Vol Object");



%% Smoothened FS Cells Firing

FSS1cellssoc = find(allvolsocS1widths<400);

KOS1cellssoc = find(groupS1volALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allvolsocS1widths<400 & groupS1volALL == "KO");

% FSKOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1KO(FSKOS1cellssoc-533);


FSYKO = Y(FSKOS1cellssoc,:);
figure;
plot(FSYKO(KOS1socidx==1,1),FSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==2,1),FSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYKO(KOS1socidx==3,1),FSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==4,1),FSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==5,1),FSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1KO(FSKOS1cellssoc);

FSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(FSKOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOVOLSOCZ = FSALLS1KOVOLSOCZ;
FSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];



for a = 1:size(FSnewALLS1KOVOLSOCZ,1)
    FSnewALLS1KOVOLSOCZSM(a,:) = smoothdata(FSnewALLS1KOVOLSOCZ(a,:),'movmean',5);
end

KOFSS1socialMODInd = allvolsocialS1MODInd(FSKOS1cellssoc);
KOFSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(FSKOS1cellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:),1)))); xlim([-1.85 6.85]); ylim([-2 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 2]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:),1)))); xlim([-1.85 6.85]); ylim([-0.5 4]);


FSS1cellsobj = find(allvolobjS1widths<400);

KOS1cellsobj = find(groupS1volALL == "KO");

%FSKOS1cellsobj = find(ismember(KOS1cellsobj,FSS1cellsobj)==1);

FSKOS1cellsobj = find(allvolobjS1widths<400 & groupS1volALL == "KO");

% FSKOS1cellsobj = find(groupS1volALL == "KO");


KOS1objidx = idxS1KO(FSKOS1cellsobj-533);


FSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(FSKOS1cellsobj,:);



% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1KO(FSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOVOLOBJZ = FSALLS1KOVOLOBJZ;
FSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];


for a = 1:size(FSnewALLS1KOVOLOBJZ,1)
    FSnewALLS1KOVOLOBJZSM(a,:) = smoothdata(FSnewALLS1KOVOLOBJZ(a,:),'movmean',5);
end

KOFSS1objMODInd = allvolobjS1MODInd(FSKOS1cellsobj);
KOFSS1objMODIndSTIM = allvolobjS1MODIndSTIM(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(FSKOS1cellsobj);
KOFSS1objMODIndPLAT = allvolobjS1MODIndPLAT(FSKOS1cellsobj);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:)),nanstd(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:)),nanstd(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-2 1]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:)),nanstd(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 2]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:)),nanstd(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-1 2.5]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:)),nanstd(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(FSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'b'); xlim([-1.85 6.85]); ylim([-0.5 5]);
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

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250 & groupSTRvolALL == "KO");

% RSKOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTR(RSKOSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTRKO(RSKOSTRcellssoc);

RSALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(RSKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLSOCZ = RSALLSTRKOVOLSOCZ;
RSnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRKOVOLSOCZ,1)
    RSnewALLSTRKOVOLSOCZSM(a,:) = smoothdata(RSnewALLSTRKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRvolALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250 & groupSTRvolALL == "KO");

% RSKOSTRcellsobj = find(groupSTRvolALL == "KO");


KOSTRobjidx = idxSTR(RSKOSTRcellsobj);


RSALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(RSKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTRKO(RSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLOBJZ = RSALLSTRKOVOLOBJZ;
RSnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOVOLOBJZ,1)
    RSnewALLSTRKOVOLOBJZSM(a,:) = smoothdata(RSnewALLSTRKOVOLOBJZ(a,:),'movmean',5);
end

KORSSTRsocialMODInd = allvolsocialSTRMODInd(RSKOSTRcellssoc);

KORSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(RSKOSTRcellssoc);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 2.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 10]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 20]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");





%%
%
%
%
%% FS STR CELLS

%%
FSSTRcellssoc = find(allvolsocSTRwidths<475);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%FSKOSTRcellssoc = find(ismember(KOSTRcellssoc,FSSTRcellssoc)==1);

FSKOSTRcellssoc = find(allvolsocSTRwidths<475 & groupSTRvolALL == "KO");

% FSKOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTR(FSKOSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTRKO(FSKOSTRcellssoc);

FSALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(FSKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOVOLSOCZ = FSALLSTRKOVOLSOCZ;
FSnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];

KOFSSTRsocialMODInd = allvolsocialSTRMODInd(FSKOSTRcellssoc);

KOFSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(FSKOSTRcellssoc);


for a = 1:size(FSnewALLSTRKOVOLSOCZ,1)
    FSnewALLSTRKOVOLSOCZSM(a,:) = smoothdata(FSnewALLSTRKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:),1)))); xlim([-1.85 6.85]);


FSSTRcellsobj = find(allvolsocSTRwidths<475);

KOSTRcellsobj = find(groupSTRvolALL == "KO");

%FSKOSTRcellsobj = find(ismember(KOSTRcellsobj,FSSTRcellsobj)==1);

FSKOSTRcellsobj = find(allvolsocSTRwidths<475 & groupSTRvolALL == "KO");

% FSKOSTRcellsobj = find(groupSTRvolALL == "KO");


KOSTRobjidx = idxSTR(FSKOSTRcellsobj);


FSALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(FSKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTRKO(FSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOVOLOBJZ = FSALLSTRKOVOLOBJZ;
FSnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];


for a = 1:size(FSnewALLSTRKOVOLOBJZ,1)
    FSnewALLSTRKOVOLOBJZSM(a,:) = smoothdata(FSnewALLSTRKOVOLOBJZ(a,:),'movmean',5);
end

KOFSSTRobjMODInd = allvolobjSTRMODInd(FSKOSTRcellsobj);

KOFSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(FSKOSTRcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 2]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 3]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 6]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 6]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");

%%%% ALL STR CELLS

%%

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%ALLKOSTRcellssoc = find(ismember(KOSTRcellssoc,ALLSTRcellssoc)==1);

ALLKOSTRcellssoc = find(groupSTRvolALL == "KO");

% ALLKOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTRKO(ALLKOSTRcellssoc-266);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRALLKO = newmouseSTRKO(ALLKOSTRcellssoc);

ALLALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(ALLKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRKOVOLSOCZ = ALLALLSTRKOVOLSOCZ;
ALLnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRALLKOnoinf = newmouseSTRALLKO;
% newmouseSTRALLKOnoinf(badSTRINF) = [];

KOSTRsocialMODInd = allvolsocialSTRMODInd(KOSTRcellssoc);

KOSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(KOSTRcellssoc);
KOSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(KOSTRcellssoc);
KOSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(KOSTRcellssoc);
% 
% KOSTRvolAUCSTIM = allvolSTRAUCSTIM(KOSTRcellssoc);
% KOSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(KOSTRcellssoc);
% KOSTRvolAUCPLAT = allvolSTRAUCPLAT(KOSTRcellssoc);



for a = 1:size(ALLnewALLSTRKOVOLSOCZ,1)
    ALLnewALLSTRKOVOLSOCZSM(a,:) = smoothdata(ALLnewALLSTRKOVOLSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(ALLnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:),1))), 'lineprops', 'r'); xlim([-1.85 6.85]);



KOSTRcellsobj = find(groupSTRvolALL == "KO");

%ALLKOSTRcellsobj = find(ismember(KOSTRcellsobj,ALLSTRcellsobj)==1);

ALLKOSTRcellsobj = find(groupSTRvolALL == "KO");

% ALLKOSTRcellsobj = find(groupSTRvolALL == "KO");


KOSTRobjidx = idxSTRKO(ALLKOSTRcellsobj-266);


ALLALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(ALLKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRALLKO = newmouseSTRKO(ALLKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRKOVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRKOVOLOBJZ = ALLALLSTRKOVOLOBJZ;
ALLnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRALLKOnoinf = newmouseSTRALLKO;
% newmouseSTRALLKOnoinf(badSTRINF) = [];

KOSTRobjMODInd = allvolobjSTRMODInd(KOSTRcellsobj);

KOSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(KOSTRcellsobj);
KOSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(KOSTRcellsobj);
KOSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(KOSTRcellsobj);

% KOSTRvolAUCSTIM = allvolSTRAUCSTIM(KOSTRcellsobj);
% KOSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(KOSTRcellsobj);
% KOSTRvolAUCPLAT = allvolSTRAUCPLAT(KOSTRcellsobj);



for a = 1:size(ALLnewALLSTRKOVOLOBJZ,1)
    ALLnewALLSTRKOVOLOBJZSM(a,:) = smoothdata(ALLnewALLSTRKOVOLOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 2]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 10]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 12]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(ALLnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 10]);
xlabel("Time (s)")




%% BLA



KOBLAcellssoc = find(groupBLAvolALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAvolALL == "KO");

KOBLAsocidx = idxBLAKO(RSKOBLAcellssoc-240);



RSALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellssoc);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLSOCZ = RSALLBLAKOVOLSOCZ;
RSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAKOVOLSOCZ,1)
    RSnewALLBLAKOVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAKOVOLSOCZ(a,:),'movmean',5);
end

KOBLAsocialMODInd = allvolsocialBLAMODInd(KOBLAcellssoc);

KOBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(KOBLAcellssoc);
KOBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(KOBLAcellssoc);
KOBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(KOBLAcellssoc);

% KOBLAvolAUCSTIM = allvolBLAAUCSTIM(KOBLAcellssoc);
% KOBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(KOBLAcellssoc);
% KOBLAvolAUCPLAT = allvolBLAAUCPLAT(KOBLAcellssoc);
% 


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;



KOBLAcellsobj = find(groupBLAvolALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAvolALL == "KO");

KOBLAobjidx = idxBLAKO(RSKOBLAcellsobj-240);




RSALLBLAKOVOLOBJZ = ALLBLAVOLOBJZ(RSKOBLAcellsobj,:);

% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLOBJZ = RSALLBLAKOVOLOBJZ;
RSnewALLBLAKOVOLOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOVOLOBJZ,1)
    RSnewALLBLAKOVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAKOVOLOBJZ(a,:),'movmean',5);
end

KOBLAobjMODInd = allvolobjBLAMODInd(KOBLAcellsobj);

KOBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(KOBLAcellsobj);
KOBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(KOBLAcellsobj);
KOBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(KOBLAcellsobj);

% KOBLAvolAUCSTIM = allvolBLAAUCSTIM(KOBLAcellsobj);
% KOBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(KOBLAcellsobj);
% KOBLAvolAUCPLAT = allvolBLAAUCPLAT(KOBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 5]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 4]); hold on;
xlabel("Time (s)")
legend("WT Vol Social", "WT Vol Object", "KO Vol Social", "KO Vol Object");


%%
RSBLAcellssoc = find(allvolsocBLAwidths>550 & allvolsocialBLASpont<6);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(allvolsocBLAwidths>550 & allvolsocialBLASpont<6 & groupBLAvolALL == "KO");

% RSKOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLA(RSKOBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellssoc);

RSALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(RSKOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLSOCZ = RSALLBLAKOVOLSOCZ;
RSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];



for a = 1:size(RSnewALLBLAKOVOLSOCZ,1)
    RSnewALLBLAKOVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAKOVOLSOCZ(a,:),'movmean',5);
end

KORSBLAsocialMODInd = allvolsocialBLAMODInd(RSKOBLAcellssoc);
KORSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(RSKOBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:),1)))); xlim([-1.85 6.85]);


RSBLAcellsobj = find(allvolobjBLAwidths>550 & allvolobjBLASpont<6);

KOBLAcellsobj = find(groupBLAvolALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(allvolobjBLAwidths>550 & allvolobjBLASpont<6 & groupBLAvolALL == "KO");

% RSKOBLAcellsobj = find(groupBLAvolALL == "KO");


KOBLAobjidx = idxBLA(RSKOBLAcellsobj);


RSALLBLAKOVOLOBJZ = ALLBLAVOLOBJZ(RSKOBLAcellsobj,:);



% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLOBJZ = RSALLBLAKOVOLOBJZ;
RSnewALLBLAKOVOLOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAKOVOLOBJZ,1)
    RSnewALLBLAKOVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAKOVOLOBJZ(a,:),'movmean',5);
end

KORSBLAobjMODInd = allvolobjBLAMODInd(RSKOBLAcellsobj);
KORSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(RSKOBLAcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1 7]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-0.5 3]);
xlabel("Time (s)")
legend("Vol Social", "Vol Object");



%%
%
%
%
%% FS BLA CELLS

%%
FSBLAcellssoc = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6);

KOBLAcellssoc = find(groupBLAvolALL == "KO");

%FSKOBLAcellssoc = find(ismember(KOBLAcellssoc,FSBLAcellssoc)==1);

FSKOBLAcellssoc = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6 & groupBLAvolALL == "KO");

% FSKOBLAcellssoc = find(groupBLAvolALL == "KO");


KOBLAsocidx = idxBLA(FSKOBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLAFSKO = newmouseBLAKO(FSKOBLAcellssoc);

FSALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(FSKOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOVOLSOCZ = FSALLBLAKOVOLSOCZ;
FSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAFSKOnoinf = newmouseBLAFSKO;
% newmouseBLAFSKOnoinf(badBLAINF) = [];



for a = 1:size(FSnewALLBLAKOVOLSOCZ,1)
    FSnewALLBLAKOVOLSOCZSM(a,:) = smoothdata(FSnewALLBLAKOVOLSOCZ(a,:),'movmean',5);
end

KOFSBLAsocialMODInd = allvolsocialBLAMODInd(FSKOBLAcellssoc);
KOFSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(FSKOBLAcellssoc);
KOFSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(FSKOBLAcellssoc);
KOFSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(FSKOBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:),1)))); xlim([-1.85 6.85]);


FSBLAcellsobj = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6);

KOBLAcellsobj = find(groupBLAvolALL == "KO");

%FSKOBLAcellsobj = find(ismember(KOBLAcellsobj,FSBLAcellsobj)==1);

FSKOBLAcellsobj = find(allvolsocBLAwidths<=550 & allvolsocialBLASpont>=6 & groupBLAvolALL == "KO");

% FSKOBLAcellsobj = find(groupBLAvolALL == "KO");


KOBLAobjidx = idxBLA(FSKOBLAcellsobj);


FSALLBLAKOVOLOBJZ = ALLBLAVOLOBJZ(FSKOBLAcellsobj,:);



% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLAFSKO = newmouseBLAKO(FSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOVOLOBJZ = FSALLBLAKOVOLOBJZ;
FSnewALLBLAKOVOLOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLAFSKOnoinf = newmouseBLAFSKO;
% newmouseBLAFSKOnoinf(badBLAINF) = [];


for a = 1:size(FSnewALLBLAKOVOLOBJZ,1)
    FSnewALLBLAKOVOLOBJZSM(a,:) = smoothdata(FSnewALLBLAKOVOLOBJZ(a,:),'movmean',5);
end

KOFSBLAobjMODInd = allvolobjBLAMODInd(FSKOBLAcellsobj);
KOFSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(FSKOBLAcellsobj);
KOFSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(FSKOBLAcellsobj);
KOFSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(FSKOBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-8 6]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-4 3]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-1.5 6]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(FSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','b'); xlim([-1.85 6.85]); ylim([-2 4]);xlabel("Time (s)")
legend("Vol Social", "Vol Object");


