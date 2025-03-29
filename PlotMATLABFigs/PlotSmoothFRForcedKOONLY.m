%% Smoothened RS Cells Firing

RSS1cellssoc = find(allforsocS1widths>=400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allforsocS1widths>=400 & groupS1forcALL == "KO");

% RSKOS1cellssoc = findsav(groupS1forcALL == "KO");
% RSKOS1cellssoc = RSKOS1cellssoc-length(idxS1WT);

KOS1socidx = idxS1KO(RSKOS1cellssoc-525);

% 
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
newmouseS1RSKO = S1mouseIDKO(RSKOS1cellssoc-525);



RSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(RSKOS1cellssoc,:);



[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOFORCSOCZ = RSALLS1KOFORCSOCZ;
RSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
newmouseS1RSKOnoinf = newmouseS1RSKO;
newmouseS1RSKOnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1KOFORCSOCZ,1)
    RSnewALLS1KOFORCSOCZSM(a,:) = smoothdata(RSnewALLS1KOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
%%

RSS1cellsobj = find(allforobjS1widths>=400);

KOS1cellsobj = find(groupS1forcALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allforobjS1widths>=400 & groupS1forcALL == "KO");

% RSKOS1cellsobj = find(groupS1forcALL == "KO");


KOS1objidx = idxS1KO(RSKOS1cellsobj-525);


RSALLS1KOFORCOBJZ = ALLS1FORCOBJZ(RSKOS1cellsobj,:);



% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
newmouseS1RSKO = S1mouseIDKO(RSKOS1cellsobj-525);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOFORCOBJZ = RSALLS1KOFORCOBJZ;
RSnewALLS1KOFORCOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
newmouseS1RSKOnoinf = newmouseS1RSKO;
newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOFORCOBJZ,1)
    RSnewALLS1KOFORCOBJZSM(a,:) = smoothdata(RSnewALLS1KOFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-2.5 0.5]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-1 4]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 6])
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 25]);
xlabel("Time (s)")
legend("WT Forc Social", "WT Forc Object", "KO Forc Social", "KO Forc Object");



%% Smoothened FS Cells Firing

FSS1cellssoc = find(allforsocS1widths<400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allforsocS1widths<400 & groupS1forcALL == "KO");

% FSKOS1cellssoc = find(groupS1forcALL == "KO");


KOS1socidx = idxS1KO(FSKOS1cellssoc-525);


FSYKO = Y(FSKOS1cellssoc,:);
% figure;
% plot(FSYKO(KOS1socidx==1,1),FSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
% hold on
% plot(FSYKO(KOS1socidx==2,1),FSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
% hold on; plot(FSYKO(KOS1socidx==3,1),FSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
% hold on
% plot(FSYKO(KOS1socidx==4,1),FSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
% hold on
% plot(FSYKO(KOS1socidx==5,1),FSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)
% % 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1KO(FSKOS1cellssoc);

FSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(FSKOS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOFORCSOCZ = FSALLS1KOFORCSOCZ;
FSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];



for a = 1:size(FSnewALLS1KOFORCSOCZ,1)
    FSnewALLS1KOFORCSOCZSM(a,:) = smoothdata(FSnewALLS1KOFORCSOCZ(a,:),'movmean',5);
end

KOFSS1socialMODInd = allforcsocialS1MODInd(FSKOS1cellssoc);
KOFSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(FSKOS1cellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-1.85 6.85]);


FSS1cellsobj = find(allforobjS1widths<400);

KOS1cellsobj = find(groupS1forcALL == "KO");

%FSKOS1cellsobj = find(ismember(KOS1cellsobj,FSS1cellsobj)==1);

FSKOS1cellsobj = find(allforobjS1widths<400 & groupS1forcALL == "KO");

% FSKOS1cellsobj = find(groupS1forcALL == "KO");


KOS1objidx = idxS1KO(FSKOS1cellsobj-525);


FSALLS1KOFORCOBJZ = ALLS1FORCOBJZ(FSKOS1cellsobj,:);



% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1KO(FSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOFORCOBJZ = FSALLS1KOFORCOBJZ;
FSnewALLS1KOFORCOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];


for a = 1:size(FSnewALLS1KOFORCOBJZ,1)
    FSnewALLS1KOFORCOBJZSM(a,:) = smoothdata(FSnewALLS1KOFORCOBJZ(a,:),'movmean',5);
end

KOFSS1objMODInd = allforcobjS1MODInd(FSKOS1cellsobj);
KOFSS1objMODIndSTIM = allforcobjS1MODIndSTIM(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(FSKOS1cellsobj);
KOFSS1objMODIndPLAT = allforcobjS1MODIndPLAT(FSKOS1cellsobj);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(21); subplot(5,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:)),nanstd(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 1.5]); hold on;
subplot(5,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:)),nanstd(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-3 1]); hold on;
subplot(5,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:)),nanstd(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-1 2.5]); hold on;
subplot(5,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:)),nanstd(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]);
subplot(5,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:)),nanstd(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(FSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'g'); xlim([-1.85 6.85]); ylim([-0.5 25]);
xlabel("Time (s)")
legend("WT Forc Social", "WT Forc Object", "KO Forc Social", "KO Forc Object");


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

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250 & groupSTRforcALL == "KO");

% RSKOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(RSKOSTRcellssoc-265);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
newmouseSTRRSKO = STRmouseIDKO(RSKOSTRcellssoc-265);

RSALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(RSKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCSOCZ = RSALLSTRKOFORCSOCZ;
RSnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRKOFORCSOCZ,1)
    RSnewALLSTRKOFORCSOCZSM(a,:) = smoothdata(RSnewALLSTRKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(35); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRforcALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250 & groupSTRforcALL == "KO");

% RSKOSTRcellsobj = find(groupSTRforcALL == "KO");


KOSTRobjidx = idxSTRKO(RSKOSTRcellsobj-265);


RSALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(RSKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
newmouseSTRRSKO = STRmouseIDKO(RSKOSTRcellsobj-265);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCOBJZ = RSALLSTRKOFORCOBJZ;
RSnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOFORCOBJZ,1)
    RSnewALLSTRKOFORCOBJZSM(a,:) = smoothdata(RSnewALLSTRKOFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(35); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 4]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 10]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 20]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 80]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");



%%
%
%
%
%% FS STR CELLS

%%
FSSTRcellssoc = find(allforsocSTRwidths<475);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%FSKOSTRcellssoc = find(ismember(KOSTRcellssoc,FSSTRcellssoc)==1);

FSKOSTRcellssoc = find(allforsocSTRwidths<475 & groupSTRforcALL == "KO");

% FSKOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTR(FSKOSTRcellssoc);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTRKO(FSKOSTRcellssoc);

FSALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(FSKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOFORCSOCZ = FSALLSTRKOFORCSOCZ;
FSnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];

KOFSSTRsocialMODInd = allforcsocialSTRMODInd(FSKOSTRcellssoc);

KOFSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(FSKOSTRcellssoc);


for a = 1:size(FSnewALLSTRKOFORCSOCZ,1)
    FSnewALLSTRKOFORCSOCZSM(a,:) = smoothdata(FSnewALLSTRKOFORCSOCZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:),1)))); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:),1)))); xlim([-1.85 6.85]);


FSSTRcellsobj = find(allforsocSTRwidths<475);

KOSTRcellsobj = find(groupSTRforcALL == "KO");

%FSKOSTRcellsobj = find(ismember(KOSTRcellsobj,FSSTRcellsobj)==1);

FSKOSTRcellsobj = find(allforsocSTRwidths<475 & groupSTRforcALL == "KO");

% FSKOSTRcellsobj = find(groupSTRforcALL == "KO");


KOSTRobjidx = idxSTR(FSKOSTRcellsobj);


FSALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(FSKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTRKO(FSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOFORCOBJZ = FSALLSTRKOFORCOBJZ;
FSnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];


for a = 1:size(FSnewALLSTRKOFORCOBJZ,1)
    FSnewALLSTRKOFORCOBJZSM(a,:) = smoothdata(FSnewALLSTRKOFORCOBJZ(a,:),'movmean',5);
end

KOFSSTRobjMODInd = allforcobjSTRMODInd(FSKOSTRcellsobj);

KOFSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(FSKOSTRcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 1.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-2 2]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 1.5]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 5]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 15]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");

%%%% ALL STR CELLS

%%

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%ALLKOSTRcellssoc = find(ismember(KOSTRcellssoc,ALLSTRcellssoc)==1);

ALLKOSTRcellssoc = find(groupSTRforcALL == "KO");

% ALLKOSTRcellssoc = find(groupSTRforcALL == "KO");


KOSTRsocidx = idxSTRKO(ALLKOSTRcellssoc-265);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
newmouseSTRALLKO = STRmouseIDKO(ALLKOSTRcellssoc-265);

ALLALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(ALLKOSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRKOFORCSOCZ = ALLALLSTRKOFORCSOCZ;
ALLnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
newmouseSTRALLKOnoinf = newmouseSTRALLKO;
newmouseSTRALLKOnoinf(badSTRINF) = [];

KOSTRsocialMODInd = allforcsocialSTRMODInd(KOSTRcellssoc);

KOSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(KOSTRcellssoc);
KOSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(KOSTRcellssoc);
KOSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(KOSTRcellssoc);

KOSTRforcAUCSTIM = allforcSTRAUCSTIM(KOSTRcellssoc);
KOSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(KOSTRcellssoc);
KOSTRforcAUCPLAT = allforcSTRAUCPLAT(KOSTRcellssoc);



for a = 1:size(ALLnewALLSTRKOFORCSOCZ,1)
    ALLnewALLSTRKOFORCSOCZSM(a,:) = smoothdata(ALLnewALLSTRKOFORCSOCZ(a,:),'movmean',5);
end


%%
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:),1))),'lineprops','r'); xlim([-1.85 6.85]);hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:),1))),'lineprops','r'); xlim([-1.85 6.85]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:),1))),'lineprops','r'); xlim([-1.85 6.85]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:),1))),'lineprops','r'); xlim([-1.85 6.85]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(ALLnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:),1))),'lineprops','r'); xlim([-1.85 6.85]);
%%


KOSTRcellsobj = find(groupSTRforcALL == "KO");

%ALLKOSTRcellsobj = find(ismember(KOSTRcellsobj,ALLSTRcellsobj)==1);

ALLKOSTRcellsobj = find(groupSTRforcALL == "KO");

% ALLKOSTRcellsobj = find(groupSTRforcALL == "KO");


KOSTRobjidx = idxSTRKO(ALLKOSTRcellsobj-265);


ALLALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(ALLKOSTRcellsobj,:);



% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
newmouseSTRALLKO = STRmouseIDKO(ALLKOSTRcellsobj-265);


[badSTRINFr,badSTRINFc] = find(ismember(ALLALLSTRKOFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
ALLnewALLSTRKOFORCOBJZ = ALLALLSTRKOFORCOBJZ;
ALLnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
newmouseSTRALLKOnoinf = newmouseSTRALLKO;
newmouseSTRALLKOnoinf(badSTRINF) = [];

KOSTRobjMODInd = allforcobjSTRMODInd(KOSTRcellsobj);

KOSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(KOSTRcellsobj);
KOSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(KOSTRcellsobj);
KOSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(KOSTRcellsobj);

KOSTRforcAUCSTIM = allforcSTRAUCSTIM(KOSTRcellsobj);
KOSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(KOSTRcellsobj);
KOSTRforcAUCPLAT = allforcSTRAUCPLAT(KOSTRcellsobj);



for a = 1:size(ALLnewALLSTRKOFORCOBJZ,1)
    ALLnewALLSTRKOFORCOBJZSM(a,:) = smoothdata(ALLnewALLSTRKOFORCOBJZ(a,:),'movmean',5);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(17); subplot(6,1,1);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 0.5]); hold on;
