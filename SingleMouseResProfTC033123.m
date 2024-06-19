%%
%% For Social Touch stim
clear
close all
% load('concatvariableseforcedobject.mat','trialspks');
% load('concatvariablesfforcedmouse.mat','trialspks2');
load('newstimonsets','stimonsets');
load('newdepths','S1depths', 'striataldepths','bladepths');
% 
%trialspks = trialspks2;
%trialspks = trialspks;
stimonsets2 = stimonsets;
%clear stimonsets
%stimonsets = stimonsets2(41:80);

%load("allS1depths.mat")
%load("S1propertiesForcmo.mat")
%%

%% Load all files needed for analysis
% Loads all files from Kilosort (not Phy curated)
% Loads the clusters each spike corresponds to
clu = readNPY('spike_clusters.npy');

% Loads the times of each spike, the template its matched to, its amplitude
% and its position on the channel map 
sp = readNPY('spike_times.npy');
templates = readNPY('templates.npy');
templates_ind = readNPY('templates_ind.npy');
chmap = readNPY('channel_map.npy');
chpos = readNPY('channel_positions.npy');
amps = readNPY('amplitudes.npy');

% Loads cluster groups following manual curation in Phy
n = tdfread('cluster_group.tsv');
clusterID = n.cluster_id;
clustergroup = cellstr(n.group);
% clustergroup = cellstr(n.KSLabel);

% Loads cluster group and depth from manual curation of Phy and the
% corresponding ID of that cluster
clusterinfo = tdfread('cluster_info.tsv');
clustergroup = clusterinfo.group;
clusterdepth = clusterinfo.depth;
clustergroup = cellstr(clustergroup);
clusterID = clusterinfo.cluster_id;
clusterch = clusterinfo.ch;

%Finds each unique cluster and delegates which spks belong to which cluster
spks = {};
uclu = unique(clu);
%uclu = clusterID;
ap_srate = 30000.316318;
for c = 1:length(uclu)
    spks{c} = single(sp(clu==uclu(c)))/ap_srate;
    spkssamp{c} = single(sp(clu==uclu(c)));
end

%%
% Get waveforms of spikes
bins = dir('*ap.bin');
binnames = {bins.name};
apbin1 = string(binnames(1));
% Read the digital port of the nidaq for the first baseline file in concatenation
out1 = load_binary_file(apbin1,385,[],[],true);
indx = [-30:50];
numsamps = length(indx);
[z,p] = butter(3,500/30000,'high');

chdepth = zeros([length(uclu),1]);
%% get spike tiems for all trials (vol and forced)

goodclus = find(string(clustergroup) == "good");

goodtruclu = goodclus;

for a = 1:length(goodclus)
    newspks{a} = spks{(goodclus(a))};
    newspksamps{a} = spkssamp{(goodclus(a))};
    goodcludepths(a) = (clusterdepth(goodclus(a)));
end

ISIcutoff = 1.5/1000;

for c = 1:length(newspks)
ISIs{c} = diff(newspks{c});
end
for c = 1:length(ISIs)
diffclus = (ISIs{c}<ISIcutoff);
badclus(c) = sum(diffclus(:) == 1);
end

for c = 1:length(badclus)
if (badclus(c)/(length(spks{c})))>0.05
newspks{c} = [];
newspksamps{c} = [];
goodcludepths(c) = nan;
goodtruclu(c) = nan;
else
newspks{c} = newspks{c};
newspksamps{c} = newspksamps{c};
end
end

newspks = newspks(~cellfun('isempty',newspks));
newspksamps = newspksamps(~cellfun('isempty',newspksamps));
goodcludepths = goodcludepths(find(~isnan(goodcludepths)));
goodtruclu = goodtruclu(find(~isnan(goodtruclu)));

totaltime = stimonsets(end);
for a = 1:length(newspks)
    if length(find(newspks{a}>=totaltime)) >= 1
    bigspks = find(newspks{a}>=totaltime);
    endspks = bigspks(1);
    elseif length(find(newspks{a}>=totaltime)) == 0
    endspks = find(newspks{a}==newspks{a}(end));
    end
    allspks = length(newspks{a}(1:endspks));
    firspks(a) = allspks/totaltime;
    clear bigspks
    clear allspks
    clear endspks
end

for j = 1:length(newspks)
    if firspks(j) <= 0.1
        newspks{j} = [];
        newspksamps{j} = [];
        goodcludepths(j) = nan;
        goodtruclu(c) = nan;
    elseif firspks(j) > 0.1
        newspks{j} = newspks{j};
        newspksamps{j} = newspksamps{j};
    end
end

newspks = newspks(~cellfun('isempty',newspks));
newspksamps = newspksamps(~cellfun('isempty',newspksamps));
goodcludepths = goodcludepths(find(~isnan(goodcludepths)));
goodtruclu = goodtruclu(find(~isnan(goodtruclu)));

for a = 1:length(newspksamps)
clulen(a) = length(newspksamps{a});
end
highspikes = find(clulen>55);
lowspikes = find(clulen<=55);

for n = 1:length(lowspikes)
    newspks{lowspikes(n)} = [];
    newspksamps{lowspikes(n)} = [];
end


newspks = newspks(~cellfun('isempty',newspks));
newspksamps = newspksamps(~cellfun('isempty',newspksamps));
goodcludepths = goodcludepths(highspikes);
goodtruclu = goodtruclu(highspikes);
%%

trialspks = {};

wpre = 2; 
wpost = 7; 

for c = 1:length(newspks)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:length(stimonsets)
        o = stimonsets(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    trialspks{c} = tmp;
end

basespks = {};

wpre = 4; 
wpost = 0; 

for c = 1:length(newspks)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:40
        o = stimonsets(itrial+120);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    basespks{c} = tmp;
end

stim(1:40) = "volobj";
stim(41:80) = "volmo";
stim(81:120) = "forcobj";
stim(121:160) = "forcmo";


% %%
% 
% stimonsets2 = stimonsets(1:80);
% trialspks = {};
% 
% wpre = 2; 
% wpost = 7; 
% 
% for c = 1:length(newspks)
%     sp = newspks{c};
%     tmp = {};
%     for itrial = 1:80
%         o = stimonsets2(itrial);
%         tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
%     end
%     trialspks{c} = tmp;
% end
% 
% mkdir rastersVol
% % Save plots of spike rasters for each cluster for first condition
% for c = 1:length(newspks)
%     fig = figure(100);
%     clf
%     plotRastergram(trialspks{c});hold all
%     plot([0,0],[0,80],'--r')
%     plot([5,5],[0,80],'--r')
%     axis([-2,7,0,80])
%     print(sprintf('rastersVol\\cluster%d',uclu(c)),'-dpng')
% end
% 
% 
% stimonsets2 = stimonsets(81:160);
% trialspks = {};
% 
% wpre = 2; 
% wpost = 7; 
% 
% for c = 1:length(newspks)
%     sp = newspks{c};
%     tmp = {};
%     for itrial = 1:80
%         o = stimonsets2(itrial);
%         tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
%     end
%     trialspks{c} = tmp;
% end
% 
% mkdir rastersForc
% % Save plots of spike rasters for each cluster for first condition
% for c = 1:length(newspks)
%     fig = figure(100);
%     clf
%     plotRastergram(trialspks{c});hold all
%     plot([0,0],[0,80],'--r')
%     plot([5,5],[0,80],'--r')
%     axis([-2,7,0,80])
%     print(sprintf('rastersForc\\cluster%d',uclu(c)),'-dpng')
% end
% 

%%

stimonsets2 = stimonsets(81:160);
trialspks = {};

wpre = 2; 
wpost = 7; 

for c = 1:length(newspks)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:80
        o = stimonsets2(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    trialspks{c} = tmp;
end

% Save plots of spike rasters for each cluster for first condition
for c = 171
    fig = figure(104);
    clf
    plotRastergram(trialspks{c});hold all
    plot([0,0],[0,80],'--r')
    plot([5,5],[0,80],'--r')
    axis([-2,7,0,80])
end
%%
% depthspks = {};
% 
% wpre = 2; 
% wpost = 7; 
% 
% for c = 1:length(newspks)
%     sp = newspks{c};
%     tmp = {};
%     for itrial = 85
%         o = stimonsets(itrial);
%         tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
%     end
%     depthspks{c} = tmp;
% end
% 
%     
% %close all 
% % Save plots of spike rasters by depth
% for c = 1:length(newspks)
%     if clustergroup(c) ~= "noise" | clustergroup(c) ~= "mua"
%     fig = figure(105);
%     hold on;
%     plotrastersTC(depthspks{c},goodcludepths(c));
% %     plot([0,0],[0,40],'--r')
% %     plot([5,5],[0,40],'--r')
% %axis([-2.5,7.5,0,40])
% %     print(sprintf('rasters\\cluster%d',uclu(c)),'-dpng')
%     ylim([0 max(clusterdepth)])
%     end
% end
%%
for c = 1:length(newspks)
    emptycell = cellfun(@isempty,trialspks{c});
    allarray = find(emptycell==1);
    if length(allarray) == 240
        mmall{c} =[];
    elseif length(allarray)<240
    binsize = 0.05;
    k = alpha_func(1,1,25,1/binsize,1000);
    k = [k*0,k];
    k = k/sum(k);
    bsp = convolve_spiketrains(trialspks{c},binsize,[-2,7],k)./binsize;
    basesp = convolve_spiketrains(basespks{c},binsize,[-4,-2],k)./binsize;
% %     figure(40)
% %     clf
% %     subplot(2,1,1)
% %    
% %     imagesc(bsp)
% %     colormap(flipud(gray))
% %
% %     xlim([0,size(bsp,2)])
% %     subplot(2,1,2)
% %     plot(mean(bsp,1))
% %     xlim([0,size(bsp,2)])
% %imagesc(-0.5:0.005:1.5,[1:80],bsp)
    mmmeanbase(c,:) = mean(basesp);
    bspn = bsp;
    mmvolobj{c} = nanmean(bspn(1:40,:),1);
    mmvolmo{c} = nanmean(bspn(41:80,:),1);
    mmforcobj{c} = nanmean(bspn(81:120,:),1);
    mmforcmo{c} = nanmean(bspn(121:160,:),1);
    mmvolonly{c} = nanmean(bspn(1:80,:),1);
    mmforconly{c} = nanmean(bspn(81:160,:),1);
    mmall{c} = nanmean(bspn,1);
    ssall{c} = nanstd(bspn,1)/sqrt(40);
    newbsp = bspn';
    mmwhole{c} = newbsp(:);
    end
end

% %% Get sorted cells for each interaction type and plot them
% [VOLOBJnewmeansortedcells, VOLOBJnewmeansortedcellsS1, VOLOBJnewmeansortedcellsstr, VOLOBJnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla] = getrespprof(mmvolobj, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
% [VOLMOnewmeansortedcells, VOLMOnewmeansortedcellsS1, VOLMOnewmeansortedcellsstr, VOLMOnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla] = getrespprof(mmvolmo, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
% [FORCOBJnewmeansortedcells, FORCOBJnewmeansortedcellsS1, FORCOBJnewmeansortedcellsstr, FORCOBJnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla] = getrespprof(mmforcobj, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
% [FORCMOnewmeansortedcells, FORCMOnewmeansortedcellsS1, FORCMOnewmeansortedcellsstr, FORCMOnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla] = getrespprof(mmforcmo, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);

%%
% close all
% figure; subplot(2,1,1); plotRastergram(trialspks{137});hold all
% plot([0,0],[0,40],'--r')
% plot([5,5],[0,40],'--r')
% axis([-2,7,0,40])
% xlabel(["Time s"])
% ylabel(["Trial #"])
% 
% subplot(2,1,2); shadedErrorBar(-2:0.05:7,mmall{137}, ssall{137});
% xlim([-1.95,6.95])
% xlabel(["Time s"])
% ylabel(["Firing Rate (spks/sec)"])

%% Get sorted cells for each interaction type and plot them + INDEX
[VOLOBJnewmeansortedcells, VOLOBJnewmeansortedcellsS1, VOLOBJnewmeansortedcellsstr, VOLOBJnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1VOLOBJ, newindexstrVOLOBJ, newindexblaVOLOBJ, normmeanswS1VOLOBJ, normmeanswstrVOLOBJ, normmeanswblaVOLOBJ] = getrespprof(mmvolobj, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
[VOLMOnewmeansortedcells, VOLMOnewmeansortedcellsS1, VOLMOnewmeansortedcellsstr, VOLMOnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1VOLMO, newindexstrVOLMO, newindexblaVOLMO, normmeanswS1VOLMO, normmeanswstrVOLMO, normmeanswblaVOLMO] = getrespprof(mmvolmo, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
[FORCOBJnewmeansortedcells, FORCOBJnewmeansortedcellsS1, FORCOBJnewmeansortedcellsstr, FORCOBJnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1FORCOBJ, newindexstrFORCOBJ, newindexblaFORCOBJ, normmeanswS1FORCOBJ, normmeanswstrFORCOBJ, normmeanswblaFORCOBJ] = getrespprof(mmforcobj, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
[FORCMOnewmeansortedcells, FORCMOnewmeansortedcellsS1, FORCMOnewmeansortedcellsstr, FORCMOnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1FORCMO, newindexstrFORCMO, newindexblaFORCMO, normmeanswS1FORCMO, normmeanswstrFORCMO, normmeanswblaFORCMO] = getrespprof(mmforcmo, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);


% Get sorted cells but for VOL and FORC together

[VOLALLnewmeansortedcells, VOLALLnewmeansortedcellsS1, VOLALLnewmeansortedcellsstr, VOLALLnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1VOLALL, newindexstrVOLALL, newindexblaVOLALL, normmeanswS1VOLALL, normmeanswstrVOLALL, normmeanswblaVOLALL] = getrespprof(mmvolonly, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
[FORCALLnewmeansortedcells, FORCALLnewmeansortedcellsS1, FORCALLnewmeansortedcellsstr, FORCALLnewmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, newindexS1FORCALL, newindexstrFORCALL, newindexblaFORCALL, normmeanswS1FORCALL, normmeanswstrFORCALL, normmeanswblaFORCALL] = getrespprof(mmforconly, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu);
%% Get max and mins
mins(1) = min(min(VOLOBJnewmeansortedcells));
mins(2) = min(min(VOLMOnewmeansortedcells));
mins(3) = min(min(FORCOBJnewmeansortedcells));
mins(4) = min(min(FORCMOnewmeansortedcells));   
maxs(1) = max(max(VOLOBJnewmeansortedcells));
maxs(2) = max(max(VOLMOnewmeansortedcells));
maxs(3) = max(max(FORCOBJnewmeansortedcells));
maxs(4) = max(max(FORCMOnewmeansortedcells));   
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
fig = figure(101);
sub1 = subplot(1,4,1)
imagesc(-2:binsize:7,[1:newlength],VOLOBJnewmeansortedcells);
colormap jet
hold on
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('Vol Obj Touch')
hold on;
sub2 = subplot(1,4,2);
imagesc(-2:binsize:7,[1:newlength],VOLMOnewmeansortedcells);
colormap jet
hold on
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('Vol Social Touch')
hold on;
sub3 = subplot(1,4,3);
imagesc(-2:binsize:7,[1:newlength],FORCOBJnewmeansortedcells);
colormap jet
hold on;
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub3,[minColorLimit,maxColorLimit]); 
title('Forc Obj Touch')
hold on;
sub4 = subplot(1,4,4);
imagesc(-2:binsize:7,[1:newlength],FORCMOnewmeansortedcells);
colormap jet
hold on
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub4,[minColorLimit,maxColorLimit]); 
title('Forc Social Touch')
h = axes(fig,'visible','off'); 
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
c.Label.String = 'Normalized firing rate';
caxis(h,[minColorLimit,maxColorLimit]);   
sgtitle('Single Cell Tuning to Each Touch')

%%
% Get max and mins S1

mins(1) = min(min(VOLOBJnewmeansortedcellsS1));
mins(2) = min(min(VOLMOnewmeansortedcellsS1));
mins(3) = min(min(FORCOBJnewmeansortedcellsS1));
mins(4) = min(min(FORCMOnewmeansortedcellsS1));   
maxs(1) = max(max(VOLOBJnewmeansortedcellsS1));
maxs(2) = max(max(VOLMOnewmeansortedcellsS1));
maxs(3) = max(max(FORCOBJnewmeansortedcellsS1));
maxs(4) = max(max(FORCMOnewmeansortedcellsS1));   
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
fig = figure(102);
sub1 = subplot(1,4,1)
imagesc(-2:binsize:7,[1:newlengthS1],VOLOBJnewmeansortedcellsS1);
colormap jet
hold on
plot([0,0],[0,(newlengthS1)],'--r')
plot([5,5],[0,(newlengthS1)],'--r')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('Vol Obj Touch')
hold on;
sub2 = subplot(1,4,2);
imagesc(-2:binsize:7,[1:newlengthS1],VOLMOnewmeansortedcellsS1);
colormap jet
hold on
plot([0,0],[0,(newlengthS1)],'--r')
plot([5,5],[0,(newlengthS1)],'--r')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('Vol Social Touch')
hold on;
sub3 = subplot(1,4,3);
imagesc(-2:binsize:7,[1:newlengthS1],FORCOBJnewmeansortedcellsS1);
colormap jet
hold on;
plot([0,0],[0,(newlengthS1)],'--r')
plot([5,5],[0,(newlengthS1)],'--r')
ylabel('Cell #')
caxis(sub3,[minColorLimit,maxColorLimit]); 
title('Forc Obj Touch')
hold on;
sub4 = subplot(1,4,4);
imagesc(-2:binsize:7,[1:newlengthS1],FORCMOnewmeansortedcellsS1);
colormap jet
hold on
plot([0,0],[0,(newlengthS1)],'--r')
plot([5,5],[0,(newlengthS1)],'--r')
ylabel('Cell #')
caxis(sub4,[minColorLimit,maxColorLimit]); 
title('Forc Social Touch')
h = axes(fig,'visible','off'); 
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
c.Label.String = 'Normalized firing rate';
caxis(h,[minColorLimit,maxColorLimit]);   
sgtitle('S1 Single Cell Tuning to Each Touch')
%%

% Get max and mins striatum

mins(1) = min(min(VOLOBJnewmeansortedcellsstr));
mins(2) = min(min(VOLMOnewmeansortedcellsstr));
mins(3) = min(min(FORCOBJnewmeansortedcellsstr));
mins(4) = min(min(FORCMOnewmeansortedcellsstr));   
maxs(1) = max(max(VOLOBJnewmeansortedcellsstr));
maxs(2) = max(max(VOLMOnewmeansortedcellsstr));
maxs(3) = max(max(FORCOBJnewmeansortedcellsstr));
maxs(4) = max(max(FORCMOnewmeansortedcellsstr));   
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
fig = figure(103);
sub1 = subplot(1,4,1)
imagesc(-2:binsize:7,[1:newlengthstr],VOLOBJnewmeansortedcellsstr);
colormap jet
hold on
plot([0,0],[0,(newlengthstr)],'--r')
plot([5,5],[0,(newlengthstr)],'--r')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('Vol Obj Touch')
hold on;
sub2 = subplot(1,4,2);
imagesc(-2:binsize:7,[1:newlengthstr],VOLMOnewmeansortedcellsstr);
colormap jet
hold on
plot([0,0],[0,(newlengthstr)],'--r')
plot([5,5],[0,(newlengthstr)],'--r')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('Vol Social Touch')
hold on;
sub3 = subplot(1,4,3);
imagesc(-2:binsize:7,[1:newlengthstr],FORCOBJnewmeansortedcellsstr);
colormap jet
hold on;
plot([0,0],[0,(newlengthstr)],'--r')
plot([5,5],[0,(newlengthstr)],'--r')
ylabel('Cell #')
caxis(sub3,[minColorLimit,maxColorLimit]); 
title('Forc Obj Touch')
hold on;
sub4 = subplot(1,4,4);
imagesc(-2:binsize:7,[1:newlengthstr],FORCMOnewmeansortedcellsstr);
colormap jet
hold on
plot([0,0],[0,(newlengthstr)],'--r')
plot([5,5],[0,(newlengthstr)],'--r')
ylabel('Cell #')
caxis(sub4,[minColorLimit,maxColorLimit]); 
title('Forc Social Touch')
h = axes(fig,'visible','off'); 
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
c.Label.String = 'Normalized firing rate';
caxis(h,[minColorLimit,maxColorLimit]);   
sgtitle('Striatum Single Cell Tuning to Each Touch')

%% Get max and mins BLA

mins(1) = min(min(VOLOBJnewmeansortedcellsbla));
mins(2) = min(min(VOLMOnewmeansortedcellsbla));
mins(3) = min(min(FORCOBJnewmeansortedcellsbla));
mins(4) = min(min(FORCMOnewmeansortedcellsbla));   
maxs(1) = max(max(VOLOBJnewmeansortedcellsbla));
maxs(2) = max(max(VOLMOnewmeansortedcellsbla));
maxs(3) = max(max(FORCOBJnewmeansortedcellsbla));
maxs(4) = max(max(FORCMOnewmeansortedcellsbla));   
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
fig = figure(104);
sub1 = subplot(1,4,1)
imagesc(-2:binsize:7,[1:newlengthbla],VOLOBJnewmeansortedcellsbla);
colormap jet
hold on
plot([0,0],[0,(newlengthbla)],'--r')
plot([5,5],[0,(newlengthbla)],'--r')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('Vol Obj Touch')
hold on;
sub2 = subplot(1,4,2);
imagesc(-2:binsize:7,[1:newlengthbla],VOLMOnewmeansortedcellsbla);
colormap jet
hold on
plot([0,0],[0,(newlengthbla)],'--r')
plot([5,5],[0,(newlengthbla)],'--r')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('Vol Social Touch')
hold on;
sub3 = subplot(1,4,3);
imagesc(-2:binsize:7,[1:newlengthbla],FORCOBJnewmeansortedcellsbla);
colormap jet
hold on;
plot([0,0],[0,(newlengthbla)],'--r')
plot([5,5],[0,(newlengthbla)],'--r')
ylabel('Cell #')
caxis(sub3,[minColorLimit,maxColorLimit]); 
title('Forc Obj Touch')
hold on;
sub4 = subplot(1,4,4);
imagesc(-2:binsize:7,[1:newlengthbla],FORCMOnewmeansortedcellsbla);
colormap jet
hold on
plot([0,0],[0,(newlengthbla)],'--r')
plot([5,5],[0,(newlengthbla)],'--r')
ylabel('Cell #')
caxis(sub4,[minColorLimit,maxColorLimit]); 
title('Forc Social Touch')
h = axes(fig,'visible','off'); 
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
c.Label.String = 'Normalized firing rate';
caxis(h,[minColorLimit,maxColorLimit]);   
sgtitle('BLA Single Cell Tuning to Each Touch')

%% Get max and mins for FORC ALL AND VOL ALL
mins(1) = min(min(VOLALLnewmeansortedcells));
mins(2) = min(min(FORCALLnewmeansortedcells));
maxs(1) = max(max(VOLALLnewmeansortedcells));
maxs(2) = max(max(FORCALLnewmeansortedcells));
   
minColorLimit = min(mins);
maxColorLimit = max(maxs);
%% Plot all in the same subplot
fig = figure(105);
sub1 = subplot(1,2,1)
imagesc(-2:binsize:7,[1:newlength],VOLALLnewmeansortedcells);
colormap jet
hold on
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub1,[minColorLimit,maxColorLimit]); 
title('Vol Touch')
hold on;
sub2 = subplot(1,2,2);
imagesc(-2:binsize:7,[1:newlength],FORCALLnewmeansortedcells);
colormap jet
hold on
plot([0,0],[0,(newlength)],'--r')
plot([5,5],[0,(newlength)],'--r')
ylabel('Cell #')
caxis(sub2,[minColorLimit,maxColorLimit]); 
title('Forc Touch')
h = axes(fig,'visible','off'); 
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
c.Label.String = 'Normalized firing rate';
caxis(h,[minColorLimit,maxColorLimit]);   
sgtitle('Single Cell Tuning to Each Touch')


%% Get waves for all cells
waves = {};


%%
for c = 1:length(goodtruclu)
    sp = newspksamps{c};
    sp50 = sp(1:min(50, length(sp)));
    numsps = length(sp50);
    wvs = zeros([length(chmap),numsps,length(indx)]);
    for s = 1:50   
        wvs(:,s,:) = out1.Data.data(1:length(chmap), sp50(s)+indx(1):sp50(s)+indx(end));
    end
    wvs = squeeze(mean(wvs,2));
    wvs = filtfilt(z,p,wvs');
    [~,i] = max((max(abs(wvs))));
    chdepth(c) = chpos(i,2);
    for a = 1:size(wvs,2)
        chmin(a) = min(wvs(:,a));
        chminindx = find(wvs(:,a) == chmin(a));
        chmax(a) = max(wvs(chminindx:end,a));
        chdiff(a) = imabsdiff(chmax(a),chmin(a));
    end
    bestchan = find(chdiff == max(chdiff));
    waves{c} = wvs;
    bestwave{c} = wvs(:,bestchan);
    if size(bestwave{c},2)>1
        bestwave{c} = [];
        bestwave{c} = wvs(:,bestchan(1));
    end
    fr(c) = length(sp)/1094.73;
    righttrialspks{c} = trialspks{c};
    rightfr{c} = mmall{c};
    rightfullfr{c} = mmwhole{c};
    maxfr(c) = mean(rightfr{c}(50:175));
    meandurfr(c) = mean(rightfr{c}(50:125));
    meanbeffr(c) = mean(rightfr{c}(1:49));
    for a = 1:40
        sprate{c}(a) = length(righttrialspks{c}{a})/2;
    end
    sptrrate(c) = mean(sprate{c});
    disp(c)
end

% %%
% % %%
% % % for c = 1:length(waves)
% % % mean_2D_waveform(c,:) = squeeze(nanmean(waves{c}(:, chmap+1)'));
% % % [meanmin(c), minindx] = min(mean_2D_waveform(c,1:40));
% % % meanmax(c) = max(mean_2D_waveform(c,minindx:61));
% % % maxindx = find(mean_2D_waveform(c,:) == meanmax(c));
% % % meanwidth(c) = maxindx-minindx;
% % % % % meanratio(c) = abs(meanmax(c))/(abs(meanmin(c)));
% % % % % %figure(c); plot(mean_2D_waveform(c,:)); hold on; plot(minindx,meanmin); hold on; plot(maxindx,meanmax);
% % % % % % end

%% Single Channel Waveform Properties
for c = 1:length(bestwave)
meanmin(c) = min(bestwave{c});
minindx = find(bestwave{c} == meanmin(c));
minindx = minindx(1);
meanmax(c) = max(bestwave{c}(minindx:60));
maxindx = find(bestwave{c} == meanmax(c));
maxindx = maxindx(1);
meanwidth(c) = maxindx-minindx;
meanratio(c) = abs(meanmax(c))/(abs(meanmin(c)));
bestwavevolts = (bestwave{c}*0.6/8192/80)*10^3;
voltmax = max(bestwavevolts(minindx:end));
voltmax = voltmax(1);
voltmin = min(bestwavevolts);
voltmin = voltmin(1);
meanamp(c) = imabsdiff(voltmax,voltmin);
xrepol = minindx:minindx+15; % 15 samples = 0.5 ms
yrepol = bestwave{c}(minindx:minindx+15)';
repslope = polyfit(xrepol, yrepol, 1);
meanrepslope(c) = repslope(1);
xrecov = maxindx:maxindx+15; % 15 samples = 0.5 ms
yrecov = bestwave{c}(maxindx:maxindx+15)';
recoslope = polyfit(xrecov, yrecov, 1);
meanrecoslope(c) = recoslope(1);
%figure(c); plot(mean_2D_waveform(c,:)); hold on; plot(minindx,meanmin); hold on; plot(maxindx,meanmax);
end

%% get waves and width for all regions
allwidths = meanwidth/30000*10^6;
% S1

S1good = find(goodcludepths >= S1depths(1) & goodcludepths <= S1depths(end));
S1goodcludepths = goodcludepths(S1good);

for c = 1:length(S1good)
s1waves{c} = bestwave{S1good(c)};
end
% 
% L23S1good = find(S1goodcludepths >= L23S1depths(1) & S1goodcludepths <= L23S1depths(end));
% L4S1good = find(S1goodcludepths >= L4S1depths(1) & S1goodcludepths <= L4S1depths(end));
% L56S1good = find(S1goodcludepths >= L56S1depths(1) & S1goodcludepths <= L56S1depths(end));
% 
% S1layer(1:length(S1goodcludepths)) = "L2/3";
% S1layer(L4S1good) = "L4";
% S1layer(L56S1good) = "L5/6";

s1width = meanwidth(S1good)/30000*10^3;
s1ratio = 1./meanratio(S1good);

%striatum

strgood = find(goodcludepths >= striataldepths(1) & goodcludepths <= striataldepths(end));

for c = 1:length(strgood)
strwaves{c} = bestwave{strgood(c)};
end

strwidth = meanwidth(strgood)/30000*10^3;
strratio = 1./meanratio(strgood);

%bla

blagood = find(goodcludepths >= bladepths(1) & goodcludepths <= bladepths(end));

for c = 1:length(blagood)
blawaves{c} = bestwave{blagood(c)};
end

blawidth = meanwidth(blagood)/30000*10^3;
blaratio = 1./meanratio(blagood);

%%
trialspks = {};


wpre = 2.5; 
wpost = 7.5;
 
for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:160
        o = stimonsets(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    trialspks{c} = tmp;
end


%%
% trialspks = {};
% 
% 
% wpre = 2.5; 
% wpost = 7.5;
%  
% for c = 1:length(goodtruclu)
%     sp = newspks{c};
%     tmp = {};
%     for itrial = 81:120
%         o = stimonsets(itrial);
%         tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
%     end
%     trialspks{c} = tmp;
% end
% 
% 
%     fig = figure(103);
%     clf
%     plotRastergram(trialspks{S1good(34)});hold all
%     plot([0,0],[81,120],'--r')
%     plot([5,5],[81,120],'--r')
%     axis([-2,7,81,120])
% 
%     trialspks = {};
% 
% 
% wpre = 2.5; 
% wpost = 7.5;
%  
% for c = 1:length(goodtruclu)
%     sp = newspks{c};
%     tmp = {};
%     for itrial = 121:160
%         o = stimonsets(itrial);
%         tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
%     end
%     trialspks{c} = tmp;
% end
% 
% 
%     fig = figure(104);
%     clf
%     plotRastergram(trialspks{S1good(34)});hold all
%     plot([0,0],[121,160],'--r')
%     plot([5,5],[121,160],'--r')
%     axis([-2,7,121,160])
%% full spks for each trial
fullspks = {};

wpre = 5; 
wpost = 10;
 
for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:160
        o = stimonsets(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    fullspks{c} = tmp;
end

%% spont spks for base fifring

spontspks = {};
spontspks2 = {};

wpre = 0; 
wpost = 60;

onset1(1) = stimonsets(1)-240;
onset2(1) = stimonsets(81)-240;
 
for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset1(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    spontspks{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset2(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    spontspks2{c} = tmp;
end

%%
tracespks = {};

 
for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    i = 1;
    for itrial = 1:4
        o = stimonsets(i);
        wpre = 120; 
        wpost = 412;
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
        i = i+40;
    end
    tracespks{c} = tmp;
end

%%
allspksVOLOBJ = {};
allspksVOLMO = {};
allspksFORCOBJ = {};
allspksFORCMO = {};


wpre = 2; 
i = 1;
for a = 1:4
    diffbystim(a) = (stimonsets(i+39)- stimonsets(i)) + 7;
    i = i+40;
end

wpost = diffbystim;


%



for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    i = 1;
    for itrial = 1
        o = stimonsets(i);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost(1))))-o);
    end
    allspksVOLOBJ{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    i = 41;
    for itrial = 1
        o = stimonsets(i);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost(2))))-o);
    end
    allspksVOLMO{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    i = 81;
    for itrial = 1
        o = stimonsets(i);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost(3))))-o);
    end
    allspksFORCOBJ{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    i = 121;
    for itrial = 1
        o = stimonsets(i);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost(4))))-o);
    end
    allspksFORCMO{c} = tmp;
end

wposteach = diffbystim;

%%
%% spont spks for base fifring

befspks = {};
befspks2 = {};
befspks3 = {};
befspks4 = {};

wpre = 0; 
wpost = 60;

onset1(1) = stimonsets(1)-120;
onset2(1) = stimonsets(41)-120;
onset3(1) = stimonsets(81)-120;
onset4(1) = stimonsets(121)-120;
 
for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset1(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    befspks{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset2(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    befspks2{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset3(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    befspks3{c} = tmp;
end

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1
        o = onset4(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    befspks4{c} = tmp;
end


%%
modspks = {};


% wpre = 5; 
wpost = 5;

wpre(1:160) = 0;

stimdiff = diff(stimonsets);

for a = 1:length(stimonsets) 
    if stimonsets(a) == stimonsets(1) | stimonsets(a) == stimonsets(41) | stimonsets(a) == stimonsets(81) | stimonsets(a) == stimonsets(121)
        wpre(a) = 5;
    else
        wpre(a) = stimdiff(a-1)-5;
    end
end
        

for c = 1:length(goodtruclu)
    sp = newspks{c};
    tmp = {};
    for itrial = 1:160
        o = stimonsets(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre(itrial)) & (sp<o+wpost)))-o);
    end
    modspks{c} = tmp;
end



%%

%%
clear newmm
for c = 1:length(goodtruclu)
    binsize = 0.05;
    k = alpha_func(1,1,25,1/binsize,1000);
    k = [k*0,k];
    k = k/sum(k);
    bsp = convolve_spiketrains(trialspks{c},binsize,[-2,7],k)./binsize;
    bspspont = convolve_spiketrains(spontspks{c},binsize,[0,60],k)./binsize;
    bspspont2 = convolve_spiketrains(spontspks2{c},binsize,[0,60],k)./binsize;
%     bspbase = convolve_spiketrains(basespks{c},binsize,[0,9],k)./binsize;
%     bsp2 = convolve_spiketrains(spontspks{c},binsize,[0,5],k)./binsize;
% %     bspfano = convolve_spiketrains(trialspks{c},binsize3,[-1.5,2.5],k3)./binsize3;
%     bsps2 = bspbase; 
%     bspspont = bsps2(:);
    bspfull = convolve_spiketrains(fullspks{c},binsize,[-4,5],k)./binsize;
    bspfullalt = convolve_spiketrains(fullspks{c},binsize,[-2,7],k)./binsize;
    bsptrace = convolve_spiketrains(tracespks{c},binsize,[-120,412],k)./binsize;
    bspmod = convolve_spiketrains(modspks{c},binsize,[-6,5],k)./binsize;
    bspmodpeak = convolve_spiketrains(trialspks{c},binsize,[-2,7],k)./binsize;
    bspbins = convolve_spiketrains(trialspks{c},binsize,[-2.5,7.5],k)./binsize;
    bspbinsreal = bspbins(:,11:191);
    binsizeall = 1/60;
    k = alpha_func(1,1,25,1/binsizeall,1000);
    k = [k*0,k];
    k = k/sum(k);
    bspallVOLOBJ{c} = convolve_spiketrains(allspksVOLOBJ{c},binsizeall,[-2,wposteach(1)],k)./binsizeall;
    bspallVOLMO{c} = convolve_spiketrains(allspksVOLMO{c},binsizeall,[-2,wposteach(2)],k)./binsizeall;
    bspallFORCOBJ{c} = convolve_spiketrains(allspksFORCOBJ{c},binsizeall,[-2,wposteach(3)],k)./binsizeall;
    bspallFORCMO{c} = convolve_spiketrains(allspksFORCMO{c},binsizeall,[-2,wposteach(4)],k)./binsizeall;
    binsize500 = 0.5;
    k500 = alpha_func(1,1,25,1/binsize500,1000);
    k500 = [k500*0,k500];
    k500 = k500/sum(k500);
    bsp500 = convolve_spiketrains(trialspks{c},binsize500,[-2,7],k500)./binsize500;
    bspfull500 = convolve_spiketrains(fullspks{c},binsize500,[-4,5],k500)./binsize500;
    bspbins500 = convolve_spiketrains(trialspks{c},binsize500,[-3,8],k500)./binsize500;
    bspbinsreal500 = bspbins500(:,2:20);
    bspspont500 = convolve_spiketrains(spontspks{c},binsize500,[0,60],k500)./binsize500;
    bspbef1 = convolve_spiketrains(befspks{c},binsize,[0,60],k)./binsize;
    bspbef2 = convolve_spiketrains(befspks2{c},binsize,[0,60],k)./binsize;
    bspbef3 = convolve_spiketrains(befspks3{c},binsize,[0,60],k)./binsize;
    bspbef4 = convolve_spiketrains(befspks4{c},binsize,[0,60],k)./binsize;




    alltrace{c} = bsptrace;
    
    for a = 1:160
    bspmeanallstims(c,a) = mean(bsp(a,41:140));
    end 

    bspratioVOL(c) = mean(bspmeanallstims(c,41:80))./mean(bspmeanallstims(c,1:40));
    bspratioFORC(c) = mean(bspmeanallstims(c,121:160))./mean(bspmeanallstims(c,81:120));

    bspallstims{c} = bspfull(:,1:180);
    bspallaltstims{c} = bspfullalt(:,1:180);
    bspallmodstims{c} = bspmod(:,1:220);

    bspbytrialstims{c} = bsp(1:160,:);

    %average of all 40 trials for each cells
    bspaverageVOLobj(:,c) = nanmean(nanmean(bsp(1:40,36:140)'));
    bspaverageVOLsoc(:,c) = nanmean(nanmean(bsp(41:80,36:140)'));
    bspaverageFORCobj(:,c) = nanmean(nanmean(bsp(81:120,36:140)'));
    bspaverageFORCsoc(:,c) = nanmean(nanmean(bsp(121:160,36:140)'));
    
    for a = 1:20
    bspeachstimVOLobj(c,a) = max(bsp(a,21:140));
    bspeachstimVOLsoc(c,a) = max(bsp(a+40,21:140));
    bspeachstimFORCobj(c,a) = max(bsp(a+80,21:140));
    bspeachstimFORCsoc(c,a) = max(bsp(a+120,21:140));
    end


    VOLobjfit = polyfit(1:20, bspeachstimVOLobj(c,:),1);
    VOLsocfit = polyfit(1:20, bspeachstimVOLsoc(c,:),1);
    bspslopestimVOLobj(c) = VOLobjfit(1);
    bspslopestimVOLsoc(c) = VOLsocfit(1);
    FORCobjfit = polyfit(1:20, bspeachstimFORCobj(c,:),1);
    FORCsocfit = polyfit(1:20, bspeachstimFORCsoc(c,:),1);
    bspslopestimFORCobj(c) = FORCobjfit(1);
    bspslopestimFORCsoc(c) = FORCsocfit(1);

    bspspontavg1st(c) = nanmean(bspspont(200:1000));
    bspspontavg2nd(c) = nanmean(bspspont2(200:1000));


    for j = 1:40
        bspzVOLobj(j,:) = ((bsp(j,1:181)) - (nanmean(nanmean(bspfull(1:40,1:60)))))/(nanstd(nanmean(bspfull(1:40,1:60))));
        bspzVOLsoc(j,:) = ((bsp(j+40,1:181)) - (nanmean(nanmean(bspfull(41:80,1:60)))))/(nanstd(nanmean(bspfull(41:80,1:60))));
        bspzFORCobj(j,:) = ((bsp(j+80,1:181)) - (nanmean(nanmean(bspfull(81:120,1:60)))))/(nanstd(nanmean(bspfull(81:120,1:60))));
        bspzFORCsoc(j,:) = ((bsp(j+120,1:181)) - (nanmean(nanmean(bspfull(121:160,1:60)))))/(nanstd(nanmean(bspfull(121:160,1:60))));
    end

%     for j = 1:40
%         bspVOLobj(j,:) = ((bsp(j,1:181));
%         bspVOLsoc(j,:) = ((bsp(j+40,1:181));
%         bspFORCobj(j,:) = ((bsp(j+80,1:181));
%         bspFORCsoc(j,:) = ((bsp(j+120,1:181));
%     end



    for j = 1:40
        bsp500zVOLobj(j,:) = ((bsp500(j,1:19)) - (nanmean(nanmean(bspfull500(1:40,1:6)))))/(nanstd(nanmean(bspfull500(1:40,1:6))));
        bsp500zVOLsoc(j,:) = ((bsp500(j+40,1:19)) - (nanmean(nanmean(bspfull500(41:80,1:6)))))/(nanstd(nanmean(bspfull500(41:80,1:6))));
        bsp500zFORCobj(j,:) = ((bsp500(j+80,1:19)) - (nanmean(nanmean(bspfull500(81:120,1:6)))))/(nanstd(nanmean(bspfull500(81:120,1:6))));
        bsp500zFORCsoc(j,:) = ((bsp500(j+120,1:19)) - (nanmean(nanmean(bspfull500(121:160,1:6)))))/(nanstd(nanmean(bspfull500(121:160,1:6))));
    end


    for j = 1:40
        bspspksVOLobj(j,:) = (bsp(j,1:181));
        bspspksVOLsoc(j,:) = (bsp(j+40,1:181));
        bspspksFORCobj(j,:) = (bsp(j+80,1:181));
        bspspksFORCsoc(j,:) = (bsp(j+120,1:181));
    end

    for n = 1:size(bspzFORCobj,1)
        bspzFORCtrobj(c,n) = nanmean(bspzFORCobj(n,40:140));
    end

    for n = 1:size(bspzFORCsoc,1)
        bspzFORCtrsoc(c,n) = nanmean(bspzFORCsoc(n,40:140));
    end

    for n = 1:size(bspzFORCobj,1)
        bspzVOLtrobj(c,n) = nanmean(bspzVOLobj(n,40:140));
    end

    for n = 1:size(bspzFORCsoc,1)
        bspzVOLtrsoc(c,n) = nanmean(bspzVOLsoc(n,40:140));
    end


    % get spikes alone

    for n = 1:40
        bspSPFORCtrobj(c,n) = nanmean(bsp(n+80,40:100));
    end

    for n = 1:40
        bspSPFORCtrsoc(c,n) = nanmean(bsp(n+120,40:100));
    end

    for n = 1:40
        bspSPVOLtrobj(c,n) = nanmean(bsp(n,40:100));
    end

    for n = 1:40
        bspSPVOLtrsoc(c,n) = nanmean(bsp(n+40,40:100));
    end

    % get spikes alone by bin


    bspBINSPFORCtrobj{c} = bspbinsreal(81:120,:);
    bspBINSPFORCtrsoc{c} = bspbinsreal(121:160,:);
    bspBINSPVOLtrobj{c} = bspbinsreal(1:40,:);
    bspBINSPVOLtrsoc{c} = bspbinsreal(41:80,:);

    bsp500BINSPFORCtrobj{c} = bspbinsreal500(81:120,:);
    bsp500BINSPFORCtrsoc{c} = bspbinsreal500(121:160,:);
    bsp500BINSPVOLtrobj{c} = bspbinsreal500(1:40,:);
    bsp500BINSPVOLtrsoc{c} = bspbinsreal500(41:80,:);

    for j = 1:40
        bspzBINSVOLobj(j,:) = ((bspbinsreal(j,:)) - (nanmean(bspspont)))/(nanstd(bspspont));
        bspzBINSVOLsoc(j,:) = ((bspbinsreal(j+40,:)) - (nanmean(bspspont)))/(nanstd(bspspont));
        bspzBINSFORCobj(j,:) = ((bspbinsreal(j+80,:)) - (nanmean(bspspont)))/(nanstd(bspspont));
        bspzBINSFORCsoc(j,:) = ((bspbinsreal(j+120,:)) - (nanmean(bspspont)))/(nanstd(bspspont));
    end

    for j = 1:40
        bsp500zBINSVOLobj(j,:) = ((bspbinsreal500(j,:)) - (nanmean(bspspont500)))/(nanstd(bspspont500));
        bsp500zBINSVOLsoc(j,:) = ((bspbinsreal500(j+40,:)) - (nanmean(bspspont500)))/(nanstd(bspspont500));
        bsp500zBINSFORCobj(j,:) = ((bspbinsreal500(j+80,:)) - (nanmean(bspspont500)))/(nanstd(bspspont500));
        bsp500zBINSFORCsoc(j,:) = ((bspbinsreal500(j+120,:)) - (nanmean(bspspont500)))/(nanstd(bspspont500));
    end

    bsp500BINZFORCtrobj{c} = bsp500zBINSFORCobj;
    bsp500BINZFORCtrsoc{c} = bsp500zBINSFORCsoc;
    bsp500BINZVOLtrobj{c} = bsp500zBINSVOLobj;
    bsp500BINZVOLtrsoc{c} = bsp500zBINSVOLsoc;

    bspBINZFORCtrobj{c} = bspzBINSFORCobj;
    bspBINZFORCtrsoc{c} = bspzBINSFORCsoc;
    bspBINZVOLtrobj{c} = bspzBINSVOLobj;
    bspBINZVOLtrsoc{c} = bspzBINSVOLsoc;

    bspBINZISIFORCtrobj{c} = bspzFORCobj;
    bspBINZISIFORCtrsoc{c} = bspzFORCsoc;
    bspBINZISIVOLtrobj{c} = bspzVOLobj;
    bspBINZISIVOLtrsoc{c} = bspzVOLsoc;

    bsp500BINZISIFORCtrobj{c} = bsp500zFORCobj;
    bsp500BINZISIFORCtrsoc{c} = bsp500zFORCsoc;
    bsp500BINZISIVOLtrobj{c} = bsp500zVOLobj;
    bsp500BINZISIVOLtrsoc{c} = bsp500zVOLsoc;

     
     bspzaverageVOLobj(c,:) = mean(bspzVOLobj);
     bspzaverageVOLsoc(c,:) = mean(bspzVOLsoc);
     bspzaverageFORCobj(c,:) = mean(bspzFORCobj);
     bspzaverageFORCsoc(c,:) = mean(bspzFORCsoc);

    bspspaverageVOLobj(c,:) = mean(bsp(1:40,:));
    bspspaverageVOLsoc(c,:) = mean(bsp(41:80,:));
    bspspaverageFORCobj(c,:) = mean(bsp(81:120,:));
    bspspaverageFORCsoc(c,:) = mean(bsp(121:160,:));

%
%
%Get for all stims of FORC vs VOL
    for j = 1:80
        bspzVOLall(j,:) = ((bsp(j,1:181)) - (nanmean(nanmean(bspfull(1:80,1:60)))))/(nanstd(nanmean(bspfull(1:80,1:60))));
        bspzFORCall(j,:) = ((bsp(j+80,1:181)) - (nanmean(nanmean(bspfull(81:160,1:60)))))/(nanstd(nanmean(bspfull(81:160,1:60))));
    end

     bspzaverageVOLALL(c,:) = mean(bspzVOLall);
     bspzaverageFORCALL(c,:) = mean(bspzFORCall);
  
     bspspaverageVOLALL(c,:) = mean(bsp(1:80,:));
     bspspaverageFORCALL(c,:) = mean(bsp(81:160,:));

%Modulation index
%     for h = 1:160
%         bspmodISI(c,h) = mean(bspmod(h,ceil((6/0.05)-(wpre(h)/0.05)):round((6/0.05)-(wpre(h)/0.05)+(wpre(h)/0.05))));
%         bspmodstim(c,h) = mean(bspmod(h,round((6/0.05)-(wpre(h)/0.05)+(wpre(h)/0.05))+1:round((6/0.05)-(wpre(h)/0.05)+(wpre(h)/0.05)+101)));
%     end
%     
%     for l = 1:40
%         bspmodindexVOLOBJ(c,l) = (((bspmodstim(c,l))-(bspmodISI(c,l))))/(((bspmodstim(c,l))+(bspmodISI(c,l))));
%         bspmodindexVOLMO(c,l) = (((bspmodstim(c,l+40))-(bspmodISI(c,l+40))))/(((bspmodstim(c,l+40))+(bspmodISI(c,l+40))));
%         bspmodindexFORCOBJ(c,l) = (((bspmodstim(c,l+80))-(bspmodISI(c,l+80))))/(((bspmodstim(c,l+80))+(bspmodISI(c,l+80))));
%         bspmodindexFORCMO(c,l) = (((bspmodstim(c,l+120))-(bspmodISI(c,l+120))))/(((bspmodstim(c,l+120))+(bspmodISI(c,l+120))));
%         if isnan(bspmodindexVOLOBJ(c,l)) == 1
%             bspmodindexVOLOBJ(c,l) = 0;
%         end
%         if isnan(bspmodindexFORCOBJ(c,l)) == 1
%             bspmodindexFORCOBJ(c,l) = 0;
%         end
%         if isnan(bspmodindexVOLMO(c,l)) == 1
%             bspmodindexVOLMO(c,l) = 0;
%         end
%         if isnan(bspmodindexFORCMO(c,l)) == 1
%             bspmodindexFORCMO(c,l) = 0;
%         end
%     end

%Modulation index

    for h = 1:160
        bspmodPLATISI(c,h) = mean(bspmod(h,40:80));
        bspmodPLATstim(c,h) = mean(bspmod(h,100:140));
    end
    
    for l = 1:40
        bspmodPLATindexVOLOBJ(c,l) = (((bspmodPLATstim(c,l))-(bspmodPLATISI(c,l))))/(((bspmodPLATstim(c,l))+(bspmodPLATISI(c,l))));
        bspmodPLATindexVOLMO(c,l) = (((bspmodPLATstim(c,l+40))-(bspmodPLATISI(c,l+40))))/(((bspmodPLATstim(c,l+40))+(bspmodPLATISI(c,l+40))));
        bspmodPLATindexFORCOBJ(c,l) = (((bspmodPLATstim(c,l+80))-(bspmodPLATISI(c,l+80))))/(((bspmodPLATstim(c,l+80))+(bspmodPLATISI(c,l+80))));
        bspmodPLATindexFORCMO(c,l) = (((bspmodPLATstim(c,l+120))-(bspmodPLATISI(c,l+120))))/(((bspmodPLATstim(c,l+120))+(bspmodPLATISI(c,l+120))));
        if isnan(bspmodPLATindexVOLOBJ(c,l)) == 1
            bspmodPLATindexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATindexFORCOBJ(c,l)) == 1
            bspmodPLATindexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATindexVOLMO(c,l)) == 1
            bspmodPLATindexVOLMO(c,l) = 0;
        end
        if isnan(bspmodPLATindexFORCMO(c,l)) == 1
            bspmodPLATindexFORCMO(c,l) = 0;
        end
    end

    for h = 1:160
        bspmodSHORTSTIMISI(c,h) = mean(bspmod(h,40:99));
        bspmodSHORTSTIMstim(c,h) = mean(bspmod(h,100:159));
    end
    
    for l = 1:40
        bspmodSHORTSTIMindexVOLOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l))-(bspmodSHORTSTIMISI(c,l))))/(((bspmodSHORTSTIMstim(c,l))+(bspmodSHORTSTIMISI(c,l))));
        bspmodSHORTSTIMindexVOLMO(c,l) = (((bspmodSHORTSTIMstim(c,l+40))-(bspmodSHORTSTIMISI(c,l+40))))/(((bspmodSHORTSTIMstim(c,l+40))+(bspmodSHORTSTIMISI(c,l+40))));
        bspmodSHORTSTIMindexFORCOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l+80))-(bspmodSHORTSTIMISI(c,l+80))))/(((bspmodSHORTSTIMstim(c,l+80))+(bspmodSHORTSTIMISI(c,l+80))));
        bspmodSHORTSTIMindexFORCMO(c,l) = (((bspmodSHORTSTIMstim(c,l+120))-(bspmodSHORTSTIMISI(c,l+120))))/(((bspmodSHORTSTIMstim(c,l+120))+(bspmodSHORTSTIMISI(c,l+120))));
        if isnan(bspmodSHORTSTIMindexVOLOBJ(c,l)) == 1
            bspmodSHORTSTIMindexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMindexFORCOBJ(c,l)) == 1
            bspmodSHORTSTIMindexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMindexVOLMO(c,l)) == 1
            bspmodSHORTSTIMindexVOLMO(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMindexFORCMO(c,l)) == 1
            bspmodSHORTSTIMindexFORCMO(c,l) = 0;
        end
    end


%     for l = 1:10
%         bspmodFIRST10indexVOLOBJ(c,l) = (((bspmodstim(c,l))-(bspmodISI(c,l))))/(((bspmodstim(c,l))+(bspmodISI(c,l))));
%         bspmodFIRST10indexVOLMO(c,l) = (((bspmodstim(c,l+40))-(bspmodISI(c,l+40))))/(((bspmodstim(c,l+40))+(bspmodISI(c,l+40))));
%         bspmodFIRST10indexFORCOBJ(c,l) = (((bspmodstim(c,l+80))-(bspmodISI(c,l+80))))/(((bspmodstim(c,l+80))+(bspmodISI(c,l+80))));
%         bspmodFIRST10indexFORCMO(c,l) = (((bspmodstim(c,l+120))-(bspmodISI(c,l+120))))/(((bspmodstim(c,l+120))+(bspmodISI(c,l+120))));
%         if isnan(bspmodFIRST10indexVOLOBJ(c,l)) == 1
%             bspmodFIRST10indexVOLOBJ(c,l) = 0;
%         end
%         if isnan(bspmodFIRST10indexFORCOBJ(c,l)) == 1
%             bspmodFIRST10indexFORCOBJ(c,l) = 0;
%         end
%         if isnan(bspmodFIRST10indexVOLMO(c,l)) == 1
%             bspmodFIRST10indexVOLMO(c,l) = 0;
%         end
%         if isnan(bspmodFIRST10indexFORCMO(c,l)) == 1
%             bspmodFIRST10indexFORCMO(c,l) = 0;
%         end
%     end

    for l = 1:10
        bspmodPLATFIRST10indexVOLOBJ(c,l) = (((bspmodPLATstim(c,l))-(bspmodPLATISI(c,l))))/(((bspmodPLATstim(c,l))+(bspmodPLATISI(c,l))));
        bspmodPLATFIRST10indexVOLMO(c,l) = (((bspmodPLATstim(c,l+40))-(bspmodPLATISI(c,l+40))))/(((bspmodPLATstim(c,l+40))+(bspmodPLATISI(c,l+40))));
        bspmodPLATFIRST10indexFORCOBJ(c,l) = (((bspmodPLATstim(c,l+80))-(bspmodPLATISI(c,l+80))))/(((bspmodPLATstim(c,l+80))+(bspmodPLATISI(c,l+80))));
        bspmodPLATFIRST10indexFORCMO(c,l) = (((bspmodPLATstim(c,l+120))-(bspmodPLATISI(c,l+120))))/(((bspmodPLATstim(c,l+120))+(bspmodPLATISI(c,l+120))));
        if isnan(bspmodPLATFIRST10indexVOLOBJ(c,l)) == 1
            bspmodPLATFIRST10indexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST10indexFORCOBJ(c,l)) == 1
            bspmodPLATFIRST10indexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST10indexVOLMO(c,l)) == 1
            bspmodPLATFIRST10indexVOLMO(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST10indexFORCMO(c,l)) == 1
            bspmodPLATFIRST10indexFORCMO(c,l) = 0;
        end
    end

    for l = 1:10
        bspmodSHORTSTIMFIRST10indexVOLOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l))-(bspmodSHORTSTIMISI(c,l))))/(((bspmodSHORTSTIMstim(c,l))+(bspmodSHORTSTIMISI(c,l))));
        bspmodSHORTSTIMFIRST10indexVOLMO(c,l) = (((bspmodSHORTSTIMstim(c,l+40))-(bspmodSHORTSTIMISI(c,l+40))))/(((bspmodSHORTSTIMstim(c,l+40))+(bspmodSHORTSTIMISI(c,l+40))));
        bspmodSHORTSTIMFIRST10indexFORCOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l+80))-(bspmodSHORTSTIMISI(c,l+80))))/(((bspmodSHORTSTIMstim(c,l+80))+(bspmodSHORTSTIMISI(c,l+80))));
        bspmodSHORTSTIMFIRST10indexFORCMO(c,l) = (((bspmodSHORTSTIMstim(c,l+120))-(bspmodSHORTSTIMISI(c,l+120))))/(((bspmodSHORTSTIMstim(c,l+120))+(bspmodSHORTSTIMISI(c,l+120))));
        if isnan(bspmodSHORTSTIMFIRST10indexVOLOBJ(c,l)) == 1
            bspmodSHORTSTIMFIRST10indexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST10indexFORCOBJ(c,l)) == 1
            bspmodSHORTSTIMFIRST10indexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST10indexVOLMO(c,l)) == 1
            bspmodSHORTSTIMFIRST10indexVOLMO(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST10indexFORCMO(c,l)) == 1
            bspmodSHORTSTIMFIRST10indexFORCMO(c,l) = 0;
        end
    end