subplot(6,1,2);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-2 1]); hold on;
subplot(6,1,3);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 3]);
subplot(6,1,4);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 8]);
subplot(6,1,5);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 30]);
subplot(6,1,6);shadedErrorBar(-2:0.05:7,nanmean(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(ALLnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 50]);
xlabel("Time (s)")
legend("WT Forc Social", "WT Forc Object", "KO Forc Social", "KO Forc Object");


%% BLA



KOBLAcellssoc = find(groupBLAforcALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAforcALL == "KO");

KOBLAsocidx = idxBLAKO(RSKOBLAcellssoc-240);



RSALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
newmouseBLARSKO = BLAmouseIDKO(RSKOBLAcellssoc-240);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCSOCZ = RSALLBLAKOFORCSOCZ;
RSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
newmouseBLARSKOnoinf = newmouseBLARSKO;
newmouseBLARSKOnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAKOFORCSOCZ,1)
    RSnewALLBLAKOFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAKOFORCSOCZ(a,:),'movmean',5);
end

KOBLAsocialMODInd = allforcsocialBLAMODInd(KOBLAcellssoc);

KOBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(KOBLAcellssoc);
KOBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(KOBLAcellssoc);
KOBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(KOBLAcellssoc);

KOBLAforcAUCSTIM = allforcBLAAUCSTIM(KOBLAcellssoc);
KOBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(KOBLAcellssoc);
KOBLAforcAUCPLAT = allforcBLAAUCPLAT(KOBLAcellssoc);



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:),1))),'lineprops','r'); xlim([-1.85 6.85]); hold on;
%%


KOBLAcellsobj = find(groupBLAforcALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAforcALL == "KO");

KOBLAobjidx = idxBLAKO(RSKOBLAcellsobj-240);




RSALLBLAKOFORCOBJZ = ALLBLAFORCOBJZ(RSKOBLAcellsobj,:);

% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
newmouseBLARSKO = BLAmouseIDKO(RSKOBLAcellsobj-240);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCOBJZ = RSALLBLAKOFORCOBJZ;
RSnewALLBLAKOFORCOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
newmouseBLARSKOnoinf = newmouseBLARSKO;
newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOFORCOBJZ,1)
    RSnewALLBLAKOFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAKOFORCOBJZ(a,:),'movmean',5);
end

KOBLAobjMODInd = allforcobjBLAMODInd(KOBLAcellsobj);

KOBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(KOBLAcellsobj);
KOBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(KOBLAcellsobj);
KOBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(KOBLAcellsobj);

KOBLAforcAUCSTIM = allforcBLAAUCSTIM(KOBLAcellsobj);
KOBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(KOBLAcellsobj);
KOBLAforcAUCPLAT = allforcBLAAUCPLAT(KOBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 1]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1 5]); hold on;
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 4]); hold on;
xlabel("Time (s)")
legend("WT Forc Social", "WT Forc Object", "KO Forc Social", "KO Forc Object");


%%
RSBLAcellssoc = find(allforsocBLAwidths>550 & allforcsocialBLASpont<6);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(allforsocBLAwidths>550 & allforcsocialBLASpont<6 & groupBLAforcALL == "KO");

% RSKOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLA(RSKOBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellssoc);

RSALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(RSKOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCSOCZ = RSALLBLAKOFORCSOCZ;
RSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];



for a = 1:size(RSnewALLBLAKOFORCSOCZ,1)
    RSnewALLBLAKOFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAKOFORCSOCZ(a,:),'movmean',5);
end

KORSBLAsocialMODInd = allforcsocialBLAMODInd(RSKOBLAcellssoc);
KORSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(RSKOBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);


RSBLAcellsobj = find(allforobjBLAwidths>550 & allforcobjBLASpont<6);

KOBLAcellsobj = find(groupBLAforcALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(allforobjBLAwidths>550 & allforcobjBLASpont<6 & groupBLAforcALL == "KO");

% RSKOBLAcellsobj = find(groupBLAforcALL == "KO");


KOBLAobjidx = idxBLA(RSKOBLAcellsobj);


RSALLBLAKOFORCOBJZ = ALLBLAFORCOBJZ(RSKOBLAcellsobj,:);



% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLAKO(RSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCOBJZ = RSALLBLAKOFORCOBJZ;
RSnewALLBLAKOFORCOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAKOFORCOBJZ,1)
    RSnewALLBLAKOFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAKOFORCOBJZ(a,:),'movmean',5);
end

KORSBLAobjMODInd = allforcobjBLAMODInd(RSKOBLAcellsobj);
KORSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(RSKOBLAcellsobj);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(20); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 1]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 0.5]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 8]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-0.5 4]);
xlabel("Time (s)")
legend("Forc Social", "Forc Object");



%%
%
%
%
%% FS BLA CELLS

%%
FSBLAcellssoc = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6);

KOBLAcellssoc = find(groupBLAforcALL == "KO");

%FSKOBLAcellssoc = find(ismember(KOBLAcellssoc,FSBLAcellssoc)==1);

FSKOBLAcellssoc = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6 & groupBLAforcALL == "KO");

% FSKOBLAcellssoc = find(groupBLAforcALL == "KO");


KOBLAsocidx = idxBLA(FSKOBLAcellssoc);

% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLAFSKO = newmouseBLAKO(FSKOBLAcellssoc);

FSALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(FSKOBLAcellssoc,:);

[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOFORCSOCZ = FSALLBLAKOFORCSOCZ;
FSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLAFSKOnoinf = newmouseBLAFSKO;
% newmouseBLAFSKOnoinf(badBLAINF) = [];



for a = 1:size(FSnewALLBLAKOFORCSOCZ,1)
    FSnewALLBLAKOFORCSOCZSM(a,:) = smoothdata(FSnewALLBLAKOFORCSOCZ(a,:),'movmean',5);
end

KOFSBLAsocialMODInd = allforcsocialBLAMODInd(FSKOBLAcellssoc);
KOFSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(FSKOBLAcellssoc);
KOFSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(FSKOBLAcellssoc);
KOFSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(FSKOBLAcellssoc);


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:),1)))); xlim([-1.85 6.85]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:),1)))); xlim([-1.85 6.85]);hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:),1)))); xlim([-1.85 6.85]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:),1)))); xlim([-1.85 6.85]);


FSBLAcellsobj = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6);

KOBLAcellsobj = find(groupBLAforcALL == "KO");

%FSKOBLAcellsobj = find(ismember(KOBLAcellsobj,FSBLAcellsobj)==1);

FSKOBLAcellsobj = find(allforsocBLAwidths<=550 & allforcsocialBLASpont>=6 & groupBLAforcALL == "KO");

% FSKOBLAcellsobj = find(groupBLAforcALL == "KO");


KOBLAobjidx = idxBLA(FSKOBLAcellsobj);


FSALLBLAKOFORCOBJZ = ALLBLAFORCOBJZ(FSKOBLAcellsobj,:);



% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLAFSKO = newmouseBLAKO(FSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOFORCOBJZ = FSALLBLAKOFORCOBJZ;
FSnewALLBLAKOFORCOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLAFSKOnoinf = newmouseBLAFSKO;
% newmouseBLAFSKOnoinf(badBLAINF) = [];


for a = 1:size(FSnewALLBLAKOFORCOBJZ,1)
    FSnewALLBLAKOFORCOBJZSM(a,:) = smoothdata(FSnewALLBLAKOFORCOBJZ(a,:),'movmean',5);
end

KOFSBLAobjMODInd = allforcobjBLAMODInd(FSKOBLAcellsobj);
KOFSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(FSKOBLAcellsobj);
KOFSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(FSKOBLAcellsobj);
KOFSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(FSKOBLAcellsobj);

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(19); subplot(4,1,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-3 3.5]); hold on;
subplot(4,1,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-3.5 1]); hold on;
subplot(4,1,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 8]);
subplot(4,1,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(FSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops','g'); xlim([-1.85 6.85]); ylim([-1.5 8]);xlabel("Time (s)")
legend("Forc Social", "Forc Object");