%         for l = 1:5
%         bspmodFIRST5indexVOLOBJ(c,l) = (((bspmodstim(c,l))-(bspmodISI(c,l))))/(((bspmodstim(c,l))+(bspmodISI(c,l))));
%         bspmodFIRST5indexVOLMO(c,l) = (((bspmodstim(c,l+40))-(bspmodISI(c,l+40))))/(((bspmodstim(c,l+40))+(bspmodISI(c,l+40))));
%         bspmodFIRST5indexFORCOBJ(c,l) = (((bspmodstim(c,l+80))-(bspmodISI(c,l+80))))/(((bspmodstim(c,l+80))+(bspmodISI(c,l+80))));
%         bspmodFIRST5indexFORCMO(c,l) = (((bspmodstim(c,l+120))-(bspmodISI(c,l+120))))/(((bspmodstim(c,l+120))+(bspmodISI(c,l+120))));
%         if isnan(bspmodFIRST5indexVOLOBJ(c,l)) == 1
%             bspmodFIRST5indexVOLOBJ(c,l) = 0;
%         end
%         if isnan(bspmodFIRST5indexFORCOBJ(c,l)) == 1
%             bspmodFIRST5indexFORCOBJ(c,l) = 0;
%         end
%         if isnan(bspmodFIRST5indexVOLMO(c,l)) == 1
%             bspmodFIRST5indexVOLMO(c,l) = 0;
%         end
%         if isnan(bspmodFIRST5indexFORCMO(c,l)) == 1
%             bspmodFIRST5indexFORCMO(c,l) = 0;
%         end
%     end

    for l = 1:5
        bspmodPLATFIRST5indexVOLOBJ(c,l) = (((bspmodPLATstim(c,l))-(bspmodPLATISI(c,l))))/(((bspmodPLATstim(c,l))+(bspmodPLATISI(c,l))));
        bspmodPLATFIRST5indexVOLMO(c,l) = (((bspmodPLATstim(c,l+40))-(bspmodPLATISI(c,l+40))))/(((bspmodPLATstim(c,l+40))+(bspmodPLATISI(c,l+40))));
        bspmodPLATFIRST5indexFORCOBJ(c,l) = (((bspmodPLATstim(c,l+80))-(bspmodPLATISI(c,l+80))))/(((bspmodPLATstim(c,l+80))+(bspmodPLATISI(c,l+80))));
        bspmodPLATFIRST5indexFORCMO(c,l) = (((bspmodPLATstim(c,l+120))-(bspmodPLATISI(c,l+120))))/(((bspmodPLATstim(c,l+120))+(bspmodPLATISI(c,l+120))));
        if isnan(bspmodPLATFIRST5indexVOLOBJ(c,l)) == 1
            bspmodPLATFIRST5indexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST5indexFORCOBJ(c,l)) == 1
            bspmodPLATFIRST5indexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST5indexVOLMO(c,l)) == 1
            bspmodPLATFIRST5indexVOLMO(c,l) = 0;
        end
        if isnan(bspmodPLATFIRST5indexFORCMO(c,l)) == 1
            bspmodPLATFIRST5indexFORCMO(c,l) = 0;
        end
    end

    for l = 1:5
        bspmodSHORTSTIMFIRST5indexVOLOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l))-(bspmodSHORTSTIMISI(c,l))))/(((bspmodSHORTSTIMstim(c,l))+(bspmodSHORTSTIMISI(c,l))));
        bspmodSHORTSTIMFIRST5indexVOLMO(c,l) = (((bspmodSHORTSTIMstim(c,l+40))-(bspmodSHORTSTIMISI(c,l+40))))/(((bspmodSHORTSTIMstim(c,l+40))+(bspmodSHORTSTIMISI(c,l+40))));
        bspmodSHORTSTIMFIRST5indexFORCOBJ(c,l) = (((bspmodSHORTSTIMstim(c,l+80))-(bspmodSHORTSTIMISI(c,l+80))))/(((bspmodSHORTSTIMstim(c,l+80))+(bspmodSHORTSTIMISI(c,l+80))));
        bspmodSHORTSTIMFIRST5indexFORCMO(c,l) = (((bspmodSHORTSTIMstim(c,l+120))-(bspmodSHORTSTIMISI(c,l+120))))/(((bspmodSHORTSTIMstim(c,l+120))+(bspmodSHORTSTIMISI(c,l+120))));
        if isnan(bspmodSHORTSTIMFIRST5indexVOLOBJ(c,l)) == 1
            bspmodSHORTSTIMFIRST5indexVOLOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST5indexFORCOBJ(c,l)) == 1
            bspmodSHORTSTIMFIRST5indexFORCOBJ(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST5indexVOLMO(c,l)) == 1
            bspmodSHORTSTIMFIRST5indexVOLMO(c,l) = 0;
        end
        if isnan(bspmodSHORTSTIMFIRST5indexFORCMO(c,l)) == 1
            bspmodSHORTSTIMFIRST5indexFORCMO(c,l) = 0;
        end
    end
%
%
%
%
% Get average firing for each type of touch

    for h = 1:160
        bspbefISI(c,h) = mean(bspmod(h,41:100));
        bspdurstim(c,h) = mean(bspmod(h,101:160));
    end

    bspAVGBEFVOLOBJ(c) = nanmean(bspbefISI(c,1:40));
    bspAVGBEFVOLMO(c) = nanmean(bspbefISI(c,41:80));
    bspAVGBEFFORCOBJ(c) = nanmean(bspbefISI(c,81:120));
    bspAVGBEFFORCMO(c) = nanmean(bspbefISI(c,121:160));

    bspAVGDURVOLOBJ(c) = nanmean(bspdurstim(c,1:40));
    bspAVGDURVOLMO(c) = nanmean(bspdurstim(c,41:80));
    bspAVGDURFORCOBJ(c) = nanmean(bspdurstim(c,81:120));
    bspAVGDURFORCMO(c) = nanmean(bspdurstim(c,121:160));

    bspAVGBASEVOLOBJ(c) = nanmean(bspbef1);
    bspAVGBASEVOLMO(c) = nanmean(bspbef2);
    bspAVGBASEFORCOBJ(c) = nanmean(bspbef3);
    bspAVGBASEFORCMO(c) = nanmean(bspbef4);

    

    % Latency to stim onset and end

    for h = 1:160
        [bb,latidx] = max(bspmodpeak(h,20:60));
        bsplatencyonset(c,h) = (latidx - 20)*0.05;
        [cc,latidx2] = max(bspmodpeak(h,120:160));
        bsplatencyend(c,h) = (20 - latidx2)*0.05;
    end


    bsplatencyonsetVOLobj(c) = mean(bsplatencyonset(c,1:40));
    bsplatencyonsetVOLsoc(c) = mean(bsplatencyonset(c,41:80));
    bsplatencyonsetFORCobj(c) = mean(bsplatencyonset(c,81:120));
    bsplatencyonsetFORCsoc(c) = mean(bsplatencyonset(c,121:160));

    bsplatencyendVOLobj(c) = mean(bsplatencyend(c,1:40));
    bsplatencyendVOLsoc(c) = mean(bsplatencyend(c,41:80));
    bsplatencyendFORCobj(c) = mean(bsplatencyend(c,81:120));
    bsplatencyendFORCsoc(c) = mean(bsplatencyend(c,121:160));

    bspspontVOL(c,:) = bspspont;
    bspspontFORC(c,:) = bspspont2;

% 
%     bspzAI20VOLobj(c,:) = (mean(bspzVOLobj(1:5,41:140))-mean(bspzVOLobj(16:20,41:140)))/(mean(bspzVOLobj(1:5,41:140))+mean(bspzVOLobj(16:20,41:140)));
%     bspzAI20VOLsoc(c,:) = (mean(bspzVOLsoc(1:5,41:140))-mean(bspzVOLsoc(16:20,41:140)))/(mean(bspzVOLsoc(1:5,41:140))+mean(bspzVOLsoc(16:20,41:140)));
%     bspzAI20FORCobj(c,:) = (mean(bspzFORCobj(1:5,41:140))-mean(bspzFORCobj(16:20,41:140)))/(mean(bspzFORCobj(1:5,41:140))+mean(bspzFORCobj(16:20,41:140)));
%     bspzAI20FORCsoc(c,:) = (mean(bspzFORCsoc(1:5,41:140))-mean(bspzFORCsoc(16:20,41:140)))/(mean(bspzFORCsoc(1:5,41:140))+mean(bspzFORCsoc(16:20,41:140)));
% 
%     bspzAI10VOLobj(c,:) = (mean(bspzVOLobj(1:5,41:140))-mean(bspzVOLobj(6:10,41:140)))/(mean(bspzVOLobj(1:5,41:140))+mean(bspzVOLobj(6:10,41:140)));
%     bspzAI10VOLsoc(c,:) = (mean(bspzVOLsoc(1:5,41:140))-mean(bspzVOLsoc(6:10,41:140)))/(mean(bspzVOLsoc(1:5,41:140))+mean(bspzVOLsoc(6:10,41:140)));
%     bspzAI10FORCobj(c,:) = (mean(bspzFORCobj(1:5,41:140))-mean(bspzFORCobj(6:10,41:140)))/(mean(bspzFORCobj(1:5,41:140))+mean(bspzFORCobj(6:10,41:140)));
%     bspzAI10FORCsoc(c,:) = (mean(bspzFORCsoc(1:5,41:140))-mean(bspzFORCsoc(6:10,41:140)))/(mean(bspzFORCsoc(1:5,41:140))+mean(bspzFORCsoc(6:10,41:140)));
% 
%     bspzAI40VOLobj(c,:) = (mean(bspzVOLobj(1:5,41:140))-mean(bspzVOLobj(36:40,41:140)))/(mean(bspzVOLobj(1:5,41:140))+mean(bspzVOLobj(36:40,41:140)));
%     bspzAI40VOLsoc(c,:) = (mean(bspzVOLsoc(1:5,41:140))-mean(bspzVOLsoc(36:40,41:140)))/(mean(bspzVOLsoc(1:5,41:140))+mean(bspzVOLsoc(36:40,41:140)));
%     bspzAI40FORCobj(c,:) = (mean(bspzFORCobj(1:5,41:140))-mean(bspzFORCobj(36:40,41:140)))/(mean(bspzFORCobj(1:5,41:140))+mean(bspzFORCobj(36:40,41:140)));
%     bspzAI40FORCsoc(c,:) = (mean(bspzFORCsoc(1:5,41:140))-mean(bspzFORCsoc(36:40,41:140)))/(mean(bspzFORCsoc(1:5,41:140))+mean(bspzFORCsoc(36:40,41:140)));
% 
% 
%     bspAI20VOLobj(c,:) = (mean(bspVOLobj(1:5,41:140))-mean(bspVOLobj(16:20,41:140)))/(mean(bspVOLobj(1:5,41:140))+mean(bspVOLobj(16:20,41:140)));
%     bspAI20VOLsoc(c,:) = (mean(bspVOLsoc(1:5,41:140))-mean(bspVOLsoc(16:20,41:140)))/(mean(bspVOLsoc(1:5,41:140))+mean(bspVOLsoc(16:20,41:140)));
%     bspAI20FORCobj(c,:) = (mean(bspFORCobj(1:5,41:140))-mean(bspFORCobj(16:20,41:140)))/(mean(bspFORCobj(1:5,41:140))+mean(bspFORCobj(16:20,41:140)));
%     bspAI20FORCsoc(c,:) = (mean(bspFORCsoc(1:5,41:140))-mean(bspFORCsoc(16:20,41:140)))/(mean(bspFORCsoc(1:5,41:140))+mean(bspFORCsoc(16:20,41:140)));
% 
%     bspAI10VOLobj(c,:) = (mean(bspVOLobj(1:5,41:140))-mean(bspVOLobj(6:10,41:140)))/(mean(bspVOLobj(1:5,41:140))+mean(bspVOLobj(6:10,41:140)));
%     bspAI10VOLsoc(c,:) = (mean(bspVOLsoc(1:5,41:140))-mean(bspVOLsoc(6:10,41:140)))/(mean(bspVOLsoc(1:5,41:140))+mean(bspVOLsoc(6:10,41:140)));
%     bspAI10FORCobj(c,:) = (mean(bspFORCobj(1:5,41:140))-mean(bspFORCobj(6:10,41:140)))/(mean(bspFORCobj(1:5,41:140))+mean(bspFORCobj(6:10,41:140)));
%     bspAI10FORCsoc(c,:) = (mean(bspFORCsoc(1:5,41:140))-mean(bspFORCsoc(6:10,41:140)))/(mean(bspFORCsoc(1:5,41:140))+mean(bspFORCsoc(6:10,41:140)));
% 
%     bspAI40VOLobj(c,:) = (mean(bspVOLobj(1:5,41:140))-mean(bspVOLobj(36:40,41:140)))/(mean(bspVOLobj(1:5,41:140))+mean(bspVOLobj(36:40,41:140)));
%     bspAI40VOLsoc(c,:) = (mean(bspVOLsoc(1:5,41:140))-mean(bspVOLsoc(36:40,41:140)))/(mean(bspVOLsoc(1:5,41:140))+mean(bspVOLsoc(36:40,41:140)));
%     bspAI40FORCobj(c,:) = (mean(bspFORCobj(1:5,41:140))-mean(bspFORCobj(36:40,41:140)))/(mean(bspFORCobj(1:5,41:140))+mean(bspFORCobj(36:40,41:140)));
%     bspAI40FORCsoc(c,:) = (mean(bspFORCsoc(1:5,41:140))-mean(bspFORCsoc(36:40,41:140)))/(mean(bspFORCsoc(1:5,41:140))+mean(bspFORCsoc(36:40,41:140)));
end


%% MODULATION INDEX CALCULATIONS

%     bspmodindexVOLALL = [bspmodindexVOLOBJ';bspmodindexVOLMO'];
%     bspmodindexFORCALL = [bspmodindexFORCOBJ';bspmodindexFORCMO'];
% 
%     bspmodindexVOLOBJAVG = nanmean(bspmodindexVOLOBJ');
%     bspmodindexVOLMOAVG = nanmean(bspmodindexVOLMO');
%     bspmodindexFORCOBJAVG = nanmean(bspmodindexFORCOBJ');
%     bspmodindexFORCMOAVG = nanmean(bspmodindexFORCMO');
% 
%     bspmodindexVOLALLAVG = nanmean(bspmodindexVOLALL);
%     bspmodindexFORCALLAVG = nanmean(bspmodindexFORCALL);
% 
%     bspmodPLATindexVOLALL = [bspmodPLATindexVOLOBJ';bspmodPLATindexVOLMO'];
%     bspmodPLATindexFORCALL = [bspmodPLATindexFORCOBJ';bspmodPLATindexFORCMO'];
% 
%     bspmodPLATindexVOLOBJAVG = nanmean(bspmodPLATindexVOLOBJ');
%     bspmodPLATindexVOLMOAVG = nanmean(bspmodPLATindexVOLMO');
%     bspmodPLATindexFORCOBJAVG = nanmean(bspmodPLATindexFORCOBJ');
%     bspmodPLATindexFORCMOAVG = nanmean(bspmodPLATindexFORCMO');
% 
%     bspmodPLATindexVOLALLAVG = nanmean(bspmodPLATindexVOLALL);
%     bspmodPLATindexFORCALLAVG = nanmean(bspmodPLATindexFORCALL);
% 
%     bspmodSHORTSTIMindexVOLALL = [bspmodSHORTSTIMindexVOLOBJ';bspmodSHORTSTIMindexVOLMO'];
%     bspmodSHORTSTIMindexFORCALL = [bspmodSHORTSTIMindexFORCOBJ';bspmodSHORTSTIMindexFORCMO'];
% 
%     bspmodSHORTSTIMindexVOLOBJAVG = nanmean(bspmodSHORTSTIMindexVOLOBJ');
%     bspmodSHORTSTIMindexVOLMOAVG = nanmean(bspmodSHORTSTIMindexVOLMO');
%     bspmodSHORTSTIMindexFORCOBJAVG = nanmean(bspmodSHORTSTIMindexFORCOBJ');
%     bspmodSHORTSTIMindexFORCMOAVG = nanmean(bspmodSHORTSTIMindexFORCMO');
% 
%     bspmodSHORTSTIMindexVOLALLAVG = nanmean(bspmodSHORTSTIMindexVOLALL);
%     bspmodSHORTSTIMindexFORCALLAVG = nanmean(bspmodSHORTSTIMindexFORCALL);
% 
% 
%     bspmodFIRST10indexVOLALL = [bspmodFIRST10indexVOLOBJ';bspmodFIRST10indexVOLMO'];
%     bspmodFIRST10indexFORCALL = [bspmodFIRST10indexFORCOBJ';bspmodFIRST10indexFORCMO'];
% 
%     bspmodFIRST10indexVOLOBJAVG = nanmean(bspmodFIRST10indexVOLOBJ');
%     bspmodFIRST10indexVOLMOAVG = nanmean(bspmodFIRST10indexVOLMO');
%     bspmodFIRST10indexFORCOBJAVG = nanmean(bspmodFIRST10indexFORCOBJ');
%     bspmodFIRST10indexFORCMOAVG = nanmean(bspmodFIRST10indexFORCMO');
% 
%     bspmodFIRST10indexVOLALLAVG = nanmean(bspmodFIRST10indexVOLALL);
%     bspmodFIRST10indexFORCALLAVG = nanmean(bspmodFIRST10indexFORCALL);
% 
% 
%     bspmodPLATFIRST10indexVOLALL = [bspmodPLATFIRST10indexVOLOBJ';bspmodPLATFIRST10indexVOLMO'];
%     bspmodPLATFIRST10indexFORCALL = [bspmodPLATFIRST10indexFORCOBJ';bspmodPLATFIRST10indexFORCMO'];
% 
%     bspmodPLATFIRST10indexVOLOBJAVG = nanmean(bspmodPLATFIRST10indexVOLOBJ');
%     bspmodPLATFIRST10indexVOLMOAVG = nanmean(bspmodPLATFIRST10indexVOLMO');
%     bspmodPLATFIRST10indexFORCOBJAVG = nanmean(bspmodPLATFIRST10indexFORCOBJ');
%     bspmodPLATFIRST10indexFORCMOAVG = nanmean(bspmodPLATFIRST10indexFORCMO');
% 
%     bspmodPLATFIRST10indexVOLALLAVG = nanmean(bspmodPLATFIRST10indexVOLALL);
%     bspmodPLATFIRST10indexFORCALLAVG = nanmean(bspmodPLATFIRST10indexFORCALL);
% 
%     bspmodSHORTSTIMFIRST10indexVOLALL = [bspmodSHORTSTIMFIRST10indexVOLOBJ';bspmodSHORTSTIMFIRST10indexVOLMO'];
%     bspmodSHORTSTIMFIRST10indexFORCALL = [bspmodSHORTSTIMFIRST10indexFORCOBJ';bspmodSHORTSTIMFIRST10indexFORCMO'];
% 
%     bspmodSHORTSTIMFIRST10indexVOLOBJAVG = nanmean(bspmodSHORTSTIMFIRST10indexVOLOBJ');
%     bspmodSHORTSTIMFIRST10indexVOLMOAVG = nanmean(bspmodSHORTSTIMFIRST10indexVOLMO');
%     bspmodSHORTSTIMFIRST10indexFORCOBJAVG = nanmean(bspmodSHORTSTIMFIRST10indexFORCOBJ');
%     bspmodSHORTSTIMFIRST10indexFORCMOAVG = nanmean(bspmodSHORTSTIMFIRST10indexFORCMO');
% 
%     bspmodSHORTSTIMFIRST10indexVOLALLAVG = nanmean(bspmodSHORTSTIMFIRST10indexVOLALL);
%     bspmodSHORTSTIMFIRST10indexFORCALLAVG = nanmean(bspmodSHORTSTIMFIRST10indexFORCALL);

    %%
%         bspmodFIRST5indexVOLALL = [bspmodFIRST5indexVOLOBJ';bspmodFIRST5indexVOLMO'];
%     bspmodFIRST5indexFORCALL = [bspmodFIRST5indexFORCOBJ';bspmodFIRST5indexFORCMO'];
% 
%     bspmodFIRST5indexVOLOBJAVG = nanmean(bspmodFIRST5indexVOLOBJ');
%     bspmodFIRST5indexVOLMOAVG = nanmean(bspmodFIRST5indexVOLMO');
%     bspmodFIRST5indexFORCOBJAVG = nanmean(bspmodFIRST5indexFORCOBJ');
%     bspmodFIRST5indexFORCMOAVG = nanmean(bspmodFIRST5indexFORCMO');
% 
%     bspmodFIRST5indexVOLALLAVG = nanmean(bspmodFIRST5indexVOLALL);
%     bspmodFIRST5indexFORCALLAVG = nanmean(bspmodFIRST5indexFORCALL);
% 
% 
%     bspmodPLATFIRST5indexVOLALL = [bspmodPLATFIRST5indexVOLOBJ';bspmodPLATFIRST5indexVOLMO'];
%     bspmodPLATFIRST5indexFORCALL = [bspmodPLATFIRST5indexFORCOBJ';bspmodPLATFIRST5indexFORCMO'];
% 
%     bspmodPLATFIRST5indexVOLOBJAVG = nanmean(bspmodPLATFIRST5indexVOLOBJ');
%     bspmodPLATFIRST5indexVOLMOAVG = nanmean(bspmodPLATFIRST5indexVOLMO');
%     bspmodPLATFIRST5indexFORCOBJAVG = nanmean(bspmodPLATFIRST5indexFORCOBJ');
%     bspmodPLATFIRST5indexFORCMOAVG = nanmean(bspmodPLATFIRST5indexFORCMO');
% 
%     bspmodPLATFIRST5indexVOLALLAVG = nanmean(bspmodPLATFIRST5indexVOLALL);
%     bspmodPLATFIRST5indexFORCALLAVG = nanmean(bspmodPLATFIRST5indexFORCALL);
% 
%     bspmodSHORTSTIMFIRST5indexVOLALL = [bspmodSHORTSTIMFIRST5indexVOLOBJ';bspmodSHORTSTIMFIRST5indexVOLMO'];
%     bspmodSHORTSTIMFIRST5indexFORCALL = [bspmodSHORTSTIMFIRST5indexFORCOBJ';bspmodSHORTSTIMFIRST5indexFORCMO'];
% 
%     bspmodSHORTSTIMFIRST5indexVOLOBJAVG = nanmean(bspmodSHORTSTIMFIRST5indexVOLOBJ');
%     bspmodSHORTSTIMFIRST5indexVOLMOAVG = nanmean(bspmodSHORTSTIMFIRST5indexVOLMO');
%     bspmodSHORTSTIMFIRST5indexFORCOBJAVG = nanmean(bspmodSHORTSTIMFIRST5indexFORCOBJ');
%     bspmodSHORTSTIMFIRST5indexFORCMOAVG = nanmean(bspmodSHORTSTIMFIRST5indexFORCMO');
% 
%     bspmodSHORTSTIMFIRST5indexVOLALLAVG = nanmean(bspmodSHORTSTIMFIRST5indexVOLALL);
%     bspmodSHORTSTIMFIRST5indexFORCALLAVG = nanmean(bspmodSHORTSTIMFIRST5indexFORCALL);


    %%
    FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLE", "AUCREDO", "FORCNEW", "ADDSUPP", "NEWMODIDX", ".mat");

load(FiringFileName, "allFiringProperties")


allFiringProperties.AverageFiringDiff.S1AVGDURVOLOBJ = bspAVGDURVOLOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGDURVOLMO = bspAVGDURVOLMO(S1good);

allFiringProperties.AverageFiringDiff.S1AVGDURFORCOBJ = bspAVGDURFORCOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGDURFORCMO = bspAVGDURFORCMO(S1good);

allFiringProperties.AverageFiringDiff.STRAVGDURVOLOBJ = bspAVGDURVOLOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGDURVOLMO = bspAVGDURVOLMO(strgood);

allFiringProperties.AverageFiringDiff.STRAVGDURFORCOBJ = bspAVGDURFORCOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGDURFORCMO = bspAVGDURFORCMO(strgood);

allFiringProperties.AverageFiringDiff.BLAAVGDURVOLOBJ = bspAVGDURVOLOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGDURVOLMO = bspAVGDURVOLMO(blagood);

allFiringProperties.AverageFiringDiff.BLAAVGDURFORCOBJ = bspAVGDURFORCOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGDURFORCMO = bspAVGDURFORCMO(blagood);


allFiringProperties.AverageFiringDiff.S1AVGBEFVOLOBJ = bspAVGBEFVOLOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGBEFVOLMO = bspAVGBEFVOLMO(S1good);

allFiringProperties.AverageFiringDiff.S1AVGBEFFORCOBJ = bspAVGBEFFORCOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGBEFFORCMO = bspAVGBEFFORCMO(S1good);

allFiringProperties.AverageFiringDiff.STRAVGBEFVOLOBJ = bspAVGBEFVOLOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGBEFVOLMO = bspAVGBEFVOLMO(strgood);

allFiringProperties.AverageFiringDiff.STRAVGBEFFORCOBJ = bspAVGBEFFORCOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGBEFFORCMO = bspAVGBEFFORCMO(strgood);

allFiringProperties.AverageFiringDiff.BLAAVGBEFVOLOBJ = bspAVGBEFVOLOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGBEFVOLMO = bspAVGBEFVOLMO(blagood);

allFiringProperties.AverageFiringDiff.BLAAVGBEFFORCOBJ = bspAVGBEFFORCOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGBEFFORCMO = bspAVGBEFFORCMO(blagood);


allFiringProperties.AverageFiringDiff.S1AVGBASEVOLOBJ = bspAVGBASEVOLOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGBASEVOLMO = bspAVGBASEVOLMO(S1good);

allFiringProperties.AverageFiringDiff.S1AVGBASEFORCOBJ = bspAVGBASEFORCOBJ(S1good);
allFiringProperties.AverageFiringDiff.S1AVGBASEFORCMO = bspAVGBASEFORCMO(S1good);

allFiringProperties.AverageFiringDiff.STRAVGBASEVOLOBJ = bspAVGBASEVOLOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGBASEVOLMO = bspAVGBASEVOLMO(strgood);

allFiringProperties.AverageFiringDiff.STRAVGBASEFORCOBJ = bspAVGBASEFORCOBJ(strgood);
allFiringProperties.AverageFiringDiff.STRAVGBASEFORCMO = bspAVGBASEFORCMO(strgood);

allFiringProperties.AverageFiringDiff.BLAAVGBASEVOLOBJ = bspAVGBASEVOLOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGBASEVOLMO = bspAVGBASEVOLMO(blagood);

allFiringProperties.AverageFiringDiff.BLAAVGBASEFORCOBJ = bspAVGBASEFORCOBJ(blagood);
allFiringProperties.AverageFiringDiff.BLAAVGBASEFORCMO = bspAVGBASEFORCMO(blagood);


%%
% %
% %
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5VOLOBJ = bspmodPLATFIRST5indexVOLOBJAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5VOLMO = bspmodPLATFIRST5indexVOLMOAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5VOLALL = bspmodPLATFIRST5indexVOLALLAVG(S1good);
% 
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5FORCOBJ = bspmodPLATFIRST5indexFORCOBJAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5FORCMO = bspmodPLATFIRST5indexFORCMOAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST5FORCALL = bspmodPLATFIRST5indexFORCALLAVG(S1good);
% 
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5VOLOBJ = bspmodPLATFIRST5indexVOLOBJAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5VOLMO = bspmodPLATFIRST5indexVOLMOAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5VOLALL = bspmodPLATFIRST5indexVOLALLAVG(strgood);
% 
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5FORCOBJ = bspmodPLATFIRST5indexFORCOBJAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5FORCMO = bspmodPLATFIRST5indexFORCMOAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST5FORCALL = bspmodPLATFIRST5indexFORCALLAVG(strgood);
% 
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5VOLOBJ = bspmodPLATFIRST5indexVOLOBJAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5VOLMO = bspmodPLATFIRST5indexVOLMOAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5VOLALL = bspmodPLATFIRST5indexVOLALLAVG(blagood);
% 
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5FORCOBJ = bspmodPLATFIRST5indexFORCOBJAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5FORCMO = bspmodPLATFIRST5indexFORCMOAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST5FORCALL = bspmodPLATFIRST5indexFORCALLAVG(blagood);
% %
% %
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5VOLOBJ = bspmodSHORTSTIMFIRST5indexVOLOBJAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5VOLMO = bspmodSHORTSTIMFIRST5indexVOLMOAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5VOLALL = bspmodSHORTSTIMFIRST5indexVOLALLAVG(S1good);
% 
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5FORCOBJ = bspmodSHORTSTIMFIRST5indexFORCOBJAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5FORCMO = bspmodSHORTSTIMFIRST5indexFORCMOAVG(S1good);
% allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST5FORCALL = bspmodSHORTSTIMFIRST5indexFORCALLAVG(S1good);
% 
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5VOLOBJ = bspmodSHORTSTIMFIRST5indexVOLOBJAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5VOLMO = bspmodSHORTSTIMFIRST5indexVOLMOAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5VOLALL = bspmodSHORTSTIMFIRST5indexVOLALLAVG(strgood);
% 
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5FORCOBJ = bspmodSHORTSTIMFIRST5indexFORCOBJAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5FORCMO = bspmodSHORTSTIMFIRST5indexFORCMOAVG(strgood);
% allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST5FORCALL = bspmodSHORTSTIMFIRST5indexFORCALLAVG(strgood);
% 
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5VOLOBJ = bspmodSHORTSTIMFIRST5indexVOLOBJAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5VOLMO = bspmodSHORTSTIMFIRST5indexVOLMOAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5VOLALL = bspmodSHORTSTIMFIRST5indexVOLALLAVG(blagood);
% 
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5FORCOBJ = bspmodSHORTSTIMFIRST5indexFORCOBJAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5FORCMO = bspmodSHORTSTIMFIRST5indexFORCMOAVG(blagood);
% allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST5FORCALL = bspmodSHORTSTIMFIRST5indexFORCALLAVG(blagood);
% 
% 
% 
% %     %%
% % %%
% % allstims = bspallstims;
% % allstimsalt = bspallaltstims;
% % 
% % region(1:length(goodtruclu)) = 1;
% % region(find(goodcludepths >= striataldepths(1) & goodcludepths <=striataldepths(end))) = 2;
% % region(find(goodcludepths >= bladepths(1) & goodcludepths <= bladepths(end))) = 3;
% % 
% % allwidths = meanwidth/30000*10^6;
% % 
% % cellsSTR = strgood;
% % cellsSTRFS = find(allwidths(strgood)<475);
% % cellsSTRRS = find(allwidths(strgood)>550 & allwidths(strgood)<1250);
% % cellsSTRUC = find(allwidths(strgood)>475 & allwidths(strgood)<550);
% % 
% % blaspont = bspspontavg1st(blagood);
% % 
% % cellsBLA = blagood;
% % cellsBLAFS = find(allwidths(blagood)<550 & blaspont>6);
% % cellsBLARS = find(allwidths(blagood)>550 & blaspont<6);
% % cellsBLAUC = find(allwidths(blagood)>550 & blaspont>6 | allwidths(blagood)<550 & blaspont<6);
% % 
% % 
% % cellsS1 = S1good;
% % cellsS1FS = find(allwidths(S1good) < 400);
% % cellsS1RS = find(allwidths(S1good) >= 400);
% % 
% % 
% % %%
% % 
% % for a = 1:length(bspallFORCMO)
% %     bspmatallFORCMO(a,:) = bspallFORCMO{a};
% %     bspmatallFORCOBJ(a,:) = bspallFORCOBJ{a};
% %     bspmatallVOLMO(a,:) = bspallVOLMO{a};
% %     bspmatallVOLOBJ(a,:) = bspallVOLOBJ{a};
% % end
% % 
% % 
% % 
% % 
% % allFiringProperties.ALLTRACEBEHAV.S1FORCMOHz = bspmatallFORCMO(S1good,:);
% % allFiringProperties.ALLTRACEBEHAV.S1FORCOBJHz = bspmatallFORCOBJ(S1good,:);
% % allFiringProperties.ALLTRACEBEHAV.S1VOLMOHz = bspmatallVOLMO(S1good,:);
% % allFiringProperties.ALLTRACEBEHAV.S1VOLOBJHz = bspmatallVOLOBJ(S1good,:);
% % 
% % allFiringProperties.ALLTRACEBEHAV.STRFORCMOHz = bspmatallFORCMO(strgood,:);
% % allFiringProperties.ALLTRACEBEHAV.STRFORCOBJHz = bspmatallFORCOBJ(strgood,:);
% % allFiringProperties.ALLTRACEBEHAV.STRVOLMOHz = bspmatallVOLMO(strgood,:);
% % allFiringProperties.ALLTRACEBEHAV.STRVOLOBJHz = bspmatallVOLOBJ(strgood,:);
% % 
% % 
% % allFiringProperties.ALLTRACEBEHAV.BLAFORCMOHz = bspmatallFORCMO(blagood,:);
% % allFiringProperties.ALLTRACEBEHAV.BLAFORCOBJHz = bspmatallFORCOBJ(blagood,:);
% % allFiringProperties.ALLTRACEBEHAV.BLAVOLMOHz = bspmatallVOLMO(blagood,:);
% % allFiringProperties.ALLTRACEBEHAV.BLAVOLOBJHz = bspmatallVOLOBJ(blagood,:);
% %  %%
% % % % % FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLEAUC", ".mat");
% % % % % 
% % % % save(FiringFileName, "allFiringProperties")
% % % %%
% % allFiringProperties.TRIALAVG.S1FORCMOZ = bspzFORCtrsoc(S1good,:);
% % allFiringProperties.TRIALAVG.S1FORCOBJZ = bspzFORCtrobj(S1good,:);
% % allFiringProperties.TRIALAVG.S1VOLMOHz = bspzVOLtrsoc(S1good,:);
% % allFiringProperties.TRIALAVG.S1VOLOBJHz = bspzVOLtrobj(S1good,:);
% % 
% % allFiringProperties.TRIALAVG.STRFORCMOZ = bspzFORCtrsoc(strgood,:);
% % allFiringProperties.TRIALAVG.STRFORCOBJZ = bspzFORCtrobj(strgood,:);
% % allFiringProperties.TRIALAVG.STRVOLMOHz = bspzVOLtrsoc(strgood,:);
% % allFiringProperties.TRIALAVG.STRVOLOBJHz = bspzVOLtrobj(strgood,:);
% % 
% % 
% % allFiringProperties.TRIALAVG.BLAFORCMOZ = bspzFORCtrsoc(blagood,:);
% % allFiringProperties.TRIALAVG.BLAFORCOBJZ = bspzFORCtrobj(blagood,:);
% % allFiringProperties.TRIALAVG.BLAVOLMOHz = bspzVOLtrsoc(blagood,:);
% % allFiringProperties.TRIALAVG.BLAVOLOBJHz = bspzVOLtrobj(blagood,:);
% % 
% % 
% % allFiringProperties.TRIALAVG.S1FORCMOspks = bspSPFORCtrsoc(S1good,:);
% % allFiringProperties.TRIALAVG.S1FORCOBJspks = bspSPFORCtrobj(S1good,:);
% % allFiringProperties.TRIALAVG.S1VOLMOspks = bspSPVOLtrsoc(S1good,:);
% % allFiringProperties.TRIALAVG.S1VOLOBJspks = bspSPVOLtrobj(S1good,:);
% % 
% % allFiringProperties.TRIALAVG.STRFORCMOspks = bspSPFORCtrsoc(strgood,:);
% % allFiringProperties.TRIALAVG.STRFORCOBJspks = bspSPFORCtrobj(strgood,:);
% % allFiringProperties.TRIALAVG.STRVOLMOspks = bspSPVOLtrsoc(strgood,:);
% % allFiringProperties.TRIALAVG.STRVOLOBJspks = bspSPVOLtrobj(strgood,:);
% % 
% % 
% % allFiringProperties.TRIALAVG.BLAFORCMOspks = bspSPFORCtrsoc(blagood,:);
% % allFiringProperties.TRIALAVG.BLAFORCOBJspks = bspSPFORCtrobj(blagood,:);
% % allFiringProperties.TRIALAVG.BLAVOLMOspks = bspSPVOLtrsoc(blagood,:);
% % allFiringProperties.TRIALAVG.BLAVOLOBJspks = bspSPVOLtrobj(blagood,:);
% % % % 
% % % % 
% % %% Get bsp ALL mean firing
% % % 
% % allFiringProperties.COMBINEDcellfiring.S1FORCALLZ = bspzaverageFORCALL(S1good,:);
% % allFiringProperties.COMBINEDcellfiring.S1VOLALLZ = bspzaverageVOLALL(S1good,:);
% % 
% % allFiringProperties.COMBINEDcellfiring.S1FORCALLHz = bspspaverageFORCALL(S1good,:);
% % allFiringProperties.COMBINEDcellfiring.S1VOLALLHz = bspspaverageVOLALL(S1good,:);
% % 
% % allFiringProperties.COMBINEDcellfiring.STRFORCALLZ = bspzaverageFORCALL(strgood,:);
% % allFiringProperties.COMBINEDcellfiring.STRVOLALLZ = bspzaverageVOLALL(strgood,:);
% % 
% % allFiringProperties.COMBINEDcellfiring.STRFORCALLHz = bspspaverageFORCALL(strgood,:);
% % allFiringProperties.COMBINEDcellfiring.STRVOLALLHz = bspspaverageVOLALL(strgood,:);
% % 
% % allFiringProperties.COMBINEDcellfiring.BLAFORCALLZ = bspzaverageFORCALL(blagood,:);
% % allFiringProperties.COMBINEDcellfiring.BLAVOLALLZ = bspzaverageVOLALL(blagood,:);
% % 
% % allFiringProperties.COMBINEDcellfiring.BLAFORCALLHz = bspspaverageFORCALL(blagood,:);
% % allFiringProperties.COMBINEDcellfiring.BLAVOLALLHz = bspspaverageVOLALL(blagood,:);
% % % 
% % %% Get modulation index
% % 
% % allFiringProperties.ModulationIndex.S1modindexVOLOBJ = bspmodindexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndex.S1modindexVOLMO = bspmodindexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndex.S1modindexVOLALL = bspmodindexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndex.S1modindexFORCOBJ = bspmodindexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndex.S1modindexFORCMO = bspmodindexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndex.S1modindexFORCALL = bspmodindexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndex.STRmodindexVOLOBJ = bspmodindexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndex.STRmodindexVOLMO = bspmodindexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndex.STRmodindexVOLALL = bspmodindexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndex.STRmodindexFORCOBJ = bspmodindexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndex.STRmodindexFORCMO = bspmodindexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndex.STRmodindexFORCALL = bspmodindexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndex.BLAmodindexVOLOBJ = bspmodindexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndex.BLAmodindexVOLMO = bspmodindexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndex.BLAmodindexVOLALL = bspmodindexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndex.BLAmodindexFORCOBJ = bspmodindexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndex.BLAmodindexFORCMO = bspmodindexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndex.BLAmodindexFORCALL = bspmodindexFORCALLAVG(blagood);
% % % 
% % % % 
% % %% MORE MODULATION INDICES
% % % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexVOLOBJ = bspmodindexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexVOLMO = bspmodindexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexVOLALL = bspmodindexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexFORCOBJ = bspmodindexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFORCMO = bspmodindexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFORCALL = bspmodindexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexVOLOBJ = bspmodindexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexVOLMO = bspmodindexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexVOLALL = bspmodindexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFORCOBJ = bspmodindexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFORCMO = bspmodindexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFORCALL = bspmodindexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLOBJ = bspmodindexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLMO = bspmodindexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLALL = bspmodindexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCOBJ = bspmodindexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCMO = bspmodindexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCALL = bspmodindexFORCALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLOBJ = bspmodPLATindexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLMO = bspmodPLATindexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLALL = bspmodPLATindexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCOBJ = bspmodPLATindexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCMO = bspmodPLATindexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCALL = bspmodPLATindexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLOBJ = bspmodPLATindexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLMO = bspmodPLATindexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLALL = bspmodPLATindexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCOBJ = bspmodPLATindexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCMO = bspmodPLATindexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCALL = bspmodPLATindexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLOBJ = bspmodPLATindexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLMO = bspmodPLATindexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLALL = bspmodPLATindexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCOBJ = bspmodPLATindexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCMO = bspmodPLATindexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCALL = bspmodPLATindexFORCALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLOBJ = bspmodSHORTSTIMindexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLMO = bspmodSHORTSTIMindexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLALL = bspmodSHORTSTIMindexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCOBJ = bspmodSHORTSTIMindexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCMO = bspmodSHORTSTIMindexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCALL = bspmodSHORTSTIMindexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLOBJ = bspmodSHORTSTIMindexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLMO = bspmodSHORTSTIMindexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLALL = bspmodSHORTSTIMindexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCOBJ = bspmodSHORTSTIMindexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCMO = bspmodSHORTSTIMindexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCALL = bspmodSHORTSTIMindexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLOBJ = bspmodSHORTSTIMindexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLMO = bspmodSHORTSTIMindexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLALL = bspmodSHORTSTIMindexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCOBJ = bspmodSHORTSTIMindexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCMO = bspmodSHORTSTIMindexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCALL = bspmodSHORTSTIMindexFORCALLAVG(blagood);
% % 
% % % %
% % %
% % % FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLE", "AUCREDO", "FORCNEW", ".mat");
% % % 
% % % load(FiringFileName, "allFiringProperties")
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10VOLOBJ = bspmodFIRST10indexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10VOLMO = bspmodFIRST10indexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10VOLALL = bspmodFIRST10indexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCOBJ = bspmodFIRST10indexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCMO = bspmodFIRST10indexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCALL = bspmodFIRST10indexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10VOLOBJ = bspmodFIRST10indexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10VOLMO = bspmodFIRST10indexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10VOLALL = bspmodFIRST10indexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCOBJ = bspmodFIRST10indexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCMO = bspmodFIRST10indexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCALL = bspmodFIRST10indexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10VOLOBJ = bspmodFIRST10indexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10VOLMO = bspmodFIRST10indexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10VOLALL = bspmodFIRST10indexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCOBJ = bspmodFIRST10indexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCMO = bspmodFIRST10indexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCALL = bspmodFIRST10indexFORCALLAVG(blagood);
% % %
% % %
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10VOLOBJ = bspmodPLATFIRST10indexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10VOLMO = bspmodPLATFIRST10indexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10VOLALL = bspmodPLATFIRST10indexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10FORCOBJ = bspmodPLATFIRST10indexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10FORCMO = bspmodPLATFIRST10indexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexPLATFIRST10FORCALL = bspmodPLATFIRST10indexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10VOLOBJ = bspmodPLATFIRST10indexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10VOLMO = bspmodPLATFIRST10indexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10VOLALL = bspmodPLATFIRST10indexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10FORCOBJ = bspmodPLATFIRST10indexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10FORCMO = bspmodPLATFIRST10indexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFIRST10FORCALL = bspmodPLATFIRST10indexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10VOLOBJ = bspmodPLATFIRST10indexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10VOLMO = bspmodPLATFIRST10indexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10VOLALL = bspmodPLATFIRST10indexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10FORCOBJ = bspmodPLATFIRST10indexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10FORCMO = bspmodPLATFIRST10indexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFIRST10FORCALL = bspmodPLATFIRST10indexFORCALLAVG(blagood);
% % %
% % %
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10VOLOBJ = bspmodSHORTSTIMFIRST10indexVOLOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10VOLMO = bspmodSHORTSTIMFIRST10indexVOLMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10VOLALL = bspmodSHORTSTIMFIRST10indexVOLALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10FORCOBJ = bspmodSHORTSTIMFIRST10indexFORCOBJAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10FORCMO = bspmodSHORTSTIMFIRST10indexFORCMOAVG(S1good);
% % allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFIRST10FORCALL = bspmodSHORTSTIMFIRST10indexFORCALLAVG(S1good);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10VOLOBJ = bspmodSHORTSTIMFIRST10indexVOLOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10VOLMO = bspmodSHORTSTIMFIRST10indexVOLMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10VOLALL = bspmodSHORTSTIMFIRST10indexVOLALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10FORCOBJ = bspmodSHORTSTIMFIRST10indexFORCOBJAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10FORCMO = bspmodSHORTSTIMFIRST10indexFORCMOAVG(strgood);
% % allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFIRST10FORCALL = bspmodSHORTSTIMFIRST10indexFORCALLAVG(strgood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10VOLOBJ = bspmodSHORTSTIMFIRST10indexVOLOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10VOLMO = bspmodSHORTSTIMFIRST10indexVOLMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10VOLALL = bspmodSHORTSTIMFIRST10indexVOLALLAVG(blagood);
% % 
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10FORCOBJ = bspmodSHORTSTIMFIRST10indexFORCOBJAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10FORCMO = bspmodSHORTSTIMFIRST10indexFORCMOAVG(blagood);
% % allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFIRST10FORCALL = bspmodSHORTSTIMFIRST10indexFORCALLAVG(blagood);
% % 
% % 
% % %% LATENCY
% % allFiringProperties.Latency.Onset.S1bsplatencyonsetVOLobj = bsplatencyonsetVOLobj(S1good);
% % allFiringProperties.Latency.Onset.S1bsplatencyonsetVOLsoc = bsplatencyonsetVOLsoc(S1good);
% % allFiringProperties.Latency.Onset.S1bsplatencyonsetFORCobj = bsplatencyonsetFORCobj(S1good);
% % allFiringProperties.Latency.Onset.S1bsplatencyonsetFORCsoc = bsplatencyonsetFORCsoc(S1good);
% % 
% % allFiringProperties.Latency.End.S1bsplatencyendVOLobj = bsplatencyendVOLobj(S1good);
% % allFiringProperties.Latency.End.S1bsplatencyendVOLsoc = bsplatencyendVOLsoc(S1good);
% % allFiringProperties.Latency.End.S1bsplatencyendFORCobj = bsplatencyendFORCobj(S1good);
% % allFiringProperties.Latency.End.S1bsplatencyendFORCsoc = bsplatencyendFORCsoc(S1good);
% % 
% % allFiringProperties.Latency.Onset.STRbsplatencyonsetVOLobj = bsplatencyonsetVOLobj(strgood);
% % allFiringProperties.Latency.Onset.STRbsplatencyonsetVOLsoc = bsplatencyonsetVOLsoc(strgood);
% % allFiringProperties.Latency.Onset.STRbsplatencyonsetFORCobj = bsplatencyonsetFORCobj(strgood);
% % allFiringProperties.Latency.Onset.STRbsplatencyonsetFORCsoc = bsplatencyonsetFORCsoc(strgood);
% % 
% % allFiringProperties.Latency.End.STRbsplatencyendVOLobj = bsplatencyendVOLobj(strgood);
% % allFiringProperties.Latency.End.STRbsplatencyendVOLsoc = bsplatencyendVOLsoc(strgood);
% % allFiringProperties.Latency.End.STRbsplatencyendFORCobj = bsplatencyendFORCobj(strgood);
% % allFiringProperties.Latency.End.STRbsplatencyendFORCsoc = bsplatencyendFORCsoc(strgood);
% % 
% % allFiringProperties.Latency.Onset.BLAbsplatencyonsetVOLobj = bsplatencyonsetVOLobj(blagood);
% % allFiringProperties.Latency.Onset.BLAbsplatencyonsetVOLsoc = bsplatencyonsetVOLsoc(blagood);
% % allFiringProperties.Latency.Onset.BLAbsplatencyonsetFORCobj = bsplatencyonsetFORCobj(blagood);
% % allFiringProperties.Latency.Onset.BLAbsplatencyonsetFORCsoc = bsplatencyonsetFORCsoc(blagood);
% % 
% % allFiringProperties.Latency.End.BLAbsplatencyendVOLobj = bsplatencyendVOLobj(blagood);
% % allFiringProperties.Latency.End.BLAbsplatencyendVOLsoc = bsplatencyendVOLsoc(blagood);
% % allFiringProperties.Latency.End.BLAbsplatencyendFORCobj = bsplatencyendFORCobj(blagood);
% % allFiringProperties.Latency.End.BLAbsplatencyendFORCsoc = bsplatencyendFORCsoc(blagood);
% % 
% % %% Spontaneous activity for correlation coefficients
% % allFiringProperties.SpontaneousActivity.S1bspspontVOL = bspspontVOL(S1good,:);
% % allFiringProperties.SpontaneousActivity.S1bspspontFORC = bspspontFORC(S1good,:);
% % 
% % allFiringProperties.SpontaneousActivity.STRbspspontVOL = bspspontVOL(strgood,:);
% % allFiringProperties.SpontaneousActivity.STRbspspontFORC = bspspontFORC(strgood,:);
% % 
% % allFiringProperties.SpontaneousActivity.BLAbspspontVOL = bspspontVOL(blagood,:);
% % allFiringProperties.SpontaneousActivity.BLAbspspontFORC = bspspontFORC(blagood,:);
% % 
% % %% Characterize the S1 alyers
% % allFiringProperties.S1layers = S1layer;
% % 
% % 
% % 
% % %%
% % 
% % 
% % 
% % % % %% NONSORTED ALL CELLS
% % allFiringProperties.NONsortedcellsALL.S1cells.S1cellsFORCALL = normmeanswS1FORCALL;
% % allFiringProperties.NONsortedcellsALL.S1cells.S1cellsVOLALL = normmeanswS1VOLALL;
% % 
% % allFiringProperties.NONsortedcellsALL.strcells.strcellsFORCALL = normmeanswstrFORCALL;
% % allFiringProperties.NONsortedcellsALL.strcells.strcellsVOLALL = normmeanswstrVOLALL;
% % 
% % allFiringProperties.NONsortedcellsALL.blacells.blacellsFORCALL = normmeanswblaFORCALL;
% % allFiringProperties.NONsortedcellsALL.blacells.blacellsVOLALL = normmeanswblaVOLALL;
% % % % 
% % % % %%
% % % % FiringFileName = strcat(apbin1, "allFiringProperties", "newREDO", ".mat");
% % % % 
% % % % save(FiringFileName, "allFiringProperties")
% % % % 
% % % % %%
% % % % 
% % % % 
% % % % 
% % % % 
% %  %% Get all region cells
% % 
% % allFiringProperties.allcellfiring.S1FORCMOZ = bspzaverageFORCsoc(S1good,:);
% % allFiringProperties.allcellfiring.S1FORCOBJZ = bspzaverageFORCobj(S1good,:);
% % 
% % allFiringProperties.allcellfiring.S1VOLMOZ = bspzaverageVOLsoc(S1good,:);
% % allFiringProperties.allcellfiring.S1VOLOBJZ = bspzaverageVOLobj(S1good,:);
% % 
% % allFiringProperties.allcellfiring.S1FORCMOHz = bspspaverageFORCsoc(S1good,:);
% % allFiringProperties.allcellfiring.S1FORCOBJHz = bspspaverageFORCobj(S1good,:);
% % 
% % allFiringProperties.allcellfiring.S1VOLMOHz = bspspaverageVOLsoc(S1good,:);
% % allFiringProperties.allcellfiring.S1VOLOBJHz = bspspaverageVOLobj(S1good,:);
% % 
% % allFiringProperties.allcellfiring.STRFORCMOZ = bspzaverageFORCsoc(strgood,:);
% % allFiringProperties.allcellfiring.STRFORCOBJZ = bspzaverageFORCobj(strgood,:);
% % 
% % allFiringProperties.allcellfiring.STRVOLMOZ = bspzaverageVOLsoc(strgood,:);
% % allFiringProperties.allcellfiring.STRVOLOBJZ = bspzaverageVOLobj(strgood,:);
% % 
% % allFiringProperties.allcellfiring.STRFORCMOHz = bspspaverageFORCsoc(strgood,:);
% % allFiringProperties.allcellfiring.STRFORCOBJHz = bspspaverageFORCobj(strgood,:);
% % 
% % allFiringProperties.allcellfiring.STRVOLMOHz = bspspaverageVOLsoc(strgood,:);
% % allFiringProperties.allcellfiring.STRVOLOBJHz = bspspaverageVOLobj(strgood,:);
% % 
% % allFiringProperties.allcellfiring.BLAFORCMOZ = bspzaverageFORCsoc(blagood,:);
% % allFiringProperties.allcellfiring.BLAFORCOBJZ = bspzaverageFORCobj(blagood,:);
% % 
% % allFiringProperties.allcellfiring.BLAVOLMOZ = bspzaverageVOLsoc(blagood,:);
% % allFiringProperties.allcellfiring.BLAVOLOBJZ = bspzaverageVOLobj(blagood,:);
% % 
% % allFiringProperties.allcellfiring.BLAFORCMOHz = bspspaverageFORCsoc(blagood,:);
% % allFiringProperties.allcellfiring.BLAFORCOBJHz = bspspaverageFORCobj(blagood,:);
% % 
% % allFiringProperties.allcellfiring.BLAVOLMOHz = bspspaverageVOLsoc(blagood,:);
% % allFiringProperties.allcellfiring.BLAVOLOBJHz = bspspaverageVOLobj(blagood,:);
% % 
% % 
% % %% REDO SORTED CELLS
% % 
% % allFiringProperties.sortedcells.allcells.allcellsFORCMO = FORCMOnewmeansortedcells;
% % allFiringProperties.sortedcells.allcells.allcellsFORCOBJ = FORCOBJnewmeansortedcells;
% % allFiringProperties.sortedcells.allcells.allcellsVOLMO = VOLMOnewmeansortedcells;
% % allFiringProperties.sortedcells.allcells.allcellsVOLOBJ = VOLOBJnewmeansortedcells;
% % 
% % allFiringProperties.sortedcells.S1cells.S1cellsFORCMO = FORCMOnewmeansortedcellsS1;
% % allFiringProperties.sortedcells.S1cells.S1cellsFORCOBJ = FORCOBJnewmeansortedcellsS1;
% % allFiringProperties.sortedcells.S1cells.S1cellsVOLMO = VOLMOnewmeansortedcellsS1;
% % allFiringProperties.sortedcells.S1cells.S1cellsVOLOBJ = VOLOBJnewmeansortedcellsS1;
% % 
% % allFiringProperties.sortedcells.strcells.strcellsFORCMO = FORCMOnewmeansortedcellsstr;
% % allFiringProperties.sortedcells.strcells.strcellsFORCOBJ = FORCOBJnewmeansortedcellsstr;
% % allFiringProperties.sortedcells.strcells.strcellsVOLMO = VOLMOnewmeansortedcellsstr;
% % allFiringProperties.sortedcells.strcells.strcellsVOLOBJ = VOLOBJnewmeansortedcellsstr;
% % 
% % allFiringProperties.sortedcells.blacells.blacellsFORCMO = FORCMOnewmeansortedcellsbla;
% % allFiringProperties.sortedcells.blacells.blacellsFORCOBJ = FORCOBJnewmeansortedcellsbla;
% % allFiringProperties.sortedcells.blacells.blacellsVOLMO = VOLMOnewmeansortedcellsbla;
% % allFiringProperties.sortedcells.blacells.blacellsVOLOBJ = VOLOBJnewmeansortedcellsbla;
% % 
% % 
% % allFiringProperties.sortedcells.lengths.alllength = newlength;
% % allFiringProperties.sortedcells.lengths.S1length = newlengthS1;
% % allFiringProperties.sortedcells.lengths.strlength = newlengthstr;
% % allFiringProperties.sortedcells.lengths.blalength= newlengthbla;
% % % % 
% % %% Get cells but not sorted plus their corresponding index
% % 
% % allFiringProperties.NONsortedcells.S1cells.S1cellsFORCMO = normmeanswS1FORCMO;
% % allFiringProperties.NONsortedcells.S1cells.S1cellsFORCOBJ = normmeanswS1FORCOBJ;
% % allFiringProperties.NONsortedcells.S1cells.S1cellsVOLMO = normmeanswS1VOLMO;
% % allFiringProperties.NONsortedcells.S1cells.S1cellsVOLOBJ = normmeanswS1VOLOBJ;
% % 
% % allFiringProperties.NONsortedcells.strcells.strcellsFORCMO = normmeanswstrFORCMO;
% % allFiringProperties.NONsortedcells.strcells.strcellsFORCOBJ = normmeanswstrFORCOBJ;
% % allFiringProperties.NONsortedcells.strcells.strcellsVOLMO = normmeanswstrVOLMO;
% % allFiringProperties.NONsortedcells.strcells.strcellsVOLOBJ = normmeanswstrVOLOBJ;
% % 
% % allFiringProperties.NONsortedcells.blacells.blacellsFORCMO = normmeanswblaFORCMO;
% % allFiringProperties.NONsortedcells.blacells.blacellsFORCOBJ = normmeanswblaFORCOBJ;
% % allFiringProperties.NONsortedcells.blacells.blacellsVOLMO = normmeanswblaVOLMO;
% % allFiringProperties.NONsortedcells.blacells.blacellsVOLOBJ = normmeanswblaVOLOBJ;
% % %%
% % % % % 
% % % % % FiringFileName = strcat(apbin1, "allFiringProperties", "newREDO", ".mat");
% % % % % 
% % % % % save(FiringFileName, "allFiringProperties")
% % % % % 
% % % % % 
% % % % 
% % % % 
% % % % %
% % % % %
% % % % %
% % % % %
% % % % %
% % % % %
% % % %% Get all stims for S1, STR and BLA
% % % 
% % for a = 1:length(S1good)
% %     S1allstims{a} = bspallaltstims{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRallstims{a} = bspallaltstims{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLAallstims{a} = bspallaltstims{blagood(a)};
% % end
% % % 
% % % 
% % % % get bsp by trial binned data for SVM Decoder
% % % 
% % 
% % for a = 1:length(S1good)
% %     S1BINNEDstimsFORCOBJ{a} = bspBINSPFORCtrobj{S1good(a)};
% %     S1BINNEDstimsFORCMO{a} = bspBINSPFORCtrsoc{S1good(a)};
% %     S1BINNEDstimsVOLOBJ{a} = bspBINSPVOLtrobj{S1good(a)};
% %     S1BINNEDstimsVOLMO{a} = bspBINSPVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNEDstimsFORCOBJ{a} = bspBINSPFORCtrobj{strgood(a)};
% %     STRBINNEDstimsFORCMO{a} = bspBINSPFORCtrsoc{strgood(a)};
% %     STRBINNEDstimsVOLOBJ{a} = bspBINSPVOLtrobj{strgood(a)};
% %     STRBINNEDstimsVOLMO{a} = bspBINSPVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNEDstimsFORCOBJ{a} = bspBINSPFORCtrobj{blagood(a)};
% %     BLABINNEDstimsFORCMO{a} = bspBINSPFORCtrsoc{blagood(a)};
% %     BLABINNEDstimsVOLOBJ{a} = bspBINSPVOLtrobj{blagood(a)};
% %     BLABINNEDstimsVOLMO{a} = bspBINSPVOLtrsoc{blagood(a)};
% % end
% % 
% % %% create data structure to save the binned firing 
% % 
% % allTrialData.S1trials.S1BINNEDstimsFORCOBJ = S1BINNEDstimsFORCOBJ;
% % allTrialData.S1trials.S1BINNEDstimsFORCMO = S1BINNEDstimsFORCMO;
% % allTrialData.S1trials.S1BINNEDstimsVOLOBJ = S1BINNEDstimsVOLOBJ;
% % allTrialData.S1trials.S1BINNEDstimsVOLMO = S1BINNEDstimsVOLMO;
% % 
% % allTrialData.STRtrials.STRBINNEDstimsFORCOBJ = STRBINNEDstimsFORCOBJ;
% % allTrialData.STRtrials.STRBINNEDstimsFORCMO = STRBINNEDstimsFORCMO;
% % allTrialData.STRtrials.STRBINNEDstimsVOLOBJ = STRBINNEDstimsVOLOBJ;
% % allTrialData.STRtrials.STRBINNEDstimsVOLMO = STRBINNEDstimsVOLMO;
% % 
% % allTrialData.BLAtrials.BLABINNEDstimsFORCOBJ = BLABINNEDstimsFORCOBJ;
% % allTrialData.BLAtrials.BLABINNEDstimsFORCMO = BLABINNEDstimsFORCMO;
% % allTrialData.BLAtrials.BLABINNEDstimsVOLOBJ = BLABINNEDstimsVOLOBJ;
% % allTrialData.BLAtrials.BLABINNEDstimsVOLMO = BLABINNEDstimsVOLMO;
% % % % % 
% % % % % % 
% % % % % % FiringFileName = strcat(apbin1, "binnedtrialdata", "SVM", ".mat");
% % % % % % 
% % % % % % load(FiringFileName);
% % % % % %%
% % for a = 1:length(S1good)
% %     S1BINNEDZstimsFORCOBJ{a} = bspBINZFORCtrobj{S1good(a)};
% %     S1BINNEDZstimsFORCMO{a} = bspBINZFORCtrsoc{S1good(a)};
% %     S1BINNEDZstimsVOLOBJ{a} = bspBINZVOLtrobj{S1good(a)};
% %     S1BINNEDZstimsVOLMO{a} = bspBINZVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNEDZstimsFORCOBJ{a} = bspBINZFORCtrobj{strgood(a)};
% %     STRBINNEDZstimsFORCMO{a} = bspBINZFORCtrsoc{strgood(a)};
% %     STRBINNEDZstimsVOLOBJ{a} = bspBINZVOLtrobj{strgood(a)};
% %     STRBINNEDZstimsVOLMO{a} = bspBINZVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNEDZstimsFORCOBJ{a} = bspBINZFORCtrobj{blagood(a)};
% %     BLABINNEDZstimsFORCMO{a} = bspBINZFORCtrsoc{blagood(a)};
% %     BLABINNEDZstimsVOLOBJ{a} = bspBINZVOLtrobj{blagood(a)};
% %     BLABINNEDZstimsVOLMO{a} = bspBINZVOLtrsoc{blagood(a)};
% % end
% % % 
% % %% create data structure to save the binned firing 
% % % % 
% % allTrialData.S1trialsZ.S1BINNEDZstimsFORCOBJ = S1BINNEDZstimsFORCOBJ;
% % allTrialData.S1trialsZ.S1BINNEDZstimsFORCMO = S1BINNEDZstimsFORCMO;
% % allTrialData.S1trialsZ.S1BINNEDZstimsVOLOBJ = S1BINNEDZstimsVOLOBJ;
% % allTrialData.S1trialsZ.S1BINNEDZstimsVOLMO = S1BINNEDZstimsVOLMO;
% % 
% % allTrialData.STRtrialsZ.STRBINNEDZstimsFORCOBJ = STRBINNEDZstimsFORCOBJ;
% % allTrialData.STRtrialsZ.STRBINNEDZstimsFORCMO = STRBINNEDZstimsFORCMO;
% % allTrialData.STRtrialsZ.STRBINNEDZstimsVOLOBJ = STRBINNEDZstimsVOLOBJ;
% % allTrialData.STRtrialsZ.STRBINNEDZstimsVOLMO = STRBINNEDZstimsVOLMO;
% % 
% % allTrialData.BLAtrialsZ.BLABINNEDZstimsFORCOBJ = BLABINNEDZstimsFORCOBJ;
% % allTrialData.BLAtrialsZ.BLABINNEDZstimsFORCMO = BLABINNEDZstimsFORCMO;
% % allTrialData.BLAtrialsZ.BLABINNEDZstimsVOLOBJ = BLABINNEDZstimsVOLOBJ;
% % allTrialData.BLAtrialsZ.BLABINNEDZstimsVOLMO = BLABINNEDZstimsVOLMO;
% % 
% % for a = 1:length(S1good)
% %     S1BINNEDZISIstimsFORCOBJ{a} = bspBINZISIFORCtrobj{S1good(a)};
% %     S1BINNEDZISIstimsFORCMO{a} = bspBINZISIFORCtrsoc{S1good(a)};
% %     S1BINNEDZISIstimsVOLOBJ{a} = bspBINZISIVOLtrobj{S1good(a)};
% %     S1BINNEDZISIstimsVOLMO{a} = bspBINZISIVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNEDZISIstimsFORCOBJ{a} = bspBINZISIFORCtrobj{strgood(a)};
% %     STRBINNEDZISIstimsFORCMO{a} = bspBINZISIFORCtrsoc{strgood(a)};
% %     STRBINNEDZISIstimsVOLOBJ{a} = bspBINZISIVOLtrobj{strgood(a)};
% %     STRBINNEDZISIstimsVOLMO{a} = bspBINZISIVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNEDZISIstimsFORCOBJ{a} = bspBINZISIFORCtrobj{blagood(a)};
% %     BLABINNEDZISIstimsFORCMO{a} = bspBINZISIFORCtrsoc{blagood(a)};
% %     BLABINNEDZISIstimsVOLOBJ{a} = bspBINZISIVOLtrobj{blagood(a)};
% %     BLABINNEDZISIstimsVOLMO{a} = bspBINZISIVOLtrsoc{blagood(a)};
% % end
% % 
% %  %% create data structure to save the binned firing 
% % % % 
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsFORCOBJ = S1BINNEDZISIstimsFORCOBJ;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsFORCMO = S1BINNEDZISIstimsFORCMO;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsVOLOBJ = S1BINNEDZISIstimsVOLOBJ;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsVOLMO = S1BINNEDZISIstimsVOLMO;
% % 
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsFORCOBJ = STRBINNEDZISIstimsFORCOBJ;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsFORCMO = STRBINNEDZISIstimsFORCMO;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsVOLOBJ = STRBINNEDZISIstimsVOLOBJ;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsVOLMO = STRBINNEDZISIstimsVOLMO;
% % 
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsFORCOBJ = BLABINNEDZISIstimsFORCOBJ;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsFORCMO = BLABINNEDZISIstimsFORCMO;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsVOLOBJ = BLABINNEDZISIstimsVOLOBJ;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsVOLMO = BLABINNEDZISIstimsVOLMO;
% % 
% % %
% % %
% % % %
% % % FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLEAUCREDOFORCNEWFORCONLY448983", ".mat");
% % % 
% % % save(FiringFileName, "allFiringProperties")
% % 
% % 
% % 
% % % 
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsFORCOBJ = S1BINNEDZISIstimsFORCOBJ;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsFORCMO = S1BINNEDZISIstimsFORCMO;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsVOLOBJ = S1BINNEDZISIstimsVOLOBJ;
% % allTrialData.S1trialsZISI.S1BINNEDZISIstimsVOLMO = S1BINNEDZISIstimsVOLMO;
% % 
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsFORCOBJ = STRBINNEDZISIstimsFORCOBJ;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsFORCMO = STRBINNEDZISIstimsFORCMO;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsVOLOBJ = STRBINNEDZISIstimsVOLOBJ;
% % allTrialData.STRtrialsZISI.STRBINNEDZISIstimsVOLMO = STRBINNEDZISIstimsVOLMO;
% % 
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsFORCOBJ = BLABINNEDZISIstimsFORCOBJ;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsFORCMO = BLABINNEDZISIstimsFORCMO;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsVOLOBJ = BLABINNEDZISIstimsVOLOBJ;
% % allTrialData.BLAtrialsZISI.BLABINNEDZISIstimsVOLMO = BLABINNEDZISIstimsVOLMO;
% % 
% % % FiringFileName = strcat(apbin1, "allTrialData", "WHOLETRACESHUFFLE", "AUCREDO", "FORCNEW", "FORCONLYWITHISI", ".mat");
% % % 
% % % 
% % % load(FiringFileName, "allTrialData")
% % 
% % 
% % for a = 1:length(S1good)
% %     S1BINNED500stimsFORCOBJ{a} = bsp500BINSPFORCtrobj{S1good(a)};
% %     S1BINNED500stimsFORCMO{a} = bsp500BINSPFORCtrsoc{S1good(a)};
% %     S1BINNED500stimsVOLOBJ{a} = bsp500BINSPVOLtrobj{S1good(a)};
% %     S1BINNED500stimsVOLMO{a} = bsp500BINSPVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNED500stimsFORCOBJ{a} = bsp500BINSPFORCtrobj{strgood(a)};
% %     STRBINNED500stimsFORCMO{a} = bsp500BINSPFORCtrsoc{strgood(a)};
% %     STRBINNED500stimsVOLOBJ{a} = bsp500BINSPVOLtrobj{strgood(a)};
% %     STRBINNED500stimsVOLMO{a} = bsp500BINSPVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNED500stimsFORCOBJ{a} = bsp500BINSPFORCtrobj{blagood(a)};
% %     BLABINNED500stimsFORCMO{a} = bsp500BINSPFORCtrsoc{blagood(a)};
% %     BLABINNED500stimsVOLOBJ{a} = bsp500BINSPVOLtrobj{blagood(a)};
% %     BLABINNED500stimsVOLMO{a} = bsp500BINSPVOLtrsoc{blagood(a)};
% % end
% % 
% % %% create data structure to save the binned firing 
% % 
% % allTrialData.S1trials.S1BINNED500stimsFORCOBJ = S1BINNED500stimsFORCOBJ;
% % allTrialData.S1trials.S1BINNED500stimsFORCMO = S1BINNED500stimsFORCMO;
% % allTrialData.S1trials.S1BINNED500stimsVOLOBJ = S1BINNED500stimsVOLOBJ;
% % allTrialData.S1trials.S1BINNED500stimsVOLMO = S1BINNED500stimsVOLMO;
% % 
% % allTrialData.STRtrials.STRBINNED500stimsFORCOBJ = STRBINNED500stimsFORCOBJ;
% % allTrialData.STRtrials.STRBINNED500stimsFORCMO = STRBINNED500stimsFORCMO;
% % allTrialData.STRtrials.STRBINNED500stimsVOLOBJ = STRBINNED500stimsVOLOBJ;
% % allTrialData.STRtrials.STRBINNED500stimsVOLMO = STRBINNED500stimsVOLMO;
% % 
% % allTrialData.BLAtrials.BLABINNED500stimsFORCOBJ = BLABINNED500stimsFORCOBJ;
% % allTrialData.BLAtrials.BLABINNED500stimsFORCMO = BLABINNED500stimsFORCMO;
% % allTrialData.BLAtrials.BLABINNED500stimsVOLOBJ = BLABINNED500stimsVOLOBJ;
% % allTrialData.BLAtrials.BLABINNED500stimsVOLMO = BLABINNED500stimsVOLMO;
% % % 
% % % % 
% % % % FiringFileName = strcat(apbin1, "binnedtrialdata", "SVM", ".mat");
% % % % 
% % % % load(FiringFileName);
% % % %%
% % for a = 1:length(S1good)
% %     S1BINNED500ZstimsFORCOBJ{a} = bsp500BINZFORCtrobj{S1good(a)};
% %     S1BINNED500ZstimsFORCMO{a} = bsp500BINZFORCtrsoc{S1good(a)};
% %     S1BINNED500ZstimsVOLOBJ{a} = bsp500BINZVOLtrobj{S1good(a)};
% %     S1BINNED500ZstimsVOLMO{a} = bsp500BINZVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNED500ZstimsFORCOBJ{a} = bsp500BINZFORCtrobj{strgood(a)};
% %     STRBINNED500ZstimsFORCMO{a} = bsp500BINZFORCtrsoc{strgood(a)};
% %     STRBINNED500ZstimsVOLOBJ{a} = bsp500BINZVOLtrobj{strgood(a)};
% %     STRBINNED500ZstimsVOLMO{a} = bsp500BINZVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNED500ZstimsFORCOBJ{a} = bsp500BINZFORCtrobj{blagood(a)};
% %     BLABINNED500ZstimsFORCMO{a} = bsp500BINZFORCtrsoc{blagood(a)};
% %     BLABINNED500ZstimsVOLOBJ{a} = bsp500BINZVOLtrobj{blagood(a)};
% %     BLABINNED500ZstimsVOLMO{a} = bsp500BINZVOLtrsoc{blagood(a)};
% % end
% % 
% % %% create data structure to save the binned firing 
% % 
% % allTrialData.S1trialsZ.S1BINNED500ZstimsFORCOBJ = S1BINNED500ZstimsFORCOBJ;
% % allTrialData.S1trialsZ.S1BINNED500ZstimsFORCMO = S1BINNED500ZstimsFORCMO;
% % allTrialData.S1trialsZ.S1BINNED500ZstimsVOLOBJ = S1BINNED500ZstimsVOLOBJ;
% % allTrialData.S1trialsZ.S1BINNED500ZstimsVOLMO = S1BINNED500ZstimsVOLMO;
% % 
% % allTrialData.STRtrialsZ.STRBINNED500ZstimsFORCOBJ = STRBINNED500ZstimsFORCOBJ;
% % allTrialData.STRtrialsZ.STRBINNED500ZstimsFORCMO = STRBINNED500ZstimsFORCMO;
% % allTrialData.STRtrialsZ.STRBINNED500ZstimsVOLOBJ = STRBINNED500ZstimsVOLOBJ;
% % allTrialData.STRtrialsZ.STRBINNED500ZstimsVOLMO = STRBINNED500ZstimsVOLMO;
% % 
% % allTrialData.BLAtrialsZ.BLABINNED500ZstimsFORCOBJ = BLABINNED500ZstimsFORCOBJ;
% % allTrialData.BLAtrialsZ.BLABINNED500ZstimsFORCMO = BLABINNED500ZstimsFORCMO;
% % allTrialData.BLAtrialsZ.BLABINNED500ZstimsVOLOBJ = BLABINNED500ZstimsVOLOBJ;
% % allTrialData.BLAtrialsZ.BLABINNED500ZstimsVOLMO = BLABINNED500ZstimsVOLMO;
% % 
% % for a = 1:length(S1good)
% %     S1BINNED500ZISIstimsFORCOBJ{a} = bsp500BINZISIFORCtrobj{S1good(a)};
% %     S1BINNED500ZISIstimsFORCMO{a} = bsp500BINZISIFORCtrsoc{S1good(a)};
% %     S1BINNED500ZISIstimsVOLOBJ{a} = bsp500BINZISIVOLtrobj{S1good(a)};
% %     S1BINNED500ZISIstimsVOLMO{a} = bsp500BINZISIVOLtrsoc{S1good(a)};
% % end
% % 
% % for a = 1:length(strgood)
% %     STRBINNED500ZISIstimsFORCOBJ{a} = bsp500BINZISIFORCtrobj{strgood(a)};
% %     STRBINNED500ZISIstimsFORCMO{a} = bsp500BINZISIFORCtrsoc{strgood(a)};
% %     STRBINNED500ZISIstimsVOLOBJ{a} = bsp500BINZISIVOLtrobj{strgood(a)};
% %     STRBINNED500ZISIstimsVOLMO{a} = bsp500BINZISIVOLtrsoc{strgood(a)};
% % end
% % 
% % for a = 1:length(blagood)
% %     BLABINNED500ZISIstimsFORCOBJ{a} = bsp500BINZISIFORCtrobj{blagood(a)};
% %     BLABINNED500ZISIstimsFORCMO{a} = bsp500BINZISIFORCtrsoc{blagood(a)};
% %     BLABINNED500ZISIstimsVOLOBJ{a} = bsp500BINZISIVOLtrobj{blagood(a)};
% %     BLABINNED500ZISIstimsVOLMO{a} = bsp500BINZISIVOLtrsoc{blagood(a)};
% % end
% % 
% % %% create data structure to save the binned firing 
% % 
% % allTrialData.S1trialsZISI.S1BINNED500ZISIstimsFORCOBJ = S1BINNED500ZISIstimsFORCOBJ;
% % allTrialData.S1trialsZISI.S1BINNED500ZISIstimsFORCMO = S1BINNED500ZISIstimsFORCMO;
% % allTrialData.S1trialsZISI.S1BINNED500ZISIstimsVOLOBJ = S1BINNED500ZISIstimsVOLOBJ;
% % allTrialData.S1trialsZISI.S1BINNED500ZISIstimsVOLMO = S1BINNED500ZISIstimsVOLMO;
% % 
% % allTrialData.STRtrialsZISI.STRBINNED500ZISIstimsFORCOBJ = STRBINNED500ZISIstimsFORCOBJ;
% % allTrialData.STRtrialsZISI.STRBINNED500ZISIstimsFORCMO = STRBINNED500ZISIstimsFORCMO;
% allTrialData.STRtrialsZISI.STRBINNED500ZISIstimsVOLOBJ = STRBINNED500ZISIstimsVOLOBJ;
% allTrialData.STRtrialsZISI.STRBINNED500ZISIstimsVOLMO = STRBINNED500ZISIstimsVOLMO;
% 
% allTrialData.BLAtrialsZISI.BLABINNED500ZISIstimsFORCOBJ = BLABINNED500ZISIstimsFORCOBJ;
% allTrialData.BLAtrialsZISI.BLABINNED500ZISIstimsFORCMO = BLABINNED500ZISIstimsFORCMO;
% allTrialData.BLAtrialsZISI.BLABINNED500ZISIstimsVOLOBJ = BLABINNED500ZISIstimsVOLOBJ;
% allTrialData.BLAtrialsZISI.BLABINNED500ZISIstimsVOLMO = BLABINNED500ZISIstimsVOLMO;
% 
% 
% 
% 
% 
% %
% %
% %
% %
% %%
% %%
% 
% 
% % SPECIFY GETTING THE DIFFERENT AUC VALUES
% timerangeSTIM = (1.75/0.05):(7/0.05);
% timerangeSHORTSTIM = (1/0.05):(5/0.05);
% timerangePLATFORMfr = (1/0.05):(3/0.05);
% timerangePLATFORMls = (6/0.05):(8/0.05);
% 
% nostim = 0;
% yesstim = 1;
% [S1AUCForcObjvsSocSTIM, S1AUCForcObjvsSocSTIMSh, S1p1allSTIM, S1p2allSTIM] = getAUCPREF(timerangeSTIM,[],S1allstims, nostim);
% [S1AUCForcObjvsSocSHORTSTIM,S1AUCForcObjvsSocSHORTSTIMSh, S1p1allSHORTSTIM, S1p2allSHORTSTIM] = getAUCPREF(timerangeSHORTSTIM,[],S1allstims, nostim);
% [S1AUCForcObjvsSocPLATFORM, S1AUCForcObjvsSocPLATFORMSh S1p1allPLATFORM, S1p2allPLATFORM] = getAUCPREF(timerangePLATFORMfr,timerangePLATFORMls,S1allstims, yesstim);
% 
% 
% [STRAUCForcObjvsSocSTIM,STRAUCForcObjvsSocSTIMSh, STRp1allSTIM, STRp2allSTIM] = getAUCPREF(timerangeSTIM,[],STRallstims, nostim);
% [STRAUCForcObjvsSocSHORTSTIM,STRAUCForcObjvsSocSHORTSTIMSh,STRp1allSHORTSTIM, STRp2allSHORTSTIM] = getAUCPREF(timerangeSHORTSTIM,[],STRallstims, nostim);
% [STRAUCForcObjvsSocPLATFORM,STRAUCForcObjvsSocPLATFORMSh, STRp1allPLATFORM, STRp2allPLATFORM] = getAUCPREF(timerangePLATFORMfr,timerangePLATFORMls,STRallstims, yesstim);
% 
% [BLAAUCForcObjvsSocSTIM,BLAAUCForcObjvsSocSTIMSh, BLAp1allSTIM, BLAp2allSTIM] = getAUCPREF(timerangeSTIM,[],BLAallstims, nostim);
% [BLAAUCForcObjvsSocSHORTSTIM,BLAAUCForcObjvsSocSHORTSTIMSh, BLAp1allSHORTSTIM, BLAp2allSHORTSTIM] = getAUCPREF(timerangeSHORTSTIM,[],BLAallstims, nostim);
% [BLAAUCForcObjvsSocPLATFORM,BLAAUCForcObjvsSocPLATFORMSh, BLAp1allPLATFORM, BLAp2allPLATFORM] = getAUCPREF(timerangePLATFORMfr,timerangePLATFORMls,BLAallstims, yesstim);
% 
% 
% %% Save ROC for allFiringProperties
% 
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSTIM = S1AUCForcObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSHORTSTIM = S1AUCForcObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcPLATFORM = S1AUCForcObjvsSocPLATFORM;
% 
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSTIM = STRAUCForcObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSHORTSTIM = STRAUCForcObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcPLATFORM = STRAUCForcObjvsSocPLATFORM;
% 
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSTIM = BLAAUCForcObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSHORTSTIM = BLAAUCForcObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcPLATFORM = BLAAUCForcObjvsSocPLATFORM;
% %%
% 
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSTIMSh = S1AUCForcObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSHORTSTIMSh = S1AUCForcObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcPLATFORMSh = S1AUCForcObjvsSocPLATFORMSh;
% 
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSTIMSh = STRAUCForcObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSHORTSTIMSh = STRAUCForcObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcPLATFORMSh = STRAUCForcObjvsSocPLATFORMSh;
% 
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSTIMSh = BLAAUCForcObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSHORTSTIMSh = BLAAUCForcObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcPLATFORMSh = BLAAUCForcObjvsSocPLATFORMSh;
% 
% 
% 
% 
% %% SPECIFY GETTING THE DIFFERENT AUC VALUES
% timerangeSTIM = (1.75/0.05):(7/0.05);
% timerangeSHORTSTIM = (1/0.05):(5/0.05);
% timerangePLATFORMfr = (1/0.05):(3/0.05);
% timerangePLATFORMls = (6/0.05):(8/0.05);
% 
% nostim = 0;
% yesstim = 1;
% [S1AUCVolObjvsSocSTIM, S1AUCVolObjvsSocSTIMSh, S1p1allSTIM, S1p2allSTIM] = getAUCPREFVOL(timerangeSTIM,[],S1allstims, nostim);
% [S1AUCVolObjvsSocSHORTSTIM,S1AUCVolObjvsSocSHORTSTIMSh, S1p1allSHORTSTIM, S1p2allSHORTSTIM] = getAUCPREFVOL(timerangeSHORTSTIM,[],S1allstims, nostim);
% [S1AUCVolObjvsSocPLATFORM, S1AUCVolObjvsSocPLATFORMSh S1p1allPLATFORM, S1p2allPLATFORM] = getAUCPREFVOL(timerangePLATFORMfr,timerangePLATFORMls,S1allstims, yesstim);
% 
% 
% [STRAUCVolObjvsSocSTIM,STRAUCVolObjvsSocSTIMSh, STRp1allSTIM, STRp2allSTIM] = getAUCPREFVOL(timerangeSTIM,[],STRallstims, nostim);
% [STRAUCVolObjvsSocSHORTSTIM,STRAUCVolObjvsSocSHORTSTIMSh,STRp1allSHORTSTIM, STRp2allSHORTSTIM] = getAUCPREFVOL(timerangeSHORTSTIM,[],STRallstims, nostim);
% [STRAUCVolObjvsSocPLATFORM,STRAUCVolObjvsSocPLATFORMSh, STRp1allPLATFORM, STRp2allPLATFORM] = getAUCPREFVOL(timerangePLATFORMfr,timerangePLATFORMls,STRallstims, yesstim);
% 
% [BLAAUCVolObjvsSocSTIM,BLAAUCVolObjvsSocSTIMSh, BLAp1allSTIM, BLAp2allSTIM] = getAUCPREFVOL(timerangeSTIM,[],BLAallstims, nostim);
% [BLAAUCVolObjvsSocSHORTSTIM,BLAAUCVolObjvsSocSHORTSTIMSh, BLAp1allSHORTSTIM, BLAp2allSHORTSTIM] = getAUCPREFVOL(timerangeSHORTSTIM,[],BLAallstims, nostim);
% [BLAAUCVolObjvsSocPLATFORM,BLAAUCVolObjvsSocPLATFORMSh, BLAp1allPLATFORM, BLAp2allPLATFORM] = getAUCPREFVOL(timerangePLATFORMfr,timerangePLATFORMls,BLAallstims, yesstim);
% 
% %
% %Save ROC for allFiringProperties
% 
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSTIM = S1AUCVolObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSHORTSTIM = S1AUCVolObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolPLATFORM = S1AUCVolObjvsSocPLATFORM;
% 
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSTIM = STRAUCVolObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSHORTSTIM = STRAUCVolObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolPLATFORM = STRAUCVolObjvsSocPLATFORM;
% 
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSTIM = BLAAUCVolObjvsSocSTIM;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSHORTSTIM = BLAAUCVolObjvsSocSHORTSTIM;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolPLATFORM = BLAAUCVolObjvsSocPLATFORM;
% 
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSTIMSh = S1AUCVolObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSHORTSTIMSh = S1AUCVolObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolPLATFORMSh = S1AUCVolObjvsSocPLATFORMSh;
% 
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSTIMSh = STRAUCVolObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSHORTSTIMSh = STRAUCVolObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolPLATFORMSh = STRAUCVolObjvsSocPLATFORMSh;
% 
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSTIMSh = BLAAUCVolObjvsSocSTIMSh;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSHORTSTIMSh = BLAAUCVolObjvsSocSHORTSTIMSh;
% allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolPLATFORMSh = BLAAUCVolObjvsSocPLATFORMSh;
% % 
% % 
% allFiringProperties.allsingleunits = goodtruclu;
% allFiringProperties.allS1units = S1good;
% allFiringProperties.allstrunits = strgood;
% allFiringProperties.allblaunits = blagood;
% allFiringProperties.region = region;
% allFiringProperties.allspikewidths = allwidths;
% allFiringProperties.allS1widths = allwidths(S1good);
% allFiringProperties.allstrwidths = allwidths(strgood);
% allFiringProperties.allblawidths = allwidths(blagood);
% allFiringProperties.allspontfiring = bspspontavg1st;
% allFiringProperties.stimonsets = stimonsets;
% allFiringProperties.stimtype = ["VolObj","VolMo","ForcObj","ForcMo"];
FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLE", "AUCREDO", "ADDSUPP", "NEWMODIDX", "BASEFIRE", ".mat");

save(FiringFileName, "allFiringProperties")

% 
% FiringFileName = strcat(apbin1, "allTrialData", "WHOLETRACESHUFFLE", "AUCREDO", "FORCNEW", "ADDSUPP", ".mat");
% 
% save(FiringFileName, "allTrialData")
% %%
% % % %%
% % 
% FiringFileName = strcat(apbin1, "allFiringProperties", "WHOLETRACESHUFFLEAUCREDOFORC", ".mat");
% 
% save(FiringFileName, "allFiringProperties")
% % % %%
% 
% FiringFileName = strcat(apbin1, "allFiringProperties", "newREDO", ".mat");
% 
% save(FiringFileName, "allFiringProperties")

%
% %% ROC STACKED PLOTS for FORC
% for a = 1:length(allstims)
%     testall = allstims{a};
% for j = 1:length(-2:0.05:6.95)
% meanISI = nanmean(testall(81:120,j));
% meansocial = nanmean(testall(121:160,j));
% testobject = testall(81:120,j);
% testsocial = testall(121:160,j);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% DVTR(i) = nanmean(firstsocial);
% DVISI(i) = nanmean(firstobject);
% end
% %figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
% dvmin = min([DVISI DVTR]);
% dvmax = max([DVISI DVTR]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DVISI < cr))/length(DVISI);
% p2(i) = length(find(DVTR < cr))/length(DVTR);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCneg(a,j) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCneg(a,j) = trapz(p1,p2);
% end
% end
% AUCallFORC(a,:) = abs(AUCneg(a,:)-1);
% disp(a);
% end
% 
% %% ROC STACKED PLOTS for FORC ALT
% for a = 1:length(allstimsalt)
%     testall = allstimsalt{a};
% for j = 1:length(-2:0.05:6.95)
% meanISI = nanmean(testall(81:120,j));
% meansocial = nanmean(testall(121:160,j));
% testobject = testall(81:120,j);
% testsocial = testall(121:160,j);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% DVTR(i) = nanmean(firstsocial);
% DVISI(i) = nanmean(firstobject);
% end
% %figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
% dvmin = min([DVISI DVTR]);
% dvmax = max([DVISI DVTR]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DVISI < cr))/length(DVISI);
% p2(i) = length(find(DVTR < cr))/length(DVTR);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCneg(a,j) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCneg(a,j) = trapz(p1,p2);
% end
% end
% AUCallFORCalt(a,:) = abs(AUCneg(a,:)-1);
% disp(a);
% end
% 
% 
% %%
% 
% % % Shuffled Dataset 
% % % HERE SHUFFLE THE DATA
% % for a = 1:length(allstims)
% %     for Sh = 1:1000
% %         for m = 1:size(allstims{a}, 1)
% %             bspcurr = allstims{a};
% %             bspallShuffle(m,:) = Shuffle(bspcurr(m,:));
% %         end
% %         for j = 1:length(-2:0.05:6.95)
% %             meanISI = nanmean(bspallShuffle(81:120,j));
% %             meansocial = nanmean(testall(121:160,j));
% %             testobject = testall(81:120,j);
% %             testsocial = testall(121:160,j);
% %             for i = 1:size(testsocial,1)
% %                 firstsocial = testsocial(i,:);
% %                 firstobject = testobject(i,:);
% %                 DVTR(i) = nanmean(firstsocial);
% %                 DVISI(i) = nanmean(firstobject);
% %             end
% % %figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
% %             dvmin = min([DVISI DVTR]);
% %             dvmax = max([DVISI DVTR]);
% %             dvstp = (dvmax-dvmin)/100;
% %             p1 = [];
% %             p2 = [];
% %             i=1;
% %             for cr=dvmin:dvstp:dvmax
% %                 p1(i) = length(find(DVISI < cr))/length(DVISI);
% %                 p2(i) = length(find(DVTR < cr))/length(DVTR);
% %                 i = i+1;
% %             end
% %             p1 = sort(p1);
% %             p2 = sort(p2);
% % if isempty(p1) == 1
% %     p1all(:,Sh) = zeros(101,1);
% %     p2all(:,Sh) = zeros(101,1);
% %     AUCneg(Sh,j) = 0.5;
% % elseif isempty(p1) == 0
% %     p1all(:,Sh) = p1;
% %     p2all(:,Sh) = p2;
% %     AUCneg(Sh,j) = trapz(p1,p2);
% % end
% % end
% %     AUCShFORC(Sh,:) = abs(AUCneg(Sh,:)-1);
% %     end
% %     AUCallShFORC{a} = AUCShFORC;
% %     clear AUCShForc
% %     disp(a)
% % end
% 
% 
% 
% %% ROC STACKED VOL
% 
% for a = 1:length(allstims)
%     testall = allstims{a};
% for j = 1:length(-2:0.05:6.95)
% meanISI = nanmean(testall(1:40,j));
% meansocial = nanmean(testall(41:80,j));
% testobject = testall(1:40,j);
% testsocial = testall(41:80,j);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% DVTR(i) = nanmean(firstsocial);
% DVISI(i) = nanmean(firstobject);
% end
% %figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
% dvmin = min([DVISI DVTR]);
% dvmax = max([DVISI DVTR]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DVISI < cr))/length(DVISI);
% p2(i) = length(find(DVTR < cr))/length(DVTR);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCneg(a,j) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCneg(a,j) = trapz(p1,p2);
% end
% end
% AUCallVOL(a,:) = abs(AUCneg(a,:)-1);
% disp(a);
% end
% 
% %% ROC STACKED PLOTS for VOL ALT
% 
% for a = 1:length(allstimsalt)
%     testall = allstimsalt{a};
% for j = 1:length(-2:0.05:6.95)
% meanISI = nanmean(testall(1:40,j));
% meansocial = nanmean(testall(41:80,j));
% testobject = testall(1:40,j);
% testsocial = testall(41:80,j);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% DVTR(i) = nanmean(firstsocial);
% DVISI(i) = nanmean(firstobject);
% end
% %figure(1); clf; histogram(DVISI,10); hold on; histogram(DVTR,10)
% dvmin = min([DVISI DVTR]);
% dvmax = max([DVISI DVTR]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DVISI < cr))/length(DVISI);
% p2(i) = length(find(DVTR < cr))/length(DVTR);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCneg(a,j) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCneg(a,j) = trapz(p1,p2);
% end
% end
% AUCallVOLalt(a,:) = abs(AUCneg(a,:)-1);
% disp(a);
% end
% %% ROC values for FORC SOC vs FORC OBJ
% 
% for a = 1:length(allstims)
% testall = allstims{a}; meanobject = nanmean(testall(81:120,36:100));
% meansocial = nanmean(testall(121:160,36:100));
% testobject = testall(81:120,36:100);
% testsocial = testall(121:160,36:100);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% social2social = dot(firstsocial, meansocial);
% social2object = dot(firstsocial, meanobject);
% DVsocial(i) = social2social - social2object;
% object2social = dot(firstobject, meansocial);
% object2object = dot(firstobject, meanobject);
% DVobject(i) = object2social- object2object;
% end
% figure(1); clf; histogram(DVobject,10); hold on; histogram(DVsocial,10)
% dvmin = min([DVobject DVsocial]);
% dvmax = max([DVobject DVsocial]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% DV = [DVsocial DVobject];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DV < cr))/length(DV);
% p2(i) = length(find(DV > cr))/length(DV);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCForcObjvsSoc(a) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCForcObjvsSoc(a) = trapz(p2,p1);
% end
% end
% 
% 
% %% ROC values fo VOL SOC vs VOL OBJ
% 
% for a = 1:length(allstims)
% testall = allstims{a}; meanobject = nanmean(testall(1:40,36:100));
% meansocial = nanmean(testall(41:80,36:100));
% testobject = testall(1:40,36:100);
% testsocial = testall(41:80,36:100);
% for i = 1:size(testsocial,1)
% firstsocial = testsocial(i,:);
% firstobject = testobject(i,:);
% social2social = dot(firstsocial, meansocial);
% social2object = dot(firstsocial, meanobject);
% DVsocial(i) = social2social - social2object;
% object2social = dot(firstobject, meansocial);
% object2object = dot(firstobject, meanobject);
% DVobject(i) = object2social- object2object;
% end
% figure(1); clf; histogram(DVobject,10); hold on; histogram(DVsocial,10)
% dvmin = min([DVobject DVsocial]);
% dvmax = max([DVobject DVsocial]);
% dvstp = (dvmax-dvmin)/100;
% p1 = [];
% p2 = [];
% DV = [DVsocial DVobject];
% i=1;
% for cr=dvmin:dvstp:dvmax
% p1(i) = length(find(DV < cr))/length(DV);
% p2(i) = length(find(DV > cr))/length(DV);
% i = i+1;
% end
% p1 = sort(p1);
% p2 = sort(p2);
% if isempty(p1) == 1
%     p1all(:,a) = zeros(101,1);
%     p2all(:,a) = zeros(101,1);
%     AUCVolObjvsSoc(a) = 0.5;
% elseif isempty(p1) == 0
%     p1all(:,a) = p1;
%     p2all(:,a) = p2;
%     AUCVolObjvsSoc(a) = trapz(p2,p1);
% end
% end
% 
% %%
% forcmotrials = 121:160;
% [AUCrespFORCMO, AUCShFORCMO, sigexccellsFORCMO, S1RSexccellsFORCMO, S1FSexccellsFORCMO, strRSexccellsFORCMO, strFSexccellsFORCMO, strUCexccellsFORCMO, blaRSexccellsFORCMO, blaFSexccellsFORCMO, blaUCexccellsFORCMO, sigsupcellsFORCMO, S1RSsupcellsFORCMO, S1FSsupcellsFORCMO, strRSsupcellsFORCMO, strFSsupcellsFORCMO, strUCsupcellsFORCMO, blaRSsupcellsFORCMO, blaFSsupcellsFORCMO, blaUCsupcellsFORCMO] = getAUC(bspallstims, forcmotrials, cellsS1RS, cellsS1FS, cellsSTRRS, cellsSTRFS, cellsSTRUC, cellsBLARS, cellsBLAFS, cellsBLAUC, S1good, strgood, blagood);
% 
% forcobjtrials = 81:120;
% [AUCrespFORCOBJ, AUCShFORCOBJ, sigexccellsFORCOBJ, S1RSexccellsFORCOBJ, S1FSexccellsFORCOBJ, strRSexccellsFORCOBJ, strFSexccellsFORCOBJ, strUCexccellsFORCOBJ, blaRSexccellsFORCOBJ, blaFSexccellsFORCOBJ, blaUCexccellsFORCOBJ, sigsupcellsFORCOBJ, S1RSsupcellsFORCOBJ, S1FSsupcellsFORCOBJ, strRSsupcellsFORCOBJ, strFSsupcellsFORCOBJ, strUCsupcellsFORCOBJ, blaRSsupcellsFORCOBJ, blaFSsupcellsFORCOBJ, blaUCsupcellsFORCOBJ] = getAUC(bspallstims, forcobjtrials, cellsS1RS, cellsS1FS, cellsSTRRS, cellsSTRFS, cellsSTRUC, cellsBLARS, cellsBLAFS, cellsBLAUC, S1good, strgood, blagood);
% 
% volmotrials = 41:80;
% [AUCrespVOLMO, AUCShVOLMO, sigexccellsVOLMO, S1RSexccellsVOLMO, S1FSexccellsVOLMO, strRSexccellsVOLMO, strFSexccellsVOLMO, strUCexccellsVOLMO, blaRSexccellsVOLMO, blaFSexccellsVOLMO, blaUCexccellsVOLMO, sigsupcellsVOLMO, S1RSsupcellsVOLMO, S1FSsupcellsVOLMO, strRSsupcellsVOLMO, strFSsupcellsVOLMO, strUCsupcellsVOLMO, blaRSsupcellsVOLMO, blaFSsupcellsVOLMO, blaUCsupcellsVOLMO] = getAUC(bspallstims, volmotrials, cellsS1RS, cellsS1FS, cellsSTRRS, cellsSTRFS, cellsSTRUC, cellsBLARS, cellsBLAFS, cellsBLAUC, S1good, strgood, blagood);
% 
% volobjtrials = 1:40;
% [AUCrespVOLOBJ, AUCShVOLOBJ, sigexccellsVOLOBJ, S1RSexccellsVOLOBJ, S1FSexccellsVOLOBJ, strRSexccellsVOLOBJ, strFSexccellsVOLOBJ, strUCexccellsVOLOBJ, blaRSexccellsVOLOBJ, blaFSexccellsVOLOBJ, blaUCexccellsVOLOBJ, sigsupcellsVOLOBJ, S1RSsupcellsVOLOBJ, S1FSsupcellsVOLOBJ, strRSsupcellsVOLOBJ, strFSsupcellsVOLOBJ, strUCsupcellsVOLOBJ, blaRSsupcellsVOLOBJ, blaFSsupcellsVOLOBJ, blaUCsupcellsVOLOBJ] = getAUC(bspallstims, volobjtrials, cellsS1RS, cellsS1FS, cellsSTRRS, cellsSTRFS, cellsSTRUC, cellsBLARS, cellsBLAFS, cellsBLAUC, S1good, strgood, blagood);
% 
% % 
% %% Save general cell counts
% 
% allFiringProperties.allsingleunits = goodtruclu;
% allFiringProperties.allS1units = S1good;
% allFiringProperties.allstrunits = strgood;
% allFiringProperties.allblaunits = blagood;
% allFiringProperties.region = region;
% allFiringProperties.allspikewidths = allwidths;
% allFiringProperties.allS1widths = allwidths(S1good);
% allFiringProperties.allstrwidths = allwidths(strgood);
% allFiringProperties.allblawidths = allwidths(blagood);
% allFiringProperties.allspontfiring = bspspontavg1st;
% allFiringProperties.stimonsets = stimonsets;
% allFiringProperties.stimtype = ["VolObj","VolMo","ForcObj","ForcMo"];
% 
% allFiringProperties.sigcells.sigallcells.allexccellsFORCMO = sigexccellsFORCMO;
% allFiringProperties.sigcells.sigallcells.allexccellsFORCOBJ = sigexccellsFORCOBJ;
% allFiringProperties.sigcells.sigallcells.allexccellsVOLMO = sigexccellsVOLMO;
% allFiringProperties.sigcells.sigallcells.allexccellsVOLOBJ = sigexccellsVOLOBJ;
% allFiringProperties.sigcells.sigallcells.allsupcellsFORCMO = sigsupcellsFORCMO;
% allFiringProperties.sigcells.sigallcells.allsupcellsFORCOBJ = sigsupcellsFORCOBJ;
% allFiringProperties.sigcells.sigallcells.allsupcellsVOLMO = sigsupcellsVOLMO;
% allFiringProperties.sigcells.sigallcells.allsupcellsVOLOBJ = sigsupcellsVOLOBJ;
% 
% %All SORTED CELLS
% 
% allFiringProperties.sortedcells.allcells.allcellsFORCMO = FORCMOnewmeansortedcells;
% allFiringProperties.sortedcells.allcells.allcellsFORCOBJ = FORCOBJnewmeansortedcells;
% allFiringProperties.sortedcells.allcells.allcellsVOLMO = VOLMOnewmeansortedcells;
% allFiringProperties.sortedcells.allcells.allcellsVOLOBJ = VOLOBJnewmeansortedcells;
% 
% allFiringProperties.sortedcells.S1cells.S1cellsFORCMO = FORCMOnewmeansortedcellsS1;
% allFiringProperties.sortedcells.S1cells.S1cellsFORCOBJ = FORCOBJnewmeansortedcellsS1;
% allFiringProperties.sortedcells.S1cells.S1cellsVOLMO = VOLMOnewmeansortedcellsS1;
% allFiringProperties.sortedcells.S1cells.S1cellsVOLOBJ = VOLOBJnewmeansortedcellsS1;
% 
% allFiringProperties.sortedcells.strcells.strcellsFORCMO = FORCMOnewmeansortedcellsstr;
% allFiringProperties.sortedcells.strcells.strcellsFORCOBJ = FORCOBJnewmeansortedcellsstr;
% allFiringProperties.sortedcells.strcells.strcellsVOLMO = VOLMOnewmeansortedcellsstr;
% allFiringProperties.sortedcells.strcells.strcellsVOLOBJ = VOLOBJnewmeansortedcellsstr;
% 
% allFiringProperties.sortedcells.blacells.blacellsFORCMO = FORCMOnewmeansortedcellsbla;
% allFiringProperties.sortedcells.blacells.blacellsFORCOBJ = FORCOBJnewmeansortedcellsbla;
% allFiringProperties.sortedcells.blacells.blacellsVOLMO = VOLMOnewmeansortedcellsbla;
% allFiringProperties.sortedcells.blacells.blacellsVOLOBJ = VOLOBJnewmeansortedcellsbla;
% 
% 
% allFiringProperties.sortedcells.lengths.alllength = newlength;
% allFiringProperties.sortedcells.lengths.S1length = newlengthS1;
% allFiringProperties.sortedcells.lengths.strlength = newlengthstr;
% allFiringProperties.sortedcells.lengths.blalength= newlengthbla;
% 
% 
% %Only S1 FS & RS cells
% allFiringProperties.sigcells.sigS1cells.S1RSexccellsFORCMO = S1good(cellsS1RS(S1RSexccellsFORCMO));
% allFiringProperties.sigcells.sigS1cells.S1RSexccellsFORCOBJ = S1good(cellsS1RS(S1RSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigS1cells.S1RSexccellsVOLMO = S1good(cellsS1RS(S1RSexccellsVOLMO));
% allFiringProperties.sigcells.sigS1cells.S1RSexccellsVOLOBJ = S1good(cellsS1RS(S1RSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigS1cells.S1RSsupcellsFORCMO = S1good(cellsS1RS(S1RSsupcellsFORCMO));
% allFiringProperties.sigcells.sigS1cells.S1RSsupcellsFORCOBJ = S1good(cellsS1RS(S1RSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigS1cells.S1RSsupcellsVOLMO = S1good(cellsS1RS(S1RSsupcellsVOLMO));
% allFiringProperties.sigcells.sigS1cells.S1RSsupcellsVOLOBJ = S1good(cellsS1RS(S1RSsupcellsVOLOBJ));
% 
% allFiringProperties.sigcells.sigS1cells.S1FSexccellsFORCMO = S1good(cellsS1FS(S1FSexccellsFORCMO));
% allFiringProperties.sigcells.sigS1cells.S1FSexccellsFORCOBJ = S1good(cellsS1FS(S1FSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigS1cells.S1FSexccellsVOLMO = S1good(cellsS1FS(S1FSexccellsVOLMO));
% allFiringProperties.sigcells.sigS1cells.S1FSexccellsVOLOBJ = S1good(cellsS1FS(S1FSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigS1cells.S1FSsupcellsFORCMO = S1good(cellsS1FS(S1FSsupcellsFORCMO));
% allFiringProperties.sigcells.sigS1cells.S1FSsupcellsFORCOBJ = S1good(cellsS1FS(S1FSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigS1cells.S1FSsupcellsVOLMO = S1good(cellsS1FS(S1FSsupcellsVOLMO));
% allFiringProperties.sigcells.sigS1cells.S1FSsupcellsVOLOBJ = S1good(cellsS1FS(S1FSsupcellsVOLOBJ));
% 
% %Only Striatum FS & RS Cells
% allFiringProperties.sigcells.sigSTRcells.STRRSexccellsFORCMO = strgood(cellsSTRRS(strRSexccellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRRSexccellsFORCOBJ = strgood(cellsSTRRS(strRSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRRSexccellsVOLMO = strgood(cellsSTRRS(strRSexccellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRRSexccellsVOLOBJ = strgood(cellsSTRRS(strRSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRRSsupcellsFORCMO = strgood(cellsSTRRS(strRSsupcellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRRSsupcellsFORCOBJ = strgood(cellsSTRRS(strRSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRRSsupcellsVOLMO = strgood(cellsSTRRS(strRSsupcellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRRSsupcellsVOLOBJ = strgood(cellsSTRRS(strRSsupcellsVOLOBJ));
% 
% allFiringProperties.sigcells.sigSTRcells.STRFSexccellsFORCMO = strgood(cellsSTRFS(strFSexccellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRFSexccellsFORCOBJ = strgood(cellsSTRFS(strFSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRFSexccellsVOLMO = strgood(cellsSTRFS(strFSexccellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRFSexccellsVOLOBJ = strgood(cellsSTRFS(strFSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRFSsupcellsFORCMO = strgood(cellsSTRFS(strFSsupcellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRFSsupcellsFORCOBJ = strgood(cellsSTRFS(strFSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRFSsupcellsVOLMO = strgood(cellsSTRFS(strFSsupcellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRFSsupcellsVOLOBJ = strgood(cellsSTRFS(strFSsupcellsVOLOBJ));
% 
% allFiringProperties.sigcells.sigSTRcells.STRUCexccellsFORCMO = strgood(cellsSTRUC(strUCexccellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRUCexccellsFORCOBJ = strgood(cellsSTRUC(strUCexccellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRUCexccellsVOLMO = strgood(cellsSTRUC(strUCexccellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRUCexccellsVOLOBJ = strgood(cellsSTRUC(strUCexccellsVOLOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRUCsupcellsFORCMO = strgood(cellsSTRUC(strUCsupcellsFORCMO));
% allFiringProperties.sigcells.sigSTRcells.STRUCsupcellsFORCOBJ = strgood(cellsSTRUC(strUCsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigSTRcells.STRUCsupcellsVOLMO = strgood(cellsSTRUC(strUCsupcellsVOLMO));
% allFiringProperties.sigcells.sigSTRcells.STRUCsupcellsVOLOBJ = strgood(cellsSTRUC(strUCsupcellsVOLOBJ));
% 
% %Only BLA FS & RS Cells
% allFiringProperties.sigcells.sigBLAcells.BLARSexccellsFORCMO = blagood(cellsBLARS(blaRSexccellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLARSexccellsFORCOBJ = blagood(cellsBLARS(blaRSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLARSexccellsVOLMO = blagood(cellsBLARS(blaRSexccellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLARSexccellsVOLOBJ = blagood(cellsBLARS(blaRSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLARSsupcellsFORCMO = blagood(cellsBLARS(blaRSsupcellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLARSsupcellsFORCOBJ = blagood(cellsBLARS(blaRSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLARSsupcellsVOLMO = blagood(cellsBLARS(blaRSsupcellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLARSsupcellsVOLOBJ = blagood(cellsBLARS(blaRSsupcellsVOLOBJ));
% 
% allFiringProperties.sigcells.sigBLAcells.BLAFSexccellsFORCMO = blagood(cellsBLAFS(blaFSexccellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLAFSexccellsFORCOBJ = blagood(cellsBLAFS(blaFSexccellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAFSexccellsVOLMO = blagood(cellsBLAFS(blaFSexccellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLAFSexccellsVOLOBJ = blagood(cellsBLAFS(blaFSexccellsVOLOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAFSsupcellsFORCMO = blagood(cellsBLAFS(blaFSsupcellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLAFSsupcellsFORCOBJ = blagood(cellsBLAFS(blaFSsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAFSsupcellsVOLMO = blagood(cellsBLAFS(blaFSsupcellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLAFSsupcellsVOLOBJ = blagood(cellsBLAFS(blaFSsupcellsVOLOBJ));
% 
% allFiringProperties.sigcells.sigBLAcells.BLAUCexccellsFORCMO = blagood(cellsBLAUC(blaUCexccellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLAUCexccellsFORCOBJ = blagood(cellsBLAUC(blaUCexccellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAUCexccellsVOLMO = blagood(cellsBLAUC(blaUCexccellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLAUCexccellsVOLOBJ = blagood(cellsBLAUC(blaUCexccellsVOLOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAUCsupcellsFORCMO = blagood(cellsBLAUC(blaUCsupcellsFORCMO));
% allFiringProperties.sigcells.sigBLAcells.BLAUCsupcellsFORCOBJ = blagood(cellsBLAUC(blaUCsupcellsFORCOBJ));
% allFiringProperties.sigcells.sigBLAcells.BLAUCsupcellsVOLMO = blagood(cellsBLAUC(blaUCsupcellsVOLMO));
% allFiringProperties.sigcells.sigBLAcells.BLAUCsupcellsVOLOBJ = blagood(cellsBLAUC(blaUCsupcellsVOLOBJ));
% 
% 
% %% Plot for each mean
% max1 = max(nanmean(bspzaverageFORCsoc(sigexccellsFORCMO,:)));
% max2 = max(nanmean(bspzaverageFORCobj(sigexccellsFORCOBJ,:)));
% max3 = max(nanmean(bspzaverageVOLsoc(sigexccellsVOLMO,:)));
% max4 = max(nanmean(bspzaverageVOLobj(sigexccellsVOLOBJ,:)));
% maxall = [max1 max2 max3 max4];
% maxlim = max(maxall);
% 
% min1 = min(nanmean(bspzaverageFORCsoc(sigexccellsFORCMO,:)));
% min2 = min(nanmean(bspzaverageFORCobj(sigexccellsFORCOBJ,:)));
% min3 = min(nanmean(bspzaverageVOLsoc(sigexccellsVOLMO,:)));
% min4 = min(nanmean(bspzaverageVOLobj(sigexccellsVOLOBJ,:)));
% minall = [min1 min2 min3 min4];
% minlim = min(minall);
% 
% filename = strsplit(apbin1,'_');
% nameofexpt = strcat(filename(1), "_", filename(2), filename(3), "_", filename(4),filename(5), ".pdf");
% f=figure; subplot(3,2,1); ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageFORCsoc(sigexccellsFORCMO,:)), nanstd(bspzaverageFORCsoc(sigexccellsFORCMO,:))/(sqrt(size(bspzaverageFORCsoc(sigexccellsFORCMO,:),2)))); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Forc Mo 40 Stims")
% hold on; subplot(3,2,2); ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageFORCobj(sigexccellsFORCOBJ,:)), nanstd(bspzaverageFORCobj(sigexccellsFORCOBJ,:))/(sqrt(size(bspzaverageFORCobj(sigexccellsFORCOBJ,:),2)))); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Forc Obj 40 Stims")
% hold on; subplot(3,2,3); ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageVOLsoc(sigexccellsVOLMO,:)), nanstd(bspzaverageVOLsoc(sigexccellsVOLMO,:))/(sqrt(size(bspzaverageVOLsoc(sigexccellsVOLMO,:),2)))); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Vol Mo 40 Stims")
% hold on; subplot(3,2,4); ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageVOLobj(sigexccellsVOLOBJ,:)), nanstd(bspzaverageVOLobj(sigexccellsVOLOBJ,:))/(sqrt(size(bspzaverageVOLobj(sigexccellsVOLOBJ,:),2)))); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Vol Obj 40 Stims")
% subplot(3,2,1); hold on; ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageFORCsoc(sigsupcellsFORCMO,:)), nanstd(bspzaverageFORCsoc(sigsupcellsFORCMO,:))/(sqrt(size(bspzaverageFORCsoc(sigsupcellsFORCMO,:),2))), 'lineprops', 'r'); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Forc Mo 40 Stims")
% subplot(3,2,2); hold on; ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageFORCobj(sigsupcellsFORCOBJ,:)), nanstd(bspzaverageFORCobj(sigsupcellsFORCOBJ,:))/(sqrt(size(bspzaverageFORCobj(sigsupcellsFORCOBJ,:),2))),'lineprops', 'r'); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Forc Obj 40 Stims")
% subplot(3,2,3); hold on; ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageVOLsoc(sigsupcellsVOLMO,:)), nanstd(bspzaverageVOLsoc(sigsupcellsVOLMO,:))/(sqrt(size(bspzaverageVOLsoc(sigsupcellsVOLMO,:),2))),'lineprops', 'r'); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Vol Mo 40 Stims")
% subplot(3,2,4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(bspzaverageVOLobj(sigsupcellsVOLOBJ,:)), nanstd(bspzaverageVOLobj(sigsupcellsVOLOBJ,:))/(sqrt(size(bspzaverageVOLobj(sigsupcellsVOLOBJ,:),2))),'lineprops', 'r'); xlim([-1.5 6.5]); ylim([minlim maxlim]); xlabel("Time(s)"); ylabel("Z-score Spks/s"); title("Avg Vol Obj 40 Stims")
% subplot(3,2,5); hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(bspaverageFORCsoc(sigexccellsFORCMO)),nanmean(bspaverageFORCobj(sigexccellsFORCOBJ)),nanmean(bspaverageVOLsoc(sigexccellsVOLMO)),nanmean(bspaverageVOLobj(sigexccellsVOLOBJ))]';
% errhigh = [nanstd(bspaverageFORCsoc(sigexccellsFORCMO))/sqrt(length(bspaverageFORCsoc(sigexccellsFORCMO))),nanstd(bspaverageFORCobj(sigexccellsFORCOBJ))/sqrt(length(bspaverageFORCobj(sigexccellsFORCOBJ))),nanstd(bspaverageVOLsoc(sigexccellsVOLMO))/sqrt(length(bspaverageVOLsoc(sigexccellsVOLMO))),nanstd(bspaverageVOLobj(sigexccellsVOLOBJ))/sqrt(length(bspaverageVOLobj(sigexccellsVOLOBJ)))];
% errlow = [nanstd(bspaverageFORCsoc(sigexccellsFORCMO))/sqrt(length(bspaverageFORCsoc(sigexccellsFORCMO))),nanstd(bspaverageFORCobj(sigexccellsFORCOBJ))/sqrt(length(bspaverageFORCobj(sigexccellsFORCOBJ))),nanstd(bspaverageVOLsoc(sigexccellsVOLMO))/sqrt(length(bspaverageVOLsoc(sigexccellsVOLMO))),nanstd(bspaverageVOLobj(sigexccellsVOLOBJ))/sqrt(length(bspaverageVOLobj(sigexccellsVOLOBJ)))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(bspaverageFORCsoc(sigsupcellsFORCMO)),nanmean(bspaverageFORCobj(sigsupcellsFORCOBJ)),nanmean(bspaverageVOLsoc(sigexccellsVOLMO)),nanmean(bspaverageVOLobj(sigexccellsVOLOBJ))]';
% errhigh = [nanstd(bspaverageFORCsoc(sigsupcellsFORCMO))/sqrt(length(bspaverageFORCsoc(sigsupcellsFORCMO))),nanstd(bspaverageFORCobj(sigsupcellsFORCOBJ))/sqrt(length(bspaverageFORCobj(sigsupcellsFORCOBJ))),nanstd(bspaverageVOLsoc(sigsupcellsVOLMO))/sqrt(length(bspaverageVOLsoc(sigsupcellsVOLMO))),nanstd(bspaverageVOLobj(sigsupcellsVOLOBJ))/sqrt(length(bspaverageVOLobj(sigsupcellsVOLOBJ)))];
% errlow = [nanstd(bspaverageFORCsoc(sigsupcellsFORCMO))/sqrt(length(bspaverageFORCsoc(sigsupcellsFORCMO))),nanstd(bspaverageFORCobj(sigsupcellsFORCOBJ))/sqrt(length(bspaverageFORCobj(sigsupcellsFORCOBJ))),nanstd(bspaverageVOLsoc(sigsupcellsVOLMO))/sqrt(length(bspaverageVOLsoc(sigsupcellsVOLMO))),nanstd(bspaverageVOLobj(sigsupcellsVOLOBJ))/sqrt(length(bspaverageVOLobj(sigsupcellsVOLOBJ)))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of Excited Cells for Each Type of Touch")
% 
% sgtitle("Mean of all Excited vs Suppressed cells");
% exportgraphics(f, nameofexpt);
% 
% 
% % EXC CELLS
% S1RSFORCsoc = bspspaverageFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:);
% S1RSFORCobj = bspspaverageFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:);
% S1RSVOLsoc = bspspaverageVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:);
% S1RSVOLobj = bspspaverageVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:);
% 
% S1FSFORCsoc = bspspaverageFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:);
% S1FSFORCobj = bspspaverageFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:);
% S1FSVOLsoc = bspspaverageVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:);
% S1FSVOLobj = bspspaverageVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:);
% 
% S1RSFORCsocavg = bspaverageFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)));
% S1RSFORCobjavg = bspaverageFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% S1RSVOLsocavg = bspaverageVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)));
% S1RSVOLobjavg = bspaverageVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% 
% S1FSFORCsocavg = bspaverageFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)));
% S1FSFORCobjavg = bspaverageFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% S1FSVOLsocavg = bspaverageVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)));
% S1FSVOLobjavg = bspaverageVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCsoc), nanstd(S1RSFORCsoc)/(sqrt(length(S1RSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells")
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCobj), nanstd(S1RSFORCobj)/(sqrt(length(S1RSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLsoc), nanstd(S1RSVOLsoc)/(sqrt(length(S1RSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLobj), nanstd(S1RSVOLobj)/(sqrt(length(S1RSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");  legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCsoc), nanstd(S1FSFORCsoc)/(sqrt(length(S1FSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCobj), nanstd(S1FSFORCobj)/(sqrt(length(S1FSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLsoc), nanstd(S1FSVOLsoc)/(sqrt(length(S1FSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLobj), nanstd(S1FSVOLobj)/(sqrt(length(S1FSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(S1RSFORCsocavg),nanmean(S1RSFORCobjavg),nanmean(S1RSVOLsocavg),nanmean(S1RSVOLobjavg)]';
% errhigh = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% errlow = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS S1 Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(S1FSFORCsocavg),nanmean(S1FSFORCobjavg),nanmean(S1FSVOLsocavg),nanmean(S1FSVOLobjavg)]';
% errhigh = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% errlow = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS S1 Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS S1 Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% 
% STRRSFORCsoc = bspspaverageFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:);
% STRRSFORCobj = bspspaverageFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:);
% STRRSVOLsoc = bspspaverageVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:);
% STRRSVOLobj = bspspaverageVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:);
% 
% STRFSFORCsoc = bspspaverageFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:);
% STRFSFORCobj = bspspaverageFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:);
% STRFSVOLsoc = bspspaverageVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:);
% STRFSVOLobj = bspspaverageVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:);
% 
% STRRSFORCsocavg = bspaverageFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)));
% STRRSFORCobjavg = bspaverageFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% STRRSVOLsocavg = bspaverageVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)));
% STRRSVOLobjavg = bspaverageVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% 
% STRFSFORCsocavg = bspaverageFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)));
% STRFSFORCobjavg = bspaverageFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% STRFSVOLsocavg = bspaverageVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)));
% STRFSVOLobjavg = bspaverageVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% 
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSFORCsoc), nanstd(STRRSFORCsoc)/(sqrt(length(strRSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSFORCobj), nanstd(STRRSFORCobj)/(sqrt(length(strRSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSVOLsoc), nanstd(STRRSVOLsoc)/(sqrt(length(strRSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSVOLobj), nanstd(STRRSVOLobj)/(sqrt(length(strRSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSFORCsoc), nanstd(STRFSFORCsoc)/(sqrt(length(strFSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSFORCobj), nanstd(STRFSFORCobj)/(sqrt(length(strFSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSVOLsoc), nanstd(STRFSVOLsoc)/(sqrt(length(strFSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSVOLobj), nanstd(STRFSVOLobj)/(sqrt(length(strFSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(STRRSFORCsocavg),nanmean(STRRSFORCobjavg),nanmean(STRRSVOLsocavg),nanmean(STRRSVOLobjavg)]';
% errhigh = [nanstd(STRRSFORCsocavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSFORCobjavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSVOLsocavg)/sqrt(length(STRRSVOLsocavg)),nanstd(STRRSVOLobjavg)/sqrt(length(STRRSVOLobjavg))];
% errlow = [nanstd(STRRSFORCsocavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSFORCobjavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSVOLsocavg)/sqrt(length(STRRSVOLsocavg)),nanstd(STRRSVOLobjavg)/sqrt(length(STRRSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS Striatal Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(STRFSFORCsocavg),nanmean(STRFSFORCobjavg),nanmean(STRFSVOLsocavg),nanmean(STRFSVOLobjavg)]';
% errhigh = [nanstd(STRFSFORCsocavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSFORCobjavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSVOLsocavg)/sqrt(length(STRFSVOLsocavg)),nanstd(STRFSVOLobjavg)/sqrt(length(STRFSVOLobjavg))];
% errlow = [nanstd(STRFSFORCsocavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSFORCobjavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSVOLsocavg)/sqrt(length(STRFSVOLsocavg)),nanstd(STRFSVOLobjavg)/sqrt(length(STRFSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS Striatal Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS Striatal Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% BLARSFORCsoc = bspspaverageFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:);
% BLARSFORCobj = bspspaverageFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:);
% BLARSVOLsoc = bspspaverageVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:);
% BLARSVOLobj = bspspaverageVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:);
% 
% BLAFSFORCsoc = bspspaverageFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:);
% BLAFSFORCobj = bspspaverageFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:);
% BLAFSVOLsoc = bspspaverageVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:);
% BLAFSVOLobj = bspspaverageVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:);
% 
% BLARSFORCsocavg = bspaverageFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)));
% BLARSFORCobjavg = bspaverageFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% BLARSVOLsocavg = bspaverageVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)));
% BLARSVOLobjavg = bspaverageVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% 
% BLAFSFORCsocavg = bspaverageFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)));
% BLAFSFORCobjavg = bspaverageFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% BLAFSVOLsocavg = bspaverageVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)));
% BLAFSVOLobjavg = bspaverageVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% 
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSFORCsoc), nanstd(BLARSFORCsoc)/(sqrt(length(blaRSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSFORCobj), nanstd(BLARSFORCobj)/(sqrt(length(blaRSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSVOLsoc), nanstd(BLARSVOLsoc)/(sqrt(length(blaRSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSVOLobj), nanstd(BLARSVOLobj)/(sqrt(length(blaRSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSFORCsoc), nanstd(BLAFSFORCsoc)/(sqrt(length(blaFSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSFORCobj), nanstd(BLAFSFORCobj)/(sqrt(length(blaFSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSVOLsoc), nanstd(BLAFSVOLsoc)/(sqrt(length(blaFSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSVOLobj), nanstd(BLAFSVOLobj)/(sqrt(length(blaFSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(BLARSFORCsocavg),nanmean(BLARSFORCobjavg),nanmean(BLARSVOLsocavg),nanmean(BLARSVOLobjavg)]';
% errhigh = [nanstd(BLARSFORCsocavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSFORCobjavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSVOLsocavg)/sqrt(length(BLARSVOLsocavg)),nanstd(BLARSVOLobjavg)/sqrt(length(BLARSVOLobjavg))];
% errlow = [nanstd(BLARSFORCsocavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSFORCobjavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSVOLsocavg)/sqrt(length(BLARSVOLsocavg)),nanstd(BLARSVOLobjavg)/sqrt(length(BLARSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS BLA Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(BLAFSFORCsocavg),nanmean(BLAFSFORCobjavg),nanmean(BLAFSVOLsocavg),nanmean(BLAFSVOLobjavg)]';
% errhigh = [nanstd(BLAFSFORCsocavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSFORCobjavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSVOLsocavg)/sqrt(length(BLAFSVOLsocavg)),nanstd(BLAFSVOLobjavg)/sqrt(length(BLAFSVOLobjavg))];
% errlow = [nanstd(BLAFSFORCsocavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSFORCobjavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSVOLsocavg)/sqrt(length(BLAFSVOLsocavg)),nanstd(BLAFSVOLobjavg)/sqrt(length(BLAFSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS BLA Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS BLA Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% %% Save all excited cells to all properties and their corresponding firing rates
% % S1
% allFiringProperties.cellfiring.S1firing.S1RSFORCsocEXCZ = bspzaverageFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSFORCobjEXCZ = bspzaverageFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLsocEXCZ = bspzaverageVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLobjEXCZ = bspzaverageVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1FSFORCsocEXCZ = bspzaverageFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSFORCobjEXCZ = bspzaverageFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLsocEXCZ = bspzaverageVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLobjEXCZ = bspzaverageVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1RSFORCsocEXCHz = bspspaverageFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSFORCobjEXCHz = bspspaverageFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLsocEXCHz = bspspaverageVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLobjEXCHz = bspspaverageVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1FSFORCsocEXCHz = bspspaverageFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSFORCobjEXCHz = bspspaverageFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLsocEXCHz = bspspaverageVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLobjEXCHz = bspspaverageVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS S1 cells
% for j = 1:length(S1RSexccellsFORCMO)
%     S1RSexccellsFORCMOtrace{j} = alltrace{S1good(cellsS1RS(S1RSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(S1RSexccellsFORCOBJ)
%     S1RSexccellsFORCOBJtrace{j} = alltrace{S1good(cellsS1RS(S1RSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(S1RSexccellsVOLMO)
%     S1RSexccellsVOLMOtrace{j} = alltrace{S1good(cellsS1RS(S1RSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(S1RSexccellsVOLOBJ)
%     S1RSexccellsVOLOBJtrace{j} = alltrace{S1good(cellsS1RS(S1RSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS S1 cells
% for j = 1:length(S1FSexccellsFORCMO)
%     S1FSexccellsFORCMOtrace{j} = alltrace{S1good(cellsS1FS(S1FSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(S1FSexccellsFORCOBJ)
%     S1FSexccellsFORCOBJtrace{j} = alltrace{S1good(cellsS1FS(S1FSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(S1FSexccellsVOLMO)
%     S1FSexccellsVOLMOtrace{j} = alltrace{S1good(cellsS1FS(S1FSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(S1FSexccellsVOLOBJ)
%     S1FSexccellsVOLOBJtrace{j} = alltrace{S1good(cellsS1FS(S1FSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% allFiringProperties.celltrace.S1fulltrace.S1RSexccellsFORCMOtrace = S1RSexccellsFORCMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSexccellsFORCOBJtrace = S1RSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSexccellsVOLMOtrace = S1RSexccellsVOLMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSexccellsVOLOBJtrace = S1RSexccellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.S1fulltrace.S1FSexccellsFORCMOtrace = S1FSexccellsFORCMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSexccellsFORCOBJtrace = S1FSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSexccellsVOLMOtrace = S1FSexccellsVOLMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSexccellsVOLOBJtrace = S1FSexccellsVOLOBJtrace;
% 
% %%
% %
% %
% %
% %
% 
% 
% % Striatum
% 
% allFiringProperties.cellfiring.STRfiring.STRRSFORCsocEXCZ = bspzaverageFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSFORCobjEXCZ = bspzaverageFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLsocEXCZ = bspzaverageVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLobjEXCZ = bspzaverageVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRFSFORCsocEXCZ = bspzaverageFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSFORCobjEXCZ = bspzaverageFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLsocEXCZ = bspzaverageVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLobjEXCZ = bspzaverageVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRUCFORCsocEXCZ = bspzaverageFORCsoc(strgood(cellsSTRUC(strUCexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCFORCobjEXCZ = bspzaverageFORCobj(strgood(cellsSTRUC(strUCexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLsocEXCZ = bspzaverageVOLsoc(strgood(cellsSTRUC(strUCexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLobjEXCZ = bspzaverageVOLobj(strgood(cellsSTRUC(strUCexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRRSFORCsocEXCHz = bspspaverageFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSFORCobjEXCHz = bspspaverageFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLsocEXCHz = bspspaverageVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLobjEXCHz = bspspaverageVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRFSFORCsocEXCHz = bspspaverageFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSFORCobjEXCHz = bspspaverageFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLsocEXCHz = bspspaverageVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLobjEXCHz = bspspaverageVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRUCFORCsocEXCHz = bspspaverageFORCsoc(strgood(cellsSTRUC(strUCexccellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCFORCobjEXCHz = bspspaverageFORCobj(strgood(cellsSTRUC(strUCexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLsocEXCHz = bspspaverageVOLsoc(strgood(cellsSTRUC(strUCexccellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLobjEXCHz = bspspaverageVOLobj(strgood(cellsSTRUC(strUCexccellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS STR cells
% for j = 1:length(strRSexccellsFORCMO)
%     STRRSexccellsFORCMOtrace{j} = alltrace{strgood(cellsSTRRS(strRSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strRSexccellsFORCOBJ)
%     STRRSexccellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRRS(strRSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strRSexccellsVOLMO)
%     STRRSexccellsVOLMOtrace{j} = alltrace{strgood(cellsSTRRS(strRSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strRSexccellsVOLOBJ)
%     STRRSexccellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRRS(strRSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS STR cells
% for j = 1:length(strFSexccellsFORCMO)
%     STRFSexccellsFORCMOtrace{j} = alltrace{strgood(cellsSTRFS(strFSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strFSexccellsFORCOBJ)
%     STRFSexccellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRFS(strFSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strFSexccellsVOLMO)
%     STRFSexccellsVOLMOtrace{j} = alltrace{strgood(cellsSTRFS(strFSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strFSexccellsVOLOBJ)
%     STRFSexccellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRFS(strFSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% % Full trace for UC STR cells
% for j = 1:length(strUCexccellsFORCMO)
%     STRUCexccellsFORCMOtrace{j} = alltrace{strgood(cellsSTRUC(strUCexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strUCexccellsFORCOBJ)
%     STRUCexccellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRUC(strUCexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strUCexccellsVOLMO)
%     STRUCexccellsVOLMOtrace{j} = alltrace{strgood(cellsSTRUC(strUCexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strUCexccellsVOLOBJ)
%     STRUCexccellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRUC(strUCexccellsVOLOBJ(j)))}(1,:);
% end
% 
% allFiringProperties.celltrace.STRfulltrace.STRRSexccellsFORCMOtrace = STRRSexccellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSexccellsFORCOBJtrace = STRRSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSexccellsVOLMOtrace = STRRSexccellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSexccellsVOLOBJtrace = STRRSexccellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.STRfulltrace.STRFSexccellsFORCMOtrace = STRFSexccellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSexccellsFORCOBJtrace = STRFSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSexccellsVOLMOtrace = STRFSexccellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSexccellsVOLOBJtrace = STRFSexccellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.STRfulltrace.STRUCexccellsFORCMOtrace = STRUCexccellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCexccellsFORCOBJtrace = STRUCexccellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCexccellsVOLMOtrace = STRUCexccellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCexccellsVOLOBJtrace = STRUCexccellsVOLOBJtrace;
% 
% %
% %
% %
% %
% %
% 
% %%
% %BLA
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCsocEXCZ = bspzaverageFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCobjEXCZ = bspzaverageFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLsocEXCZ = bspzaverageVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLobjEXCZ = bspzaverageVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCsocEXCZ = bspzaverageFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCobjEXCZ = bspzaverageFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLsocEXCZ = bspzaverageVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLobjEXCZ = bspzaverageVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCsocEXCZ = bspzaverageFORCsoc(blagood(cellsBLAUC(blaUCexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCobjEXCZ = bspzaverageFORCobj(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLsocEXCZ = bspzaverageVOLsoc(blagood(cellsBLAUC(blaUCexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLobjEXCZ = bspzaverageVOLobj(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCsocEXCHz = bspspaverageFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCobjEXCHz = bspspaverageFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLsocEXCHz = bspspaverageVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLobjEXCHz = bspspaverageVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCsocEXCHz = bspspaverageFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCobjEXCHz = bspspaverageFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLsocEXCHz = bspspaverageVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLobjEXCHz = bspspaverageVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCsocEXCHz = bspspaverageFORCsoc(blagood(cellsBLAUC(blaUCexccellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCobjEXCHz = bspspaverageFORCobj(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLsocEXCHz = bspspaverageVOLsoc(blagood(cellsBLAUC(blaUCexccellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLobjEXCHz = bspspaverageVOLobj(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS BLA cells
% for j = 1:length(blaRSexccellsFORCMO)
%     BLARSexccellsFORCMOtrace{j} = alltrace{blagood(cellsBLARS(blaRSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaRSexccellsFORCOBJ)
%     BLARSexccellsFORCOBJtrace{j} = alltrace{blagood(cellsBLARS(blaRSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaRSexccellsVOLMO)
%     BLARSexccellsVOLMOtrace{j} = alltrace{blagood(cellsBLARS(blaRSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaRSexccellsVOLOBJ)
%     BLARSexccellsVOLOBJtrace{j} = alltrace{blagood(cellsBLARS(blaRSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS BLA cells
% for j = 1:length(blaFSexccellsFORCMO)
%     BLAFSexccellsFORCMOtrace{j} = alltrace{blagood(cellsBLAFS(blaFSexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaFSexccellsFORCOBJ)
%     BLAFSexccellsFORCOBJtrace{j} = alltrace{blagood(cellsBLAFS(blaFSexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaFSexccellsVOLMO)
%     BLAFSexccellsVOLMOtrace{j} = alltrace{blagood(cellsBLAFS(blaFSexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaFSexccellsVOLOBJ)
%     BLAFSexccellsVOLOBJtrace{j} = alltrace{blagood(cellsBLAFS(blaFSexccellsVOLOBJ(j)))}(1,:);
% end
% 
% % Full trace for UC BLA cells
% for j = 1:length(blaUCexccellsFORCMO)
%     BLAUCexccellsFORCMOtrace{j} = alltrace{blagood(cellsBLAUC(blaUCexccellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaUCexccellsFORCOBJ)
%     BLAUCexccellsFORCOBJtrace{j} = alltrace{blagood(cellsBLAUC(blaUCexccellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaUCexccellsVOLMO)
%     BLAUCexccellsVOLMOtrace{j} = alltrace{blagood(cellsBLAUC(blaUCexccellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaUCexccellsVOLOBJ)
%     BLAUCexccellsVOLOBJtrace{j} = alltrace{blagood(cellsBLAUC(blaUCexccellsVOLOBJ(j)))}(1,:);
% end
% 
% allFiringProperties.celltrace.BLAfulltrace.BLARSexccellsFORCMOtrace = BLARSexccellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSexccellsFORCOBJtrace = BLARSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSexccellsVOLMOtrace = BLARSexccellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSexccellsVOLOBJtrace = BLARSexccellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.BLAfulltrace.BLAFSexccellsFORCMOtrace = BLAFSexccellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSexccellsFORCOBJtrace = BLAFSexccellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSexccellsVOLMOtrace = BLAFSexccellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSexccellsVOLOBJtrace = BLAFSexccellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.BLAfulltrace.BLAUCexccellsFORCMOtrace = BLAUCexccellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCexccellsFORCOBJtrace = BLAUCexccellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCexccellsVOLMOtrace = BLAUCexccellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCexccellsVOLOBJtrace = BLAUCexccellsVOLOBJtrace;
% 
% 
% %% SUPPRESSED
% 
% clear S1RSFORCsoc
% clear S1RSFORCobj
% clear S1RSVOLsoc
% clear S1RSVOLobj
% clear S1FSFORCsoc
% clear S1FSFORCobj
% clear S1FSVOLsoc
% clear S1FSVOLobj
% 
% S1RSFORCsoc = bspspaverageFORCsoc(S1good(cellsS1RS(S1RSsupcellsFORCMO)),:);
% S1RSFORCobj = bspspaverageFORCobj(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)),:);
% S1RSVOLsoc = bspspaverageVOLsoc(S1good(cellsS1RS(S1RSsupcellsVOLMO)),:);
% S1RSVOLobj = bspspaverageVOLobj(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)),:);
% 
% S1FSFORCsoc = bspspaverageFORCsoc(S1good(cellsS1FS(S1FSsupcellsFORCMO)),:);
% S1FSFORCobj = bspspaverageFORCobj(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)),:);
% S1FSVOLsoc = bspspaverageVOLsoc(S1good(cellsS1FS(S1FSsupcellsVOLMO)),:);
% S1FSVOLobj = bspspaverageVOLobj(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)),:);
% 
% S1RSFORCsocavg = bspaverageFORCsoc(S1good(cellsS1RS(S1RSsupcellsFORCMO)));
% S1RSFORCobjavg = bspaverageFORCobj(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)));
% S1RSVOLsocavg = bspaverageVOLsoc(S1good(cellsS1RS(S1RSsupcellsVOLMO)));
% S1RSVOLobjavg = bspaverageVOLobj(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)));
% 
% S1FSFORCsocavg = bspaverageFORCsoc(S1good(cellsS1FS(S1FSsupcellsFORCMO)));
% S1FSFORCobjavg = bspaverageFORCobj(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)));
% S1FSVOLsocavg = bspaverageVOLsoc(S1good(cellsS1FS(S1FSsupcellsVOLMO)));
% S1FSVOLobjavg = bspaverageVOLobj(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)));
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCsoc), nanstd(S1RSFORCsoc)/(sqrt(length(S1RSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells")
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCobj), nanstd(S1RSFORCobj)/(sqrt(length(S1RSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLsoc), nanstd(S1RSVOLsoc)/(sqrt(length(S1RSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLobj), nanstd(S1RSVOLobj)/(sqrt(length(S1RSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");  legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCsoc), nanstd(S1FSFORCsoc)/(sqrt(length(S1FSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCobj), nanstd(S1FSFORCobj)/(sqrt(length(S1FSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLsoc), nanstd(S1FSVOLsoc)/(sqrt(length(S1FSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLobj), nanstd(S1FSVOLobj)/(sqrt(length(S1FSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(S1RSFORCsocavg),nanmean(S1RSFORCobjavg),nanmean(S1RSVOLsocavg),nanmean(S1RSVOLobjavg)]';
% errhigh = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% errlow = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS S1 Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(S1FSFORCsocavg),nanmean(S1FSFORCobjavg),nanmean(S1FSVOLsocavg),nanmean(S1FSVOLobjavg)]';
% errhigh = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% errlow = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS S1 Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS S1 Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% clear STRRSFORCsoc
% clear STRRSFORCobj
% clear STRRSVOLsoc
% clear STRRSVOLobj
% clear STRFSFORCsoc
% clear STRFSFORCobj
% clear STRFSVOLsoc
% clear STRFSVOLobj
% 
% STRRSFORCsoc = bspspaverageFORCsoc(strgood(cellsSTRRS(strRSsupcellsFORCMO)),:);
% STRRSFORCobj = bspspaverageFORCobj(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)),:);
% STRRSVOLsoc = bspspaverageVOLsoc(strgood(cellsSTRRS(strRSsupcellsVOLMO)),:);
% STRRSVOLobj = bspspaverageVOLobj(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)),:);
% 
% STRFSFORCsoc = bspspaverageFORCsoc(strgood(cellsSTRFS(strFSsupcellsFORCMO)),:);
% STRFSFORCobj = bspspaverageFORCobj(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)),:);
% STRFSVOLsoc = bspspaverageVOLsoc(strgood(cellsSTRFS(strFSsupcellsVOLMO)),:);
% STRFSVOLobj = bspspaverageVOLobj(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)),:);
% 
% STRRSFORCsocavg = bspaverageFORCsoc(strgood(cellsSTRRS(strRSsupcellsFORCMO)));
% STRRSFORCobjavg = bspaverageFORCobj(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)));
% STRRSVOLsocavg = bspaverageVOLsoc(strgood(cellsSTRRS(strRSsupcellsVOLMO)));
% STRRSVOLobjavg = bspaverageVOLobj(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)));
% 
% STRFSFORCsocavg = bspaverageFORCsoc(strgood(cellsSTRFS(strFSsupcellsFORCMO)));
% STRFSFORCobjavg = bspaverageFORCobj(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)));
% STRFSVOLsocavg = bspaverageVOLsoc(strgood(cellsSTRFS(strFSsupcellsVOLMO)));
% STRFSVOLobjavg = bspaverageVOLobj(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)));
% 
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSFORCsoc), nanstd(STRRSFORCsoc)/(sqrt(length(strRSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSFORCobj), nanstd(STRRSFORCobj)/(sqrt(length(strRSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSVOLsoc), nanstd(STRRSVOLsoc)/(sqrt(length(strRSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(STRRSVOLobj), nanstd(STRRSVOLobj)/(sqrt(length(strRSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSFORCsoc), nanstd(STRFSFORCsoc)/(sqrt(length(strFSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSFORCobj), nanstd(STRFSFORCobj)/(sqrt(length(strFSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSVOLsoc), nanstd(STRFSVOLsoc)/(sqrt(length(strFSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(STRFSVOLobj), nanstd(STRFSVOLobj)/(sqrt(length(strFSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(STRRSFORCsocavg),nanmean(STRRSFORCobjavg),nanmean(STRRSVOLsocavg),nanmean(STRRSVOLobjavg)]';
% errhigh = [nanstd(STRRSFORCsocavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSFORCobjavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSVOLsocavg)/sqrt(length(STRRSVOLsocavg)),nanstd(STRRSVOLobjavg)/sqrt(length(STRRSVOLobjavg))];
% errlow = [nanstd(STRRSFORCsocavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSFORCobjavg)/sqrt(length(STRRSFORCobjavg)),nanstd(STRRSVOLsocavg)/sqrt(length(STRRSVOLsocavg)),nanstd(STRRSVOLobjavg)/sqrt(length(STRRSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS Striatal Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(STRFSFORCsocavg),nanmean(STRFSFORCobjavg),nanmean(STRFSVOLsocavg),nanmean(STRFSVOLobjavg)]';
% errhigh = [nanstd(STRFSFORCsocavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSFORCobjavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSVOLsocavg)/sqrt(length(STRFSVOLsocavg)),nanstd(STRFSVOLobjavg)/sqrt(length(STRFSVOLobjavg))];
% errlow = [nanstd(STRFSFORCsocavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSFORCobjavg)/sqrt(length(STRFSFORCobjavg)),nanstd(STRFSVOLsocavg)/sqrt(length(STRFSVOLsocavg)),nanstd(STRFSVOLobjavg)/sqrt(length(STRFSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS Striatal Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS Striatal Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% BLARSFORCsoc = bspspaverageFORCsoc(blagood(cellsBLARS(blaRSsupcellsFORCMO)),:);
% BLARSFORCobj = bspspaverageFORCobj(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)),:);
% BLARSVOLsoc = bspspaverageVOLsoc(blagood(cellsBLARS(blaRSsupcellsVOLMO)),:);
% BLARSVOLobj = bspspaverageVOLobj(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)),:);
% 
% BLAFSFORCsoc = bspspaverageFORCsoc(blagood(cellsBLAFS(blaFSsupcellsFORCMO)),:);
% BLAFSFORCobj = bspspaverageFORCobj(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)),:);
% BLAFSVOLsoc = bspspaverageVOLsoc(blagood(cellsBLAFS(blaFSsupcellsVOLMO)),:);
% BLAFSVOLobj = bspspaverageVOLobj(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)),:);
% 
% BLARSFORCsocavg = bspaverageFORCsoc(blagood(cellsBLARS(blaRSsupcellsFORCMO)));
% BLARSFORCobjavg = bspaverageFORCobj(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)));
% BLARSVOLsocavg = bspaverageVOLsoc(blagood(cellsBLARS(blaRSsupcellsVOLMO)));
% BLARSVOLobjavg = bspaverageVOLobj(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)));
% 
% BLAFSFORCsocavg = bspaverageFORCsoc(blagood(cellsBLAFS(blaFSsupcellsFORCMO)));
% BLAFSFORCobjavg = bspaverageFORCobj(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)));
% BLAFSVOLsocavg = bspaverageVOLsoc(blagood(cellsBLAFS(blaFSsupcellsVOLMO)));
% BLAFSVOLobjavg = bspaverageVOLobj(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)));
% 
% 
% f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSFORCsoc), nanstd(BLARSFORCsoc)/(sqrt(length(blaRSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSFORCobj), nanstd(BLARSFORCobj)/(sqrt(length(blaRSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSVOLsoc), nanstd(BLARSVOLsoc)/(sqrt(length(blaRSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(BLARSVOLobj), nanstd(BLARSVOLobj)/(sqrt(length(blaRSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSFORCsoc), nanstd(BLAFSFORCsoc)/(sqrt(length(blaFSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSFORCobj), nanstd(BLAFSFORCobj)/(sqrt(length(blaFSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSVOLsoc), nanstd(BLAFSVOLsoc)/(sqrt(length(blaFSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(BLAFSVOLobj), nanstd(BLAFSVOLobj)/(sqrt(length(blaFSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% subplot(3,2,5); 
% hold on; 
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(BLARSFORCsocavg),nanmean(BLARSFORCobjavg),nanmean(BLARSVOLsocavg),nanmean(BLARSVOLobjavg)]';
% errhigh = [nanstd(BLARSFORCsocavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSFORCobjavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSVOLsocavg)/sqrt(length(BLARSVOLsocavg)),nanstd(BLARSVOLobjavg)/sqrt(length(BLARSVOLobjavg))];
% errlow = [nanstd(BLARSFORCsocavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSFORCobjavg)/sqrt(length(BLARSFORCobjavg)),nanstd(BLARSVOLsocavg)/sqrt(length(BLARSVOLsocavg)),nanstd(BLARSVOLobjavg)/sqrt(length(BLARSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of RS BLA Excited Cells for Each Type of Touch")
% subplot(3,2,6); hold on;
% x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% data = [nanmean(BLAFSFORCsocavg),nanmean(BLAFSFORCobjavg),nanmean(BLAFSVOLsocavg),nanmean(BLAFSVOLobjavg)]';
% errhigh = [nanstd(BLAFSFORCsocavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSFORCobjavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSVOLsocavg)/sqrt(length(BLAFSVOLsocavg)),nanstd(BLAFSVOLobjavg)/sqrt(length(BLAFSVOLobjavg))];
% errlow = [nanstd(BLAFSFORCsocavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSFORCobjavg)/sqrt(length(BLAFSFORCobjavg)),nanstd(BLAFSVOLsocavg)/sqrt(length(BLAFSVOLsocavg)),nanstd(BLAFSVOLobjavg)/sqrt(length(BLAFSVOLobjavg))];
% er = errorbar(x,data,errlow,errhigh);    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% xlabel("Type of Touch");
% ylabel("Average Spikes/s")
% title("Average Firing Rate of FS BLA Excited Cells for Each Type of Touch")
% sgtitle("Mean of all RS and FS BLA Excited cells");
% exportgraphics(f, nameofexpt, "Append", true);
% 
% 
% %% Save all suppressed cells to all properties and their corresponding firing ratesexc
% % S1
% allFiringProperties.cellfiring.S1firing.S1RSFORCsocSUPZ = bspzaverageFORCsoc(S1good(cellsS1RS(S1RSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSFORCobjSUPZ = bspzaverageFORCobj(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLsocSUPZ = bspzaverageVOLsoc(S1good(cellsS1RS(S1RSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLobjSUPZ = bspzaverageVOLobj(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1FSFORCsocSUPZ = bspzaverageFORCsoc(S1good(cellsS1FS(S1FSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSFORCobjSUPZ = bspzaverageFORCobj(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLsocSUPZ = bspzaverageVOLsoc(S1good(cellsS1FS(S1FSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLobjSUPZ = bspzaverageVOLobj(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1RSFORCsocSUPHz = bspspaverageFORCsoc(S1good(cellsS1RS(S1RSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSFORCobjSUPHz = bspspaverageFORCobj(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLsocSUPHz = bspspaverageVOLsoc(S1good(cellsS1RS(S1RSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1RSVOLobjSUPHz = bspspaverageVOLobj(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.S1firing.S1FSFORCsocSUPHz = bspspaverageFORCsoc(S1good(cellsS1FS(S1FSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSFORCobjSUPHz = bspspaverageFORCobj(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLsocSUPHz = bspspaverageVOLsoc(S1good(cellsS1FS(S1FSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.S1firing.S1FSVOLobjSUPHz = bspspaverageVOLobj(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS S1 cells
% for j = 1:length(S1RSsupcellsFORCMO)
%     S1RSsupcellsFORCMOtrace{j} = alltrace{S1good(cellsS1RS(S1RSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(S1RSsupcellsFORCOBJ)
%     S1RSsupcellsFORCOBJtrace{j} = alltrace{S1good(cellsS1RS(S1RSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(S1RSsupcellsVOLMO)
%     S1RSsupcellsVOLMOtrace{j} = alltrace{S1good(cellsS1RS(S1RSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(S1RSsupcellsVOLOBJ)
%     S1RSsupcellsVOLOBJtrace{j} = alltrace{S1good(cellsS1RS(S1RSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS S1 cells
% for j = 1:length(S1FSsupcellsFORCMO)
%     S1FSsupcellsFORCMOtrace{j} = alltrace{S1good(cellsS1FS(S1FSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(S1FSsupcellsFORCOBJ)
%     S1FSsupcellsFORCOBJtrace{j} = alltrace{S1good(cellsS1FS(S1FSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(S1FSsupcellsVOLMO)
%     S1FSsupcellsVOLMOtrace{j} = alltrace{S1good(cellsS1FS(S1FSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(S1FSsupcellsVOLOBJ)
%     S1FSsupcellsVOLOBJtrace{j} = alltrace{S1good(cellsS1FS(S1FSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% %%
% allFiringProperties.celltrace.S1fulltrace.S1RSsupcellsFORCMOtrace = S1RSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSsupcellsFORCOBJtrace = S1RSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSsupcellsVOLMOtrace = S1RSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1RSsupcellsVOLOBJtrace = S1RSsupcellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.S1fulltrace.S1FSsupcellsFORCMOtrace = S1FSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSsupcellsFORCOBJtrace = S1FSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSsupcellsVOLMOtrace = S1FSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.S1fulltrace.S1FSsupcellsVOLOBJtrace = S1FSsupcellsVOLOBJtrace;
% %%
% 
% %
% %
% %
% %
% 
% 
% % Striatum
% 
% allFiringProperties.cellfiring.STRfiring.STRRSFORCsocSUPZ = bspzaverageFORCsoc(strgood(cellsSTRRS(strRSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSFORCobjSUPZ = bspzaverageFORCobj(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLsocSUPZ = bspzaverageVOLsoc(strgood(cellsSTRRS(strRSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLobjSUPZ = bspzaverageVOLobj(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRFSFORCsocSUPZ = bspzaverageFORCsoc(strgood(cellsSTRFS(strFSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSFORCobjSUPZ = bspzaverageFORCobj(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLsocSUPZ = bspzaverageVOLsoc(strgood(cellsSTRFS(strFSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLobjSUPZ = bspzaverageVOLobj(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRUCFORCsocSUPZ = bspzaverageFORCsoc(strgood(cellsSTRUC(strUCsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCFORCobjSUPZ = bspzaverageFORCobj(strgood(cellsSTRUC(strUCsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLsocSUPZ = bspzaverageVOLsoc(strgood(cellsSTRUC(strUCsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLobjSUPZ = bspzaverageVOLobj(strgood(cellsSTRUC(strUCsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRRSFORCsocSUPHz = bspspaverageFORCsoc(strgood(cellsSTRRS(strRSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSFORCobjSUPHz = bspspaverageFORCobj(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLsocSUPHz = bspspaverageVOLsoc(strgood(cellsSTRRS(strRSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRRSVOLobjSUPHz = bspspaverageVOLobj(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRFSFORCsocSUPHz = bspspaverageFORCsoc(strgood(cellsSTRFS(strFSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSFORCobjSUPHz = bspspaverageFORCobj(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLsocSUPHz = bspspaverageVOLsoc(strgood(cellsSTRFS(strFSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRFSVOLobjSUPHz = bspspaverageVOLobj(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.STRfiring.STRUCFORCsocSUPHz = bspspaverageFORCsoc(strgood(cellsSTRUC(strUCsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCFORCobjSUPHz = bspspaverageFORCobj(strgood(cellsSTRUC(strUCsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLsocSUPHz = bspspaverageVOLsoc(strgood(cellsSTRUC(strUCsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.STRfiring.STRUCVOLobjSUPHz = bspspaverageVOLobj(strgood(cellsSTRUC(strUCsupcellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS STR cells
% for j = 1:length(strRSsupcellsFORCMO)
%     STRRSsupcellsFORCMOtrace{j} = alltrace{strgood(cellsSTRRS(strRSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strRSsupcellsFORCOBJ)
%     STRRSsupcellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRRS(strRSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strRSsupcellsVOLMO)
%     STRRSsupcellsVOLMOtrace{j} = alltrace{strgood(cellsSTRRS(strRSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strRSsupcellsVOLOBJ)
%     STRRSsupcellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRRS(strRSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS STR cells
% for j = 1:length(strFSsupcellsFORCMO)
%     STRFSsupcellsFORCMOtrace{j} = alltrace{strgood(cellsSTRFS(strFSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strFSsupcellsFORCOBJ)
%     STRFSsupcellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRFS(strFSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strFSsupcellsVOLMO)
%     STRFSsupcellsVOLMOtrace{j} = alltrace{strgood(cellsSTRFS(strFSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strFSsupcellsVOLOBJ)
%     STRFSsupcellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRFS(strFSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% % Full trace for UC STR cells
% for j = 1:length(strUCsupcellsFORCMO)
%     STRUCsupcellsFORCMOtrace{j} = alltrace{strgood(cellsSTRUC(strUCsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(strUCsupcellsFORCOBJ)
%     STRUCsupcellsFORCOBJtrace{j} = alltrace{strgood(cellsSTRUC(strUCsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(strUCsupcellsVOLMO)
%     STRUCsupcellsVOLMOtrace{j} = alltrace{strgood(cellsSTRUC(strUCsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(strUCsupcellsVOLOBJ)
%     STRUCsupcellsVOLOBJtrace{j} = alltrace{strgood(cellsSTRUC(strUCsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% %%
% allFiringProperties.celltrace.STRfulltrace.STRRSsupcellsFORCMOtrace = STRRSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSsupcellsFORCOBJtrace = STRRSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSsupcellsVOLMOtrace = STRRSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRRSsupcellsVOLOBJtrace = STRRSsupcellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.STRfulltrace.STRFSsupcellsFORCMOtrace = STRFSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSsupcellsFORCOBJtrace = STRFSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSsupcellsVOLMOtrace = STRFSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRFSsupcellsVOLOBJtrace = STRFSsupcellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.STRfulltrace.STRUCsupcellsFORCMOtrace = STRUCsupcellsFORCMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCsupcellsFORCOBJtrace = STRUCsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCsupcellsVOLMOtrace = STRUCsupcellsVOLMOtrace;
% allFiringProperties.celltrace.STRfulltrace.STRUCsupcellsVOLOBJtrace = STRUCsupcellsVOLOBJtrace;
% 
% %%
% %
% %
% %
% %
% %
% 
% 
% %BLA
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCsocSUPZ = bspzaverageFORCsoc(blagood(cellsBLARS(blaRSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCobjSUPZ = bspzaverageFORCobj(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLsocSUPZ = bspzaverageVOLsoc(blagood(cellsBLARS(blaRSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLobjSUPZ = bspzaverageVOLobj(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCsocSUPZ = bspzaverageFORCsoc(blagood(cellsBLAFS(blaFSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCobjSUPZ = bspzaverageFORCobj(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLsocSUPZ = bspzaverageVOLsoc(blagood(cellsBLAFS(blaFSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLobjSUPZ = bspzaverageVOLobj(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCsocSUPZ = bspzaverageFORCsoc(blagood(cellsBLAUC(blaUCsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCobjSUPZ = bspzaverageFORCobj(blagood(cellsBLAUC(blaUCsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLsocSUPZ = bspzaverageVOLsoc(blagood(cellsBLAUC(blaUCsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLobjSUPZ = bspzaverageVOLobj(blagood(cellsBLAUC(blaUCsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCsocSUPHz = bspspaverageFORCsoc(blagood(cellsBLARS(blaRSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSFORCobjSUPHz = bspspaverageFORCobj(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLsocSUPHz = bspspaverageVOLsoc(blagood(cellsBLARS(blaRSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLARSVOLobjSUPHz = bspspaverageVOLobj(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCsocSUPHz = bspspaverageFORCsoc(blagood(cellsBLAFS(blaFSsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSFORCobjSUPHz = bspspaverageFORCobj(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLsocSUPHz = bspspaverageVOLsoc(blagood(cellsBLAFS(blaFSsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAFSVOLobjSUPHz = bspspaverageVOLobj(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCsocSUPHz = bspspaverageFORCsoc(blagood(cellsBLAUC(blaUCsupcellsFORCMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCFORCobjSUPHz = bspspaverageFORCobj(blagood(cellsBLAUC(blaUCsupcellsFORCOBJ)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLsocSUPHz = bspspaverageVOLsoc(blagood(cellsBLAUC(blaUCsupcellsVOLMO)),:);
% allFiringProperties.cellfiring.BLAfiring.BLAUCVOLobjSUPHz = bspspaverageVOLobj(blagood(cellsBLAUC(blaUCsupcellsVOLOBJ)),:);
% 
% %
% %
% 
% % Full trace for RS BLA cells
% for j = 1:length(blaRSsupcellsFORCMO)
%     BLARSsupcellsFORCMOtrace{j} = alltrace{blagood(cellsBLARS(blaRSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaRSsupcellsFORCOBJ)
%     BLARSsupcellsFORCOBJtrace{j} = alltrace{blagood(cellsBLARS(blaRSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaRSsupcellsVOLMO)
%     BLARSsupcellsVOLMOtrace{j} = alltrace{blagood(cellsBLARS(blaRSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaRSsupcellsVOLOBJ)
%     BLARSsupcellsVOLOBJtrace{j} = alltrace{blagood(cellsBLARS(blaRSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% 
% % Full trace for FS BLA cells
% for j = 1:length(blaFSsupcellsFORCMO)
%     BLAFSsupcellsFORCMOtrace{j} = alltrace{blagood(cellsBLAFS(blaFSsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaFSsupcellsFORCOBJ)
%     BLAFSsupcellsFORCOBJtrace{j} = alltrace{blagood(cellsBLAFS(blaFSsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaFSsupcellsVOLMO)
%     BLAFSsupcellsVOLMOtrace{j} = alltrace{blagood(cellsBLAFS(blaFSsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaFSsupcellsVOLOBJ)
%     BLAFSsupcellsVOLOBJtrace{j} = alltrace{blagood(cellsBLAFS(blaFSsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% % Full trace for UC BLA cells
% for j = 1:length(blaUCsupcellsFORCMO)
%     BLAUCsupcellsFORCMOtrace{j} = alltrace{blagood(cellsBLAUC(blaUCsupcellsFORCMO(j)))}(4,:);
% end
% 
% for j = 1:length(blaUCsupcellsFORCOBJ)
%     BLAUCsupcellsFORCOBJtrace{j} = alltrace{blagood(cellsBLAUC(blaUCsupcellsFORCOBJ(j)))}(3,:);
% end
% 
% for j = 1:length(blaUCsupcellsVOLMO)
%     BLAUCsupcellsVOLMOtrace{j} = alltrace{blagood(cellsBLAUC(blaUCsupcellsVOLMO(j)))}(2,:);
% end
% 
% for j = 1:length(blaUCsupcellsVOLOBJ)
%     BLAUCsupcellsVOLOBJtrace{j} = alltrace{blagood(cellsBLAUC(blaUCsupcellsVOLOBJ(j)))}(1,:);
% end
% 
% %%
% 
% allFiringProperties.celltrace.BLAfulltrace.BLARSsupcellsFORCMOtrace = BLARSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSsupcellsFORCOBJtrace = BLARSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSsupcellsVOLMOtrace = BLARSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLARSsupcellsVOLOBJtrace = BLARSsupcellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.BLAfulltrace.BLAFSsupcellsFORCMOtrace = BLAFSsupcellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSsupcellsFORCOBJtrace = BLAFSsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSsupcellsVOLMOtrace = BLAFSsupcellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAFSsupcellsVOLOBJtrace = BLAFSsupcellsVOLOBJtrace;
% 
% allFiringProperties.celltrace.BLAfulltrace.BLAUCsupcellsFORCMOtrace = BLAUCsupcellsFORCMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCsupcellsFORCOBJtrace = BLAUCsupcellsFORCOBJtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCsupcellsVOLMOtrace = BLAUCsupcellsVOLMOtrace;
% allFiringProperties.celltrace.BLAfulltrace.BLAUCsupcellsVOLOBJtrace = BLAUCsupcellsVOLOBJtrace;
% 
% 
% %% Save AUC values as well as Shuffled values for significant cells (which ones that are considered responsive) S1 ONLY
% 
% % FORC MO
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1allRSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1RS));
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1excRSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1RS(S1RSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1supRSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1RS(S1RSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1allFSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1FS));
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1excFSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1FS(S1FSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1supFSFORCsocAUC = AUCrespFORCMO(S1good(cellsS1FS(S1FSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1allRSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1RS),:);
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1excRSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1RS(S1RSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1supRSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1RS(S1RSsupcellsFORCMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1allFSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1FS),:);
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1excFSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1FS(S1FSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespS1FORCMO.S1supFSFORCsocAUCSH = AUCShFORCMO(S1good(cellsS1FS(S1FSsupcellsFORCMO)),:);
% 
% % FORC OBJ
% 
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1allRSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1RS));
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1excRSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1supRSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1allFSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1FS));
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1excFSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1supFSFORCobjAUC = AUCrespFORCOBJ(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1allRSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1RS),:);
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1excRSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1supRSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1RS(S1RSsupcellsFORCOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1allFSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1FS),:);
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1excFSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespS1FORCOBJ.S1supFSFORCobjAUCSH = AUCShFORCOBJ(S1good(cellsS1FS(S1FSsupcellsFORCOBJ)),:);
% 
% % VOL MO
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1allRSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1RS));
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1excRSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1RS(S1RSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1supRSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1RS(S1RSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1allFSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1FS));
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1excFSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1FS(S1FSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1supFSVOLsocAUC = AUCrespVOLMO(S1good(cellsS1FS(S1FSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1allRSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1RS),:);
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1excRSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1RS(S1RSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1supRSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1RS(S1RSsupcellsVOLMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1allFSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1FS),:);
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1excFSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1FS(S1FSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespS1VOLMO.S1supFSVOLsocAUCSH = AUCShVOLMO(S1good(cellsS1FS(S1FSsupcellsVOLMO)),:);
% 
% % VOL OBJ
% 
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1allRSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1RS));
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1excRSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1supRSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1allFSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1FS));
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1excFSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1supFSVOLobjAUC = AUCrespVOLOBJ(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1allRSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1RS),:);
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1excRSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1supRSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1RS(S1RSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1allFSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1FS),:);
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1excFSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespS1VOLOBJ.S1supFSVOLobjAUCSH = AUCShVOLOBJ(S1good(cellsS1FS(S1FSsupcellsVOLOBJ)),:);
% 
% %% Save AUC values as well as Shuffled values for significant cells (which ones that are considered responsive) STR ONLY
% 
% % FORC MO
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallRSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRRS));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcRSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRRS(strRSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupRSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRRS(strRSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallFSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRFS));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcFSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRFS(strFSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupFSFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRFS(strFSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallRSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRRS),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcRSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRRS(strRSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupRSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRRS(strRSsupcellsFORCMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallFSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRFS),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcFSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRFS(strFSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupFSFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRFS(strFSsupcellsFORCMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallUCFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRUC));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcUCFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRUC(strUCexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupUCFORCsocAUC = AUCrespFORCMO(strgood(cellsSTRUC(strUCsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRallUCFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRUC),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRexcUCFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRUC(strUCexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCMO.STRsupUCFORCsocAUCSH = AUCShFORCMO(strgood(cellsSTRUC(strUCsupcellsFORCMO)),:);
% 
% % FORC OBJ
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallRSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRRS));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcRSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupRSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallFSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRFS));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcFSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupFSFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallRSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRRS),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcRSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupRSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRRS(strRSsupcellsFORCOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallFSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRFS),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcFSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupFSFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRFS(strFSsupcellsFORCOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallUCFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRUC));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcUCFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRUC(strUCexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupUCFORCobjAUC = AUCrespFORCOBJ(strgood(cellsSTRUC(strUCsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRallUCFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRUC),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRexcUCFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRUC(strUCexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRFORCOBJ.STRsupUCFORCobjAUCSH = AUCShFORCOBJ(strgood(cellsSTRUC(strUCsupcellsFORCOBJ)),:);
% 
% % VOL MO
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallRSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRRS));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcRSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRRS(strRSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupRSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRRS(strRSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallFSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRFS));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcFSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRFS(strFSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupFSVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRFS(strFSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallRSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRRS),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcRSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRRS(strRSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupRSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRRS(strRSsupcellsVOLMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallFSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRFS),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcFSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRFS(strFSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupFSVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRFS(strFSsupcellsVOLMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallUCVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRUC));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcUCVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRUC(strUCexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupUCVOLsocAUC = AUCrespVOLMO(strgood(cellsSTRUC(strUCsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRallUCVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRUC),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRexcUCVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRUC(strUCexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLMO.STRsupUCVOLsocAUCSH = AUCShVOLMO(strgood(cellsSTRUC(strUCsupcellsVOLMO)),:);
% 
% % VOL OBJ
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallRSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRRS));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcRSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupRSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallFSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRFS));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcFSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupFSVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallRSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRRS),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcRSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupRSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRRS(strRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallFSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRFS),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcFSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupFSVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRFS(strFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallUCVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRUC));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcUCVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRUC(strUCexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupUCVOLobjAUC = AUCrespVOLOBJ(strgood(cellsSTRUC(strUCsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRallUCVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRUC),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRexcUCVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRUC(strUCexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespSTRVOLOBJ.STRsupUCVOLobjAUCSH = AUCShVOLOBJ(strgood(cellsSTRUC(strUCsupcellsVOLOBJ)),:);
% 
% %% Save AUC values as well as Shuffled values for significant cells (which ones that are considered responsive) BLA ONLY
% 
% % FORC MO
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallRSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLARS));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcRSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLARS(blaRSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupRSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLARS(blaRSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallFSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAFS));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcFSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAFS(blaFSexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupFSFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAFS(blaFSsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallRSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLARS),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcRSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLARS(blaRSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupRSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLARS(blaRSsupcellsFORCMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallFSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAFS),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcFSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupFSFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAFS(blaFSsupcellsFORCMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallUCFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAUC));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcUCFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAUC(blaUCexccellsFORCMO)));
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupUCFORCsocAUC = AUCrespFORCMO(blagood(cellsBLAUC(blaUCsupcellsFORCMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAallUCFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAUC),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAexcUCFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAUC(blaUCexccellsFORCMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCMO.BLAsupUCFORCsocAUCSH = AUCShFORCMO(blagood(cellsBLAUC(blaUCsupcellsFORCMO)),:);
% 
% % FORC OBJ
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallRSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLARS));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcRSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupRSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallFSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAFS));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcFSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupFSFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallRSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLARS),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcRSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupRSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLARS(blaRSsupcellsFORCOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallFSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAFS),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcFSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupFSFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAFS(blaFSsupcellsFORCOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallUCFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAUC));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcUCFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupUCFORCobjAUC = AUCrespFORCOBJ(blagood(cellsBLAUC(blaUCsupcellsFORCOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAallUCFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAUC),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAexcUCFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAFORCOBJ.BLAsupUCFORCobjAUCSH = AUCShFORCOBJ(blagood(cellsBLAUC(blaUCsupcellsFORCOBJ)),:);
% 
% % VOL MO
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallRSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLARS));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcRSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLARS(blaRSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupRSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLARS(blaRSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallFSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAFS));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcFSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAFS(blaFSexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupFSVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAFS(blaFSsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallRSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLARS),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcRSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLARS(blaRSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupRSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLARS(blaRSsupcellsVOLMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallFSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAFS),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcFSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupFSVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAFS(blaFSsupcellsVOLMO)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallUCVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAUC));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcUCVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAUC(blaUCexccellsVOLMO)));
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupUCVOLsocAUC = AUCrespVOLMO(blagood(cellsBLAUC(blaUCsupcellsVOLMO)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAallUCVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAUC),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAexcUCVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAUC(blaUCexccellsVOLMO)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLMO.BLAsupUCVOLsocAUCSH = AUCShVOLMO(blagood(cellsBLAUC(blaUCsupcellsVOLMO)),:);
% 
% % VOL OBJ
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallRSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLARS));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcRSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupRSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallFSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAFS));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcFSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupFSVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallRSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLARS),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcRSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupRSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLARS(blaRSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallFSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAFS),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcFSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupFSVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAFS(blaFSsupcellsVOLOBJ)),:);
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallUCVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAUC));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcUCVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)));
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupUCVOLobjAUC = AUCrespVOLOBJ(blagood(cellsBLAUC(blaUCsupcellsVOLOBJ)));
% 
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAallUCVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAUC),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAexcUCVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)),:);
% allFiringProperties.AUCresp.AUCrespBLAVOLOBJ.BLAsupUCVOLobjAUCSH = AUCShVOLOBJ(blagood(cellsBLAUC(blaUCsupcellsVOLOBJ)),:);
% 
% 
% %% CONCATENATE EXC & SUP Cells for FORC and VOL
% 
% %VOL ONLY
% 
% %S1
% S1RSexccellsVOL = union(S1RSexccellsVOLMO, S1RSexccellsVOLOBJ);
% S1RSsupcellsVOL = union(S1RSsupcellsVOLMO, S1RSsupcellsVOLOBJ);
% 
% S1FSexccellsVOL = union(S1FSexccellsVOLMO, S1FSexccellsVOLOBJ);
% S1FSsupcellsVOL = union(S1FSsupcellsVOLMO, S1FSsupcellsVOLOBJ);
% 
% %Striatum
% 
% strRSexccellsVOL = union(strRSexccellsVOLMO, strRSexccellsVOLOBJ);
% strRSsupcellsVOL = union(strRSsupcellsVOLMO, strRSsupcellsVOLOBJ);
% 
% strFSexccellsVOL = union(strFSexccellsVOLMO, strFSexccellsVOLOBJ);
% strFSsupcellsVOL = union(strFSsupcellsVOLMO, strFSsupcellsVOLOBJ);
% 
% strUCexccellsVOL = union(strUCexccellsVOLMO, strUCexccellsVOLOBJ);
% strUCsupcellsVOL = union(strUCsupcellsVOLMO, strUCsupcellsVOLOBJ);
% 
% %BLA
% blaRSexccellsVOL = union(blaRSexccellsVOLMO, blaRSexccellsVOLOBJ);
% blaRSsupcellsVOL = union(blaRSsupcellsVOLMO, blaRSsupcellsVOLOBJ);
% 
% blaFSexccellsVOL = union(blaFSexccellsVOLMO, blaFSexccellsVOLOBJ);
% blaFSsupcellsVOL = union(blaFSsupcellsVOLMO, blaFSsupcellsVOLOBJ);
% 
% blaUCexccellsVOL = union(blaUCexccellsVOLMO, blaUCexccellsVOLOBJ);
% blaUCsupcellsVOL = union(blaUCsupcellsVOLMO, blaUCsupcellsVOLOBJ);
% 
% %
% %
% %
% 
% %FORC ONLY
% %S1
% S1RSexccellsFORC = union(S1RSexccellsFORCMO, S1RSexccellsFORCOBJ);
% S1RSsupcellsFORC = union(S1RSsupcellsFORCMO, S1RSsupcellsFORCOBJ);
% 
% S1FSexccellsFORC = union(S1FSexccellsFORCMO, S1FSexccellsFORCOBJ);
% S1FSsupcellsFORC = union(S1FSsupcellsFORCMO, S1FSsupcellsFORCOBJ);
% 
% %Striatum
% 
% strRSexccellsFORC = union(strRSexccellsFORCMO, strRSexccellsFORCOBJ);
% strRSsupcellsFORC = union(strRSsupcellsFORCMO, strRSsupcellsFORCOBJ);
% 
% strFSexccellsFORC = union(strFSexccellsFORCMO, strFSexccellsFORCOBJ);
% strFSsupcellsFORC = union(strFSsupcellsFORCMO, strFSsupcellsFORCOBJ);
% 
% strUCexccellsFORC = union(strUCexccellsFORCMO, strUCexccellsFORCOBJ);
% strUCsupcellsFORC = union(strUCsupcellsFORCMO, strUCsupcellsFORCOBJ);
% 
% %BLA
% blaRSexccellsFORC = union(blaRSexccellsFORCMO, blaRSexccellsFORCOBJ);
% blaRSsupcellsFORC = union(blaRSsupcellsFORCMO, blaRSsupcellsFORCOBJ);
% 
% blaFSexccellsFORC = union(blaFSexccellsFORCMO, blaFSexccellsFORCOBJ);
% blaFSsupcellsFORC = union(blaFSsupcellsFORCMO, blaFSsupcellsFORCOBJ);
% 
% blaUCexccellsFORC = union(blaUCexccellsFORCMO, blaUCexccellsFORCOBJ);
% blaUCsupcellsFORC = union(blaUCsupcellsFORCMO, blaUCsupcellsFORCOBJ);
% 
% 
% %% AUC VOL PREF 
% 
% %
% %
% %
% %
% 
% % S1
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1allRS = AUCVolObjvsSoc(S1good(cellsS1RS));
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1excRS = AUCVolObjvsSoc(S1good(cellsS1RS(S1RSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1supRS = AUCVolObjvsSoc(S1good(cellsS1RS(S1RSsupcellsVOL)));
% 
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1allFS = AUCVolObjvsSoc(S1good(cellsS1FS));
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1excFS = AUCVolObjvsSoc(S1good(cellsS1FS(S1FSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCS1VOLPREF.AUCVOLS1supFS = AUCVolObjvsSoc(S1good(cellsS1FS(S1FSsupcellsVOL)));
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRallRS = AUCVolObjvsSoc(strgood(cellsSTRRS));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRexcRS = AUCVolObjvsSoc(strgood(cellsSTRRS(strRSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRsupRS = AUCVolObjvsSoc(strgood(cellsSTRRS(strRSsupcellsVOL)));
% 
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRallFS = AUCVolObjvsSoc(strgood(cellsSTRFS));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRexcFS = AUCVolObjvsSoc(strgood(cellsSTRFS(strFSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRsupFS = AUCVolObjvsSoc(strgood(cellsSTRFS(strFSsupcellsVOL)));
% 
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRallUC = AUCVolObjvsSoc(strgood(cellsSTRUC));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRexcUC = AUCVolObjvsSoc(strgood(cellsSTRUC(strUCexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCSTRVOLPREF.AUCVOLSTRsupUC = AUCVolObjvsSoc(strgood(cellsSTRUC(strUCsupcellsVOL)));
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAallRS = AUCVolObjvsSoc(blagood(cellsBLARS));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAexcRS = AUCVolObjvsSoc(blagood(cellsBLARS(blaRSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAsupRS = AUCVolObjvsSoc(blagood(cellsBLARS(blaRSsupcellsVOL)));
% 
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAallFS = AUCVolObjvsSoc(blagood(cellsBLAFS));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAexcFS = AUCVolObjvsSoc(blagood(cellsBLAFS(blaFSexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAsupFS = AUCVolObjvsSoc(blagood(cellsBLAFS(blaFSsupcellsVOL)));
% 
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAallUC = AUCVolObjvsSoc(blagood(cellsBLAUC));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAexcUC = AUCVolObjvsSoc(blagood(cellsBLAUC(blaUCexccellsVOL)));
% allFiringProperties.AUCVOLPREF.AUCBLAVOLPREF.AUCVOLBLAsupUC = AUCVolObjvsSoc(blagood(cellsBLAUC(blaUCsupcellsVOL)));
% 
% %% AUC FORC PREF 
% 
% %
% %
% %
% %
% 
% % S1
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1allRS = AUCForcObjvsSoc(S1good(cellsS1RS));
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1excRS = AUCForcObjvsSoc(S1good(cellsS1RS(S1RSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1supRS = AUCForcObjvsSoc(S1good(cellsS1RS(S1RSsupcellsFORC)));
% 
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1allFS = AUCForcObjvsSoc(S1good(cellsS1FS));
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1excFS = AUCForcObjvsSoc(S1good(cellsS1FS(S1FSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCS1FORCPREF.AUCFORCS1supFS = AUCForcObjvsSoc(S1good(cellsS1FS(S1FSsupcellsFORC)));
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRallRS = AUCForcObjvsSoc(strgood(cellsSTRRS));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRexcRS = AUCForcObjvsSoc(strgood(cellsSTRRS(strRSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRsupRS = AUCForcObjvsSoc(strgood(cellsSTRRS(strRSsupcellsFORC)));
% 
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRallFS = AUCForcObjvsSoc(strgood(cellsSTRFS));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRexcFS = AUCForcObjvsSoc(strgood(cellsSTRFS(strFSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRsupFS = AUCForcObjvsSoc(strgood(cellsSTRFS(strFSsupcellsFORC)));
% 
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRallUC = AUCForcObjvsSoc(strgood(cellsSTRUC));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRexcUC = AUCForcObjvsSoc(strgood(cellsSTRUC(strUCexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCSTRFORCPREF.AUCFORCSTRsupUC = AUCForcObjvsSoc(strgood(cellsSTRUC(strUCsupcellsFORC)));
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAallRS = AUCForcObjvsSoc(blagood(cellsBLARS));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAexcRS = AUCForcObjvsSoc(blagood(cellsBLARS(blaRSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAsupRS = AUCForcObjvsSoc(blagood(cellsBLARS(blaRSsupcellsFORC)));
% 
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAallFS = AUCForcObjvsSoc(blagood(cellsBLAFS));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAexcFS = AUCForcObjvsSoc(blagood(cellsBLAFS(blaFSexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAsupFS = AUCForcObjvsSoc(blagood(cellsBLAFS(blaFSsupcellsFORC)));
% 
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAallUC = AUCForcObjvsSoc(blagood(cellsBLAUC));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAexcUC = AUCForcObjvsSoc(blagood(cellsBLAUC(blaUCexccellsFORC)));
% allFiringProperties.AUCFORCPREF.AUCBLAFORCPREF.AUCFORCBLAsupUC = AUCForcObjvsSoc(blagood(cellsBLAUC(blaUCsupcellsFORC)));
% 
% %% Get AUCallVOL AcrossTime
% % S1
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1allRS = AUCallVOL(S1good(cellsS1RS),:);
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1excRS = AUCallVOL(S1good(cellsS1RS(S1RSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1supRS = AUCallVOL(S1good(cellsS1RS(S1RSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1allFS = AUCallVOL(S1good(cellsS1FS),:);
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1excFS = AUCallVOL(S1good(cellsS1FS(S1FSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCS1VOLBINS.AUCVOLS1supFS = AUCallVOL(S1good(cellsS1FS(S1FSsupcellsVOL)),:);
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRallRS = AUCallVOL(strgood(cellsSTRRS),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRexcRS = AUCallVOL(strgood(cellsSTRRS(strRSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRsupRS = AUCallVOL(strgood(cellsSTRRS(strRSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRallFS = AUCallVOL(strgood(cellsSTRFS),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRexcFS = AUCallVOL(strgood(cellsSTRFS(strFSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRsupFS = AUCallVOL(strgood(cellsSTRFS(strFSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRallUC = AUCallVOL(strgood(cellsSTRUC),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRexcUC = AUCallVOL(strgood(cellsSTRUC(strUCexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCSTRVOLBINS.AUCVOLSTRsupUC = AUCallVOL(strgood(cellsSTRUC(strUCsupcellsVOL)),:);
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAallRS = AUCallVOL(blagood(cellsBLARS),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAexcRS = AUCallVOL(blagood(cellsBLARS(blaRSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAsupRS = AUCallVOL(blagood(cellsBLARS(blaRSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAallFS = AUCallVOL(blagood(cellsBLAFS),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAexcFS = AUCallVOL(blagood(cellsBLAFS(blaFSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAsupFS = AUCallVOL(blagood(cellsBLAFS(blaFSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAallUC = AUCallVOL(blagood(cellsBLAUC),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAexcUC = AUCallVOL(blagood(cellsBLAUC(blaUCexccellsVOL)),:);
% allFiringProperties.AUCVOLBINS.AUCBLAVOLBINS.AUCVOLBLAsupUC = AUCallVOL(blagood(cellsBLAUC(blaUCsupcellsVOL)),:);
% 
% %% Get AUCallFORC AcrossTime
% 
% 
% % S1
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1allRS = AUCallFORC(S1good(cellsS1RS),:);
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1excRS = AUCallFORC(S1good(cellsS1RS(S1RSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1supRS = AUCallFORC(S1good(cellsS1RS(S1RSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1allFS = AUCallFORC(S1good(cellsS1FS),:);
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1excFS = AUCallFORC(S1good(cellsS1FS(S1FSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCS1FORCBINS.AUCFORCS1supFS = AUCallFORC(S1good(cellsS1FS(S1FSsupcellsFORC)),:);
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRallRS = AUCallFORC(strgood(cellsSTRRS),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRexcRS = AUCallFORC(strgood(cellsSTRRS(strRSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRsupRS = AUCallFORC(strgood(cellsSTRRS(strRSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRallFS = AUCallFORC(strgood(cellsSTRFS),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRexcFS = AUCallFORC(strgood(cellsSTRFS(strFSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRsupFS = AUCallFORC(strgood(cellsSTRFS(strFSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRallUC = AUCallFORC(strgood(cellsSTRUC),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRexcUC = AUCallFORC(strgood(cellsSTRUC(strUCexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCSTRFORCBINS.AUCFORCSTRsupUC = AUCallFORC(strgood(cellsSTRUC(strUCsupcellsFORC)),:);
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAallRS = AUCallFORC(blagood(cellsBLARS),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAexcRS = AUCallFORC(blagood(cellsBLARS(blaRSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAsupRS = AUCallFORC(blagood(cellsBLARS(blaRSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAallFS = AUCallFORC(blagood(cellsBLAFS),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAexcFS = AUCallFORC(blagood(cellsBLAFS(blaFSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAsupFS = AUCallFORC(blagood(cellsBLAFS(blaFSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAallUC = AUCallFORC(blagood(cellsBLAUC),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAexcUC = AUCallFORC(blagood(cellsBLAUC(blaUCexccellsFORC)),:);
% allFiringProperties.AUCFORCBINS.AUCBLAFORCBINS.AUCFORCBLAsupUC = AUCallFORC(blagood(cellsBLAUC(blaUCsupcellsFORC)),:);
% 
% 
% %%
% %%%%
% %%%%
% %%%%
% %% 
% 
% %% Get AUCallVOLalt AcrossTime
% % S1
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1allRS = AUCallVOLalt(S1good(cellsS1RS),:);
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1excRS = AUCallVOLalt(S1good(cellsS1RS(S1RSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1supRS = AUCallVOLalt(S1good(cellsS1RS(S1RSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1allFS = AUCallVOLalt(S1good(cellsS1FS),:);
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1excFS = AUCallVOLalt(S1good(cellsS1FS(S1FSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCS1VOLBINS.AUCVOLS1supFS = AUCallVOLalt(S1good(cellsS1FS(S1FSsupcellsVOL)),:);
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRallRS = AUCallVOLalt(strgood(cellsSTRRS),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRexcRS = AUCallVOLalt(strgood(cellsSTRRS(strRSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRsupRS = AUCallVOLalt(strgood(cellsSTRRS(strRSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRallFS = AUCallVOLalt(strgood(cellsSTRFS),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRexcFS = AUCallVOLalt(strgood(cellsSTRFS(strFSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRsupFS = AUCallVOLalt(strgood(cellsSTRFS(strFSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRallUC = AUCallVOLalt(strgood(cellsSTRUC),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRexcUC = AUCallVOLalt(strgood(cellsSTRUC(strUCexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCSTRVOLBINS.AUCVOLSTRsupUC = AUCallVOLalt(strgood(cellsSTRUC(strUCsupcellsVOL)),:);
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAallRS = AUCallVOLalt(blagood(cellsBLARS),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAexcRS = AUCallVOLalt(blagood(cellsBLARS(blaRSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAsupRS = AUCallVOLalt(blagood(cellsBLARS(blaRSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAallFS = AUCallVOLalt(blagood(cellsBLAFS),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAexcFS = AUCallVOLalt(blagood(cellsBLAFS(blaFSexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAsupFS = AUCallVOLalt(blagood(cellsBLAFS(blaFSsupcellsVOL)),:);
% 
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAallUC = AUCallVOLalt(blagood(cellsBLAUC),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAexcUC = AUCallVOLalt(blagood(cellsBLAUC(blaUCexccellsVOL)),:);
% allFiringProperties.AUCVOLBINSALT.AUCBLAVOLBINS.AUCVOLBLAsupUC = AUCallVOLalt(blagood(cellsBLAUC(blaUCsupcellsVOL)),:);
% 
% %% Get AUCallFORCalt AcrossTime
% 
% 
% % S1
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1allRS = AUCallFORCalt(S1good(cellsS1RS),:);
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1excRS = AUCallFORCalt(S1good(cellsS1RS(S1RSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1supRS = AUCallFORCalt(S1good(cellsS1RS(S1RSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1allFS = AUCallFORCalt(S1good(cellsS1FS),:);
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1excFS = AUCallFORCalt(S1good(cellsS1FS(S1FSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCS1FORCBINS.AUCFORCS1supFS = AUCallFORCalt(S1good(cellsS1FS(S1FSsupcellsFORC)),:);
% 
% %
% %
% %
% 
% % Striatum
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRallRS = AUCallFORCalt(strgood(cellsSTRRS),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRexcRS = AUCallFORCalt(strgood(cellsSTRRS(strRSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRsupRS = AUCallFORCalt(strgood(cellsSTRRS(strRSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRallFS = AUCallFORCalt(strgood(cellsSTRFS),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRexcFS = AUCallFORCalt(strgood(cellsSTRFS(strFSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRsupFS = AUCallFORCalt(strgood(cellsSTRFS(strFSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRallUC = AUCallFORCalt(strgood(cellsSTRUC),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRexcUC = AUCallFORCalt(strgood(cellsSTRUC(strUCexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCSTRFORCBINS.AUCFORCSTRsupUC = AUCallFORCalt(strgood(cellsSTRUC(strUCsupcellsFORC)),:);
% 
% %
% %
% %
% 
% % BLA
% 
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAallRS = AUCallFORCalt(blagood(cellsBLARS),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAexcRS = AUCallFORCalt(blagood(cellsBLARS(blaRSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAsupRS = AUCallFORCalt(blagood(cellsBLARS(blaRSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAallFS = AUCallFORCalt(blagood(cellsBLAFS),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAexcFS = AUCallFORCalt(blagood(cellsBLAFS(blaFSexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAsupFS = AUCallFORCalt(blagood(cellsBLAFS(blaFSsupcellsFORC)),:);
% 
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAallUC = AUCallFORCalt(blagood(cellsBLAUC),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAexcUC = AUCallFORCalt(blagood(cellsBLAUC(blaUCexccellsFORC)),:);
% allFiringProperties.AUCFORCBINSALT.AUCBLAFORCBINS.AUCFORCBLAsupUC = AUCallFORCalt(blagood(cellsBLAUC(blaUCsupcellsFORC)),:);
% 
% 
% %% Get ADAPTATION INDICES AND SLOPES
% 
% %S1 AI20
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcMoRS = bspzAI20FORCsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcMoExcRS = bspzAI20FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcObjRS = bspzAI20FORCobj(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcObjExcRS = bspzAI20FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolMoRS = bspzAI20VOLsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolMoExcRS = bspzAI20VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolObjRS = bspzAI20VOLobj(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolObjExcRS = bspzAI20VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcMoFS = bspzAI20FORCsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcMoExcFS = bspzAI20FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcObjFS = bspzAI20FORCobj(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1ForcObjExcFS = bspzAI20FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolMoFS = bspzAI20VOLsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolMoExcFS = bspzAI20VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolObjFS = bspzAI20VOLobj(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI20S1VolObjExcFS = bspzAI20VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% 
% %
% %
% %
% %
% 
% % Striatum
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoRS = bspzAI20FORCsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoExcRS = bspzAI20FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjRS = bspzAI20FORCobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjExcRS = bspzAI20FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoRS = bspzAI20VOLsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoExcRS = bspzAI20VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjRS = bspzAI20VOLobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjExcRS = bspzAI20VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoFS = bspzAI20FORCsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoExcFS = bspzAI20FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjFS = bspzAI20FORCobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjExcFS = bspzAI20FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoFS = bspzAI20VOLsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoExcFS = bspzAI20VOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjFS = bspzAI20VOLobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjExcFS = bspzAI20VOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoUC = bspzAI20FORCsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcMoExcUC = bspzAI20FORCsoc(strgood(cellsSTRUC(strUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjUC = bspzAI20FORCobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRForcObjExcUC = bspzAI20FORCobj(strgood(cellsSTRUC(strUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoUC = bspzAI20VOLsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolMoExcUC = bspzAI20VOLsoc(strgood(cellsSTRUC(strUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjUC = bspzAI20VOLobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI20STRVolObjExcUC = bspzAI20VOLobj(strgood(cellsSTRUC(strUCexccellsVOLOBJ)));
% 
% %
% %
% %
% % BLA
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoRS = bspzAI20FORCsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoExcRS = bspzAI20FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjRS = bspzAI20FORCobj(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjExcRS = bspzAI20FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoRS = bspzAI20VOLsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoExcRS = bspzAI20VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjRS = bspzAI20VOLobj(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjExcRS = bspzAI20VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoFS = bspzAI20FORCsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoExcFS = bspzAI20FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjFS = bspzAI20FORCobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjExcFS = bspzAI20FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoFS = bspzAI20VOLsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoExcFS = bspzAI20VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjFS = bspzAI20VOLobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjExcFS = bspzAI20VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoUC = bspzAI20FORCsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcMoExcUC = bspzAI20FORCsoc(blagood(cellsBLAUC(blaUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjUC = bspzAI20FORCobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAForcObjExcUC = bspzAI20FORCobj(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoUC = bspzAI20VOLsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolMoExcUC = bspzAI20VOLsoc(blagood(cellsBLAUC(blaUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjUC = bspzAI20VOLobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI20BLAVolObjExcUC = bspzAI20VOLobj(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)));
% 
% 
% %% %% Get ADAPTATION INDICES AI40
% 
% %S1 AI40
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcMoRS = bspzAI40FORCsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcMoExcRS = bspzAI40FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcObjRS = bspzAI40FORCobj(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcObjExcRS = bspzAI40FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolMoRS = bspzAI40VOLsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolMoExcRS = bspzAI40VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolObjRS = bspzAI40VOLobj(S1good(cellsS1RS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolObjExcRS = bspzAI40VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcMoFS = bspzAI40FORCsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcMoExcFS = bspzAI40FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcObjFS = bspzAI40FORCobj(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1ForcObjExcFS = bspzAI40FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolMoFS = bspzAI40VOLsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolMoExcFS = bspzAI40VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolObjFS = bspzAI40VOLobj(S1good(cellsS1FS));
% allFiringProperties.AdaptIndex.AdaptS1.AI40S1VolObjExcFS = bspzAI40VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% 
% %
% %
% %
% %
% 
% % Striatum
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoRS = bspzAI40FORCsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoExcRS = bspzAI40FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjRS = bspzAI40FORCobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjExcRS = bspzAI40FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoRS = bspzAI40VOLsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoExcRS = bspzAI40VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjRS = bspzAI40VOLobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjExcRS = bspzAI40VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoFS = bspzAI40FORCsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoExcFS = bspzAI40FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjFS = bspzAI40FORCobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjExcFS = bspzAI40FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoFS = bspzAI40VOLsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoExcFS = bspzAI40VOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjFS = bspzAI40VOLobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjExcFS = bspzAI40VOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoUC = bspzAI40FORCsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcMoExcUC = bspzAI40FORCsoc(strgood(cellsSTRUC(strUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjUC = bspzAI40FORCobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRForcObjExcUC = bspzAI40FORCobj(strgood(cellsSTRUC(strUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoUC = bspzAI40VOLsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolMoExcUC = bspzAI40VOLsoc(strgood(cellsSTRUC(strUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjUC = bspzAI40VOLobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptIndex.AdaptSTR.AI40STRVolObjExcUC = bspzAI40VOLobj(strgood(cellsSTRUC(strUCexccellsVOLOBJ)));
% 
% %
% %
% %
% % BLA
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoRS = bspzAI40FORCsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoExcRS = bspzAI40FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjRS = bspzAI40FORCobj(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjExcRS = bspzAI40FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoRS = bspzAI40VOLsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoExcRS = bspzAI40VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjRS = bspzAI40VOLobj(blagood(cellsBLARS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjExcRS = bspzAI40VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoFS = bspzAI40FORCsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoExcFS = bspzAI40FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjFS = bspzAI40FORCobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjExcFS = bspzAI40FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoFS = bspzAI40VOLsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoExcFS = bspzAI40VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjFS = bspzAI40VOLobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjExcFS = bspzAI40VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoUC = bspzAI40FORCsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcMoExcUC = bspzAI40FORCsoc(blagood(cellsBLAUC(blaUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjUC = bspzAI40FORCobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAForcObjExcUC = bspzAI40FORCobj(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoUC = bspzAI40VOLsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolMoExcUC = bspzAI40VOLsoc(blagood(cellsBLAUC(blaUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjUC = bspzAI40VOLobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptIndex.AdaptBLA.AI40BLAVolObjExcUC = bspzAI40VOLobj(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)));
% 
% %% %% Get ADAPTATION SLOPE
% 
% %S1 Slope
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcMoRS = bspslopestimFORCsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcMoExcRS = bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcObjRS = bspslopestimFORCobj(S1good(cellsS1RS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcObjExcRS = bspslopestimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolMoRS = bspslopestimVOLsoc(S1good(cellsS1RS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolMoExcRS = bspslopestimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolObjRS = bspslopestimVOLobj(S1good(cellsS1RS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolObjExcRS = bspslopestimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcMoFS = bspslopestimFORCsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcMoExcFS = bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcObjFS = bspslopestimFORCobj(S1good(cellsS1FS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1ForcObjExcFS = bspslopestimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolMoFS = bspslopestimVOLsoc(S1good(cellsS1FS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolMoExcFS = bspslopestimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolObjFS = bspslopestimVOLobj(S1good(cellsS1FS));
% allFiringProperties.AdaptSlope.AdaptS1.SlopeS1VolObjExcFS = bspslopestimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% 
% %
% %
% %
% %
% 
% % Striatum
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoRS = bspslopestimFORCsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoExcRS = bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjRS = bspslopestimFORCobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjExcRS = bspslopestimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoRS = bspslopestimVOLsoc(strgood(cellsSTRRS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoExcRS = bspslopestimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjRS = bspslopestimVOLobj(strgood(cellsSTRRS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjExcRS = bspslopestimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoFS = bspslopestimFORCsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoExcFS = bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjFS = bspslopestimFORCobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjExcFS = bspslopestimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoFS = bspslopestimVOLsoc(strgood(cellsSTRFS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoExcFS = bspslopestimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjFS = bspslopestimVOLobj(strgood(cellsSTRFS));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjExcFS = bspslopestimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoUC = bspslopestimFORCsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcMoExcUC = bspslopestimFORCsoc(strgood(cellsSTRUC(strUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjUC = bspslopestimFORCobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRForcObjExcUC = bspslopestimFORCobj(strgood(cellsSTRUC(strUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoUC = bspslopestimVOLsoc(strgood(cellsSTRUC));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolMoExcUC = bspslopestimVOLsoc(strgood(cellsSTRUC(strUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjUC = bspslopestimVOLobj(strgood(cellsSTRUC));
% allFiringProperties.AdaptSlope.AdaptSTR.SlopeSTRVolObjExcUC = bspslopestimVOLobj(strgood(cellsSTRUC(strUCexccellsVOLOBJ)));
% 
% %
% %
% %
% % BLA
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoRS = bspslopestimFORCsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoExcRS = bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjRS = bspslopestimFORCobj(blagood(cellsBLARS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjExcRS = bspslopestimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoRS = bspslopestimVOLsoc(blagood(cellsBLARS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoExcRS = bspslopestimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjRS = bspslopestimVOLobj(blagood(cellsBLARS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjExcRS = bspslopestimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoFS = bspslopestimFORCsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoExcFS = bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjFS = bspslopestimFORCobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjExcFS = bspslopestimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoFS = bspslopestimVOLsoc(blagood(cellsBLAFS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoExcFS = bspslopestimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjFS = bspslopestimVOLobj(blagood(cellsBLAFS));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjExcFS = bspslopestimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% 
% %
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoUC = bspslopestimFORCsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcMoExcUC = bspslopestimFORCsoc(blagood(cellsBLAUC(blaUCexccellsFORCMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjUC = bspslopestimFORCobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAForcObjExcUC = bspslopestimFORCobj(blagood(cellsBLAUC(blaUCexccellsFORCOBJ)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoUC = bspslopestimVOLsoc(blagood(cellsBLAUC));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolMoExcUC = bspslopestimVOLsoc(blagood(cellsBLAUC(blaUCexccellsVOLMO)));
% 
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjUC = bspslopestimVOLobj(blagood(cellsBLAUC));
% allFiringProperties.AdaptSlope.AdaptBLA.SlopeBLAVolObjExcUC = bspslopestimVOLobj(blagood(cellsBLAUC(blaUCexccellsVOLOBJ)));
% % 
% % 
% %% Save allFiringProperties
% 
% FiringFileName = strcat(apbin1, "allFiringProperties", "redowithVOLCORR", "new", ".mat");
% 
% save(FiringFileName, "allFiringProperties")
% % 
% % %%
% % 
% % % %% plot adaptation index, slopes, avg ROC stacked plot 
% % % j=figure(101); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(sigexccellsFORCMO)),nanmean(bspzAI20FORCobj(sigexccellsFORCOBJ)),nanmean(bspzAI20VOLsoc(sigexccellsVOLMO)),nanmean(bspzAI20VOLobj(sigexccellsVOLOBJ))]';
% % % errhigh = [nanstd(bspzAI20FORCsoc(sigexccellsFORCMO))/sqrt(length(bspzAI20FORCsoc(sigexccellsFORCMO))),nanstd(bspzAI20FORCobj(sigexccellsFORCOBJ))/sqrt(length(bspzAI20FORCobj(sigexccellsFORCOBJ))),nanstd(bspzAI20VOLsoc(sigexccellsVOLMO))/sqrt(length(bspzAI20VOLsoc(sigexccellsVOLMO))),nanstd(bspzAI20VOLobj(sigexccellsVOLOBJ))/sqrt(length(bspzAI20VOLobj(sigexccellsVOLOBJ)))];
% % % errlow = [nanstd(bspzAI20FORCsoc(sigexccellsFORCMO))/sqrt(length(bspzAI20FORCsoc(sigexccellsFORCMO))),nanstd(bspzAI20FORCobj(sigexccellsFORCOBJ))/sqrt(length(bspzAI20FORCobj(sigexccellsFORCOBJ))),nanstd(bspzAI20VOLsoc(sigexccellsVOLMO))/sqrt(length(bspzAI20VOLsoc(sigexccellsVOLMO))),nanstd(bspzAI20VOLobj(sigexccellsVOLOBJ))/sqrt(length(bspzAI20VOLobj(sigexccellsVOLOBJ)))];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(sigexccellsFORCMO)),nanmean(bspzAI40FORCobj(sigexccellsFORCOBJ)),nanmean(bspzAI40VOLsoc(sigexccellsVOLMO)),nanmean(bspzAI40VOLobj(sigexccellsVOLOBJ))]';
% % % errhigh = [nanstd(bspzAI40FORCsoc(sigexccellsFORCMO))/sqrt(length(bspzAI40FORCsoc(sigexccellsFORCMO))),nanstd(bspzAI40FORCobj(sigexccellsFORCOBJ))/sqrt(length(bspzAI40FORCobj(sigexccellsFORCOBJ))),nanstd(bspzAI40VOLsoc(sigexccellsVOLMO))/sqrt(length(bspzAI40VOLsoc(sigexccellsVOLMO))),nanstd(bspzAI40VOLobj(sigexccellsVOLOBJ))/sqrt(length(bspzAI40VOLobj(sigexccellsVOLOBJ)))];
% % % errlow = [nanstd(bspzAI40FORCsoc(sigexccellsFORCMO))/sqrt(length(bspzAI40FORCsoc(sigexccellsFORCMO))),nanstd(bspzAI40FORCobj(sigexccellsFORCOBJ))/sqrt(length(bspzAI40FORCobj(sigexccellsFORCOBJ))),nanstd(bspzAI40VOLsoc(sigexccellsVOLMO))/sqrt(length(bspzAI40VOLsoc(sigexccellsVOLMO))),nanstd(bspzAI40VOLobj(sigexccellsVOLOBJ))/sqrt(length(bspzAI40VOLobj(sigexccellsVOLOBJ)))];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(sigexccellsFORCMO)),nanmean(bspslopestimFORCobj(sigexccellsFORCOBJ)),nanmean(bspslopestimVOLsoc(sigexccellsVOLMO)),nanmean(bspslopestimVOLobj(sigexccellsVOLOBJ))]';
% % % errhigh = [nanstd(bspslopestimFORCsoc(sigexccellsFORCMO))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCMO))),nanstd(bspslopestimFORCobj(sigexccellsFORCOBJ))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCOBJ))),nanstd(bspslopestimVOLsoc(sigexccellsVOLMO))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLMO))),nanstd(bspslopestimVOLobj(sigexccellsVOLOBJ))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLOBJ)))];
% % % errlow  = [nanstd(bspslopestimFORCsoc(sigexccellsFORCMO))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCMO))),nanstd(bspslopestimFORCobj(sigexccellsFORCOBJ))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCOBJ))),nanstd(bspslopestimVOLsoc(sigexccellsVOLMO))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLMO))),nanstd(bspslopestimVOLobj(sigexccellsVOLOBJ))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLOBJ)))];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(sigexccellsFORCMO,:));
% % % errhigh = nanstd(bspeachstimFORCsoc(sigexccellsFORCMO,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCMO)));
% % % errlow = nanstd(bspeachstimFORCsoc(sigexccellsFORCMO,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCMO)));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(sigexccellsFORCOBJ,:));
% % % errhigh = nanstd(bspeachstimFORCobj(sigexccellsFORCOBJ,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCOBJ)));
% % % errlow = nanstd(bspeachstimFORCobj(sigexccellsFORCOBJ,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsFORCOBJ)));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(sigexccellsVOLMO,:));
% % % errhigh = nanstd(bspeachstimVOLsoc(sigexccellsVOLMO,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLMO)));
% % % errlow = nanstd(bspeachstimVOLsoc(sigexccellsVOLMO,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLMO)));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(sigexccellsVOLOBJ,:));
% % % errhigh = nanstd(bspeachstimVOLobj(sigexccellsVOLOBJ,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLOBJ)));
% % % errlow = nanstd(bspeachstimVOLobj(sigexccellsVOLOBJ,:))/sqrt(length(bspslopestimFORCsoc(sigexccellsVOLOBJ)));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(sigexccellsFORCMO, sigexccellsFORCOBJ);
% % % allvolexccells = union(sigexccellsVOLMO, sigexccellsVOLOBJ);
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All Cells");
% % % 
% % % %%
% % % exportgraphics(j, nameofexpt, "Append", true);
% % % 
% % % %% plot avg properties for S1 RS cells
% % % 
% % % g=figure(102); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(S1good(cellsS1RS(S1RSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(S1good(cellsS1RS(S1RSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1RS(S1RSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(S1good(cellsS1RS(S1RSexccellsFORCMO)), S1good(cellsS1RS(S1RSexccellsFORCOBJ)));
% % % allvolexccells = union(S1good(cellsS1RS(S1RSexccellsVOLMO)), S1good(cellsS1RS(S1RSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All S1 RS Cells");
% % % 
% % % %% plot avg properties for S1 FS cells
% % % 
% % % h=figure(103); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(S1good(cellsS1FS(S1FSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(S1good(cellsS1FS(S1FSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(S1good(cellsS1FS(S1FSexccellsFORCMO)), S1good(cellsS1FS(S1FSexccellsFORCOBJ)));
% % % allvolexccells = union(S1good(cellsS1FS(S1FSexccellsVOLMO)), S1good(cellsS1FS(S1FSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All S1 FS Cells");
% % % 
% % % %% Striatum Properties
% % % 
% % % m=figure(104); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(strgood(cellsSTRRS(strRSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(strgood(cellsSTRRS(strRSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRRS(strRSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(strgood(cellsSTRRS(strRSexccellsFORCMO)), strgood(cellsSTRRS(strRSexccellsFORCOBJ)));
% % % allvolexccells = union(strgood(cellsSTRRS(strRSexccellsVOLMO)), strgood(cellsSTRRS(strRSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All Striatal RS Cells");
% % % 
% % % % Striatum Properties for FS
% % % 
% % % n=figure(105); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(S1good(cellsS1FS(S1FSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(S1good(cellsS1FS(S1FSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(strgood(cellsSTRFS(strFSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(strgood(cellsSTRFS(strFSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(strgood(cellsSTRFS(strFSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(strgood(cellsSTRFS(strFSexccellsFORCMO)), strgood(cellsSTRFS(strFSexccellsFORCOBJ)));
% % % allvolexccells = union(strgood(cellsSTRFS(strFSexccellsVOLMO)), strgood(cellsSTRFS(strFSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All Striatal FS Cells");
% % % 
% % % 
% % % %% BLA Properties of Cells
% % % 
% % % k=figure(106); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(blagood(cellsBLARS(blaRSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(blagood(cellsBLARS(blaRSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLARS(blaRSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(blagood(cellsBLARS(blaRSexccellsFORCMO)), blagood(cellsBLARS(blaRSexccellsFORCOBJ)));
% % % allvolexccells = union(blagood(cellsBLARS(blaRSexccellsVOLMO)), blagood(cellsBLARS(blaRSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All BLA RS Cells");
% % % 
% % % 
% % % l=figure(107); subplot(3,2,1);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI20FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)))),nanmean(bspzAI20FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))),nanmean(bspzAI20VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)))),nanmean(bspzAI20VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI20FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))/sqrt(length(bspzAI20FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI20FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ))))/sqrt(length(bspzAI20FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI20FORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))/sqrt(length(bspzAI20VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI20FORCobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))/sqrt(length(bspzAI20VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,2);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspzAI40FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)))),nanmean(bspzAI40FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))),nanmean(bspzAI40VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)))),nanmean(bspzAI40VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))]';
% % % a = nanstd(bspzAI40FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))/sqrt(length(bspzAI40FORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))); 
% % % b = nanstd(bspzAI40FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ))))/sqrt(length(bspzAI40FORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))));
% % % c = nanstd(bspzAI40FORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))/sqrt(length(bspzAI40VOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))); 
% % % d = nanstd(bspzAI40FORCobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))/sqrt(length(bspzAI40VOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)))));
% % % 
% % % errhigh = [a,b,c,d];
% % % errlow = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % xlabel("Type of Touch");
% % % ylabel("Average Adaptation Index")
% % % title("Adaptation Index for First 40 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,3);
% % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % data = [nanmean(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)))),nanmean(bspslopestimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))),nanmean(bspslopestimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)))),nanmean(bspslopestimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))]';
% % % 
% % % a = nanstd(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO))))); 
% % % b = nanstd(bspslopestimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ))))/sqrt(length(bspslopestimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ))))); 
% % % c = nanstd(bspslopestimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))/sqrt(length(bspslopestimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO))))); 
% % % d = nanstd(bspslopestimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))/sqrt(length(bspslopestimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ))))); 
% % % errhigh = [a,b,c,d];
% % % errlow  = [a,b,c,d];
% % % 
% % % bar(x,data)                
% % % 
% % % hold on
% % % 
% % % er = errorbar(x,data,errlow,errhigh);    
% % % er.Color = [0 0 0];                            
% % % er.LineStyle = 'none';  
% % % 
% % % xlabel("Type of Touch");
% % % ylabel("Average Slope of Peak Firing")
% % % title("Slope of Peak Firing for First 20 Presentations")
% % % 
% % % hold off
% % % 
% % % subplot(3,2,4);
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:));
% % % errhigh = nanstd(bspeachstimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)))));
% % % errlow = nanstd(bspeachstimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCMO)))));
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % 
% % %  
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:));
% % % errhigh = nanstd(bspeachstimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))));
% % % errlow = nanstd(bspeachstimFORCobj(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsFORCOBJ)))));
% % % er = errorbar(x,data,errlow,'r');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:));
% % % errhigh = nanstd(bspeachstimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)))));
% % % errlow = nanstd(bspeachstimVOLsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLMO)))));
% % % er = errorbar(x,data,errlow,'g');    
% % % %er.Color = [0 0 0];                            
% % % 
% % % 
% % % 
% % % hold on;
% % % 
% % % x = [1:20];
% % % data = nanmean(bspeachstimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:));
% % % errhigh = nanstd(bspeachstimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)))));
% % % errlow = nanstd(bspeachstimVOLobj(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)),:))/sqrt(length(bspslopestimFORCsoc(blagood(cellsBLAFS(blaFSexccellsVOLOBJ)))));
% % % er = errorbar(x,data,errlow,'b');    
% % % 
% % % xlim([1 20])
% % % xlabel("Type of Touch");
% % % ylabel("Average Peak Firing (spks/s)")
% % % title("Peak Firing for First 20 Presentations")
% % %                           
% % % legend("Forc Social", "Forc Object", "Vol Social", "Vol Object");
% % % 
% % % subplot(3,2,5);
% % % 
% % % allforcexccells = union(blagood(cellsBLAFS(blaFSexccellsFORCMO)), blagood(cellsBLAFS(blaFSexccellsFORCOBJ)));
% % % allvolexccells = union(blagood(cellsBLAFS(blaFSexccellsVOLMO)), blagood(cellsBLAFS(blaFSexccellsVOLOBJ)));
% % % 
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallFORC(allforcexccells,:)), nanstd(AUCallFORC(allforcexccells,:))/(sqrt(length(allforcexccells)))); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % hold on;
% % % ShadedErrorBar(-4:0.05:4.95,nanmean(AUCallVOL(allvolexccells,:)), nanstd(AUCallVOL(allvolexccells,:))/(sqrt(length(allvolexccells))),'LineProps','r'); xlim([-4 4.95]); xlabel("Time(s)"), ylabel("auROC"); 
% % % legend("Forced", "Voluntary")
% % % 
% % % title("auROC per Time Bin for Object/Social Touch Preference")
% % % 
% % % subplot(3,2,6)
% % % 
% % % x = categorical({'Forced Touch', 'Voluntary Touch'});
% % % data = [nanmean(AUCForcObjvsSoc(allforcexccells)),nanmean(AUCVolObjvsSoc(allvolexccells))];
% % % errhigh = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % errlow = [nanstd(AUCForcObjvsSoc(allforcexccells))/sqrt(length(AUCForcObjvsSoc(allforcexccells))),nanstd(AUCVolObjvsSoc(allvolexccells))/sqrt(length(AUCVolObjvsSoc(allvolexccells)))];
% % % 
% % % er = errorbar(x,data,errlow);    
% % % er.Color = [0 0 0];
% % % xlabel("Type of Touch");
% % % ylabel("auROC")
% % % title("auROC for Object/Social Touch Preference")
% % % 
% % % 
% % % sgtitle("Firing Properties of All BLA FS Cells");
% % % 
% % % %% For each cell plot all the metrics
% % % 
% % % sigexccellsFORC = union(sigexccellsFORCMO, sigexccellsFORCOBJ);
% % % sigexccellsVOL = union(sigexccellsVOLMO, sigexccellsVOLOBJ);
% % % sigsupcellsFORC = union(sigsupcellsFORCMO, sigsupcellsFORCOBJ);
% % % sigsupcellsVOL = union(sigsupcellsVOLMO, sigsupcellsVOLOBJ);
% % % 
% % % sigexccells = union(sigexccellsFORC, sigexccellsVOL);
% % % sigsupcells = union(sigsupcellsFORC, sigsupcellsVOL);
% % % 
% % % sigcells = [sigexccells, sigsupcells];
% % % 
% % % 
% % % %%
% % % %%
% % % depthspks = {};
% % % 
% % % wpre = 2; 
% % % wpost = 7; 
% % %  
% % % for c = 1:length(spks)
% % %     sp = spks{c};
% % %     tmp = {};
% % %     for itrial = 122
% % %         o = stimonsets(itrial);
% % %         tmp{itrial-1} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
% % %     end
% % %     depthspks{c} = tmp;
% % % end
% % % 
% % %     
% % % close all 
% % % % Save plots of spike rasters by depth
% % % for c = 1:length(uclu)
% % %     if clustergroup(c) ~= "noise"
% % %     fig = figure(102);
% % %     hold on;
% % %     plotrastersTC(depthspks{c},clusterdepth(c));
% % % %     plot([0,0],[0,40],'--r')
% % % %     plot([5,5],[0,40],'--r')
% % % %axis([-2.5,7.5,0,40])
% % % %     print(sprintf('rasters\\cluster%d',uclu(c)),'-dpng')
% % %     ylim([0 max(clusterdepth)])
% % %     end
% % % end
% % % 
% % % 
% % % %% Save all firing properties to a data structure
% % % 
% % % 
% % % 
% % % %%
% % % L23=1;
% % % L4=1;
% % % L56=1;
% % % STRn=1;
% % % blan=1;
% % % % % for a = 1:length(sigcells)
% % % % %     if ismember(goodcludepths(a), L23depths) == 1
% % % % % f=figure; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCsoc), nanstd(S1RSFORCsoc)/(sqrt(length(S1RSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All RS Cells")
% % % % % hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSFORCobj), nanstd(S1RSFORCobj)/(sqrt(length(S1RSexccellsFORCOBJ))),'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% % % % % hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLsoc), nanstd(S1RSVOLsoc)/(sqrt(length(S1RSexccellsVOLMO))),'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% % % % % hold on; subplot(3,2,1:2); ShadedErrorBar(-2:0.05:7,nanmean(S1RSVOLobj), nanstd(S1RSVOLobj)/(sqrt(length(S1RSexccellsVOLOBJ))),'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");  legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% % % % % subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCsoc), nanstd(S1FSFORCsoc)/(sqrt(length(S1FSexccellsFORCMO)))); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% % % % % subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSFORCobj), nanstd(S1FSFORCobj)/(sqrt(length(S1FSexccellsFORCOBJ))), 'lineprops', 'r'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s");
% % % % % subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLsoc), nanstd(S1FSVOLsoc)/(sqrt(length(S1FSexccellsVOLMO))), 'lineprops', 'g'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); 
% % % % % subplot(3,2,3:4); hold on; ShadedErrorBar(-2:0.05:7,nanmean(S1FSVOLobj), nanstd(S1FSVOLobj)/(sqrt(length(S1FSexccellsVOLOBJ))), 'lineprops', 'b'); xlim([-1.5 6.5]); xlabel("Time(s)"), ylabel("Spks/s"); title("Avg Bouts All FS Cells"); legend("Forced Social", "Forced Object", "Voluntary Social", "Voluntary Object");
% % % % % subplot(3,2,5); 
% % % % % hold on; 
% % % % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % % % data = [nanmean(S1RSFORCsocavg),nanmean(S1RSFORCobjavg),nanmean(S1RSVOLsocavg),nanmean(S1RSVOLobjavg)]';
% % % % % errhigh = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% % % % % errlow = [nanstd(S1RSFORCsocavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSFORCobjavg)/sqrt(length(S1RSFORCobjavg)),nanstd(S1RSVOLsocavg)/sqrt(length(S1RSVOLsocavg)),nanstd(S1RSVOLobjavg)/sqrt(length(S1RSVOLobjavg))];
% % % % % er = errorbar(x,data,errlow,errhigh);    
% % % % % er.Color = [0 0 0];                            
% % % % % er.LineStyle = 'none';  
% % % % % xlabel("Type of Touch");
% % % % % ylabel("Average Spikes/s")
% % % % % title("Average Firing Rate of RS S1 Excited Cells for Each Type of Touch")
% % % % % subplot(3,2,6); hold on;
% % % % % x = categorical({'Forced Social', 'Forced Object', 'Voluntary Social', 'Voluntary Object'});
% % % % % data = [nanmean(S1FSFORCsocavg),nanmean(S1FSFORCobjavg),nanmean(S1FSVOLsocavg),nanmean(S1FSVOLobjavg)]';
% % % % % errhigh = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% % % % % errlow = [nanstd(S1FSFORCsocavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSFORCobjavg)/sqrt(length(S1FSFORCobjavg)),nanstd(S1FSVOLsocavg)/sqrt(length(S1FSVOLsocavg)),nanstd(S1FSVOLobjavg)/sqrt(length(S1FSVOLobjavg))];
% % % % % er = errorbar(x,data,errlow,errhigh);    
% % % % % er.Color = [0 0 0];                            
% % % % % er.LineStyle = 'none';  
% % % % % xlabel("Type of Touch");
% % % % % ylabel("Average Spikes/s")
% % % % % title("Average Firing Rate of FS S1 Excited Cells for Each Type of Touch")
% % % % % sgtitle("Mean of all RS and FS S1 Excited cells");
% % % % % exportgraphics(f, nameofexpt, "Append", true);
% % % % % end