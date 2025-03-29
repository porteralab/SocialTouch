clear
close all

%% Select folder as current path
cd(uigetdir('E:\Trish\Neuropixels Data'));

%% Load all files needed for analysis

% Loads all files from Kilosort (not Phy curated)
% Loads the clusters each spike corresponds to
clu = readNPY('spike_clusters.npy');

% Loads the times of each spike, the template its matched to, its amplitude
% and its position on the channel map 
sps = readNPY('spike_times.npy');
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
%clusterID = clusterinfo.id;

%Finds each unique cluster and delegates which spks belong to which cluster
spks = {};
uclu = unique(clu);
%uclu = clusterID;
ap_srate = 30000.316318;
for c = 1:length(uclu)
    spks{c} = single(sps(clu==uclu(c)))/ap_srate;
    spkssamp{c} = single(sps(clu==uclu(c)));
end

%% load channel containing camera signal and frame onsets
bins = dir('*nidq.bin');
binnames = {bins.name};
apbin1 = string(binnames{1});
% Read the digital port of the nidaq
out1 = load_binary_file(apbin1,9,[],[],true);
    %concatenate all three files if there are three
apbin2 = string(binnames{2});
out2 = load_binary_file(apbin2,9,[],[],true);
firstout = cat(2,out1.Data.data,out2.Data.data);
    %get the third file
apbin3 = string(binnames{3});
out3 = load_binary_file(apbin3,9,[],[],true);
secondout = cat(2,firstout,out3.Data.data);
apbin4 = string(binnames{4});
out4 = load_binary_file(apbin4,9,[],[],true);
thirdout = cat(2,secondout,out4.Data.data);
%
apbin5 = string(binnames{5});
out5 = load_binary_file(apbin5,9,[],[],true);
fourthout = cat(2,thirdout,out5.Data.data);
%
apbin6 = string(binnames{6});
out6 = load_binary_file(apbin6,9,[],[],true);
realout = cat(2,fourthout,out6.Data.data);

% apbin7 = string(binnames{7});
% out7 = load_binary_file(apbin7,9,[],[],true);
% sixthout = cat(2,fifthout,out7.Data.data);
% 
% 
% apbin8 = string(binnames{8});
% out8 = load_binary_file(apbin8,9,[],[],true);
% sevenout = cat(2,sixthout,out8.Data.data);
% 
% apbin9 = string(binnames{9});
% out9 = load_binary_file(apbin9,9,[],[],true);
% realout = cat(2,sevenout,out9.Data.data);


%% if additional day was tested
apbin8 = string(binnames{8});
out8 = load_binary_file(apbin8,9,[],[],true);
sevenout = cat(2,sixthout,out8.Data.data);

apbin9 = string(binnames{9});
out9 = load_binary_file(apbin9,9,[],[],true);
eightout = cat(2,sevenout,out9.Data.data);
%
apbin10 = string(binnames{10});
out10 = load_binary_file(apbin10,9,[],[],true);
nineout = cat(2,eightout,out10.Data.data);
%
apbin11 = string(binnames{11});
out11 = load_binary_file(apbin11,9,[],[],true);
tenout = cat(2,nineout,out11.Data.data);
%
apbin12 = string(binnames{12});
out12 = load_binary_file(apbin12,9,[],[],true);
realout = cat(2,tenout,out12.Data.data);



%%
digistr = dec2bin(realout(end,:),16);
digi = zeros([size(realout,2),16]);
for i = 1:16
    digi(:,abs(17-i)) = (digistr(:,i)=='1'); 
end
clear digistr
probeonsets = find(diff(digi(:,1))>0.5)+1;
frameonsets = find(diff(digi(:,2))>0.5)+1;


    
figure();hold all
plot(0:length(digi)-1,digi(:,1))
plot(probeonsets,digi(probeonsets,1),'ko')
plot(frameonsets,digi(frameonsets,2),'ro')
%% Extract the square pulses from the probe
bins = dir('*.lf.bin');
binnames = {bins.name};
apbin = string(binnames(1));
out = load_binary_file(apbin,385,[],[],true);
digistr = dec2bin(out.Data.data(end,:),16);
digi = zeros([size(out.Data.data,2),16]);
for i = 1:16
    digi(:,abs(17-i)) = (digistr(:,i)=='1'); 
end
clear digistr

imec_probeonsets = find(diff(digi(:,7))>0.5)+1;
%% % read the sampling rate
[foldername,filename,ext] = fileparts(apbin)

mmfirst = fopen(strcat(filename,'.meta'),'r');
txt = fgetl(mmfirst);
meta.range = [];
while isstr(txt);
    txt = fgetl(mmfirst);
%     if strfind(txt,'nChans')
    if strfind(txt,'imSampRate')
        tmp = strsplit(txt,'=');
        lfp_srate = str2num(tmp{end});
%     elseif strfind(txt,'sRateHz')
    end
end
%%
frameonsets_ = interp1(probeonsets,imec_probeonsets/lfp_srate,frameonsets,'linear','extrap');
figure()
plotRastergram({imec_probeonsets/lfp_srate,frameonsets_(1:4000)})

%%
figure();hold all
for i = 1:16
    plot(digi(:,i)*0.8+1*i)
end
%%
figure()
hold all
    plot(out.Data.data(end,1:30000)+i*100)

%% Use signal to find start and end of social touch fo each stim
clear trialonsets
bins = dir('*nidq.bin');
binnames = {bins.name};
apbin1 = string(binnames(1));
apbin2 = string(binnames(2));
out1 = load_binary_file(apbin1,9,[],[],true);
% Read digital port of nidaq for the second baseline file in concatenation
out2 = load_binary_file(apbin2,9,[],[],true);
firstout = cat(2,out1.Data.data,out2.Data.data);
    %get the third file
apbin3 = string(binnames{3});
out3 = load_binary_file(apbin3,9,[],[],true);
secondout = cat(2,firstout,out3.Data.data);
apbin4 = string(binnames{4});
out4 = load_binary_file(apbin4,9,[],[],true);
thirdout = cat(2,secondout,out4.Data.data);
%
apbin5 = string(binnames{5});
out5 = load_binary_file(apbin5,9,[],[],true);
fourthout = cat(2,thirdout,out5.Data.data);
%
apbin6 = string(binnames{6});
out6 = load_binary_file(apbin6,9,[],[],true);
fifthout = cat(2,fourthout,out6.Data.data);

apbin7 = string(binnames{7});
out7 = load_binary_file(apbin7,9,[],[],true);
sixthout = cat(2,fifthout,out7.Data.data);
%

apbin8 = string(binnames{8});
out8 = load_binary_file(apbin8,9,[],[],true);
sevenout = cat(2,sixthout,out8.Data.data);

apbin9 = string(binnames{9});
out9 = load_binary_file(apbin9,9,[],[],true);
realout = cat(2,sevenout,out9.Data.data);


% % if more days done
% apbin8 = string(binnames{8});
% out8 = load_binary_file(apbin8,9,[],[],true);
% sevenout = cat(2,sixthout,out8.Data.data);
% 
% apbin9 = string(binnames{9});
% out9 = load_binary_file(apbin9,9,[],[],true);
% eightout = cat(2,sevenout,out9.Data.data);
% %
% apbin10 = string(binnames{10});
% out10 = load_binary_file(apbin10,9,[],[],true);
% nineout = cat(2,eightout,out10.Data.data);
% %
% apbin11 = string(binnames{11});
% out11 = load_binary_file(apbin11,9,[],[],true);
% tenout = cat(2,nineout,out11.Data.data);
% %
% apbin12 = string(binnames{12});
% out12 = load_binary_file(apbin12,9,[],[],true);
% realout = cat(2,tenout,out12.Data.data);
% Read the digital port of the nidaq for the first baseline file in concatenation
digistr = dec2bin(realout(end,:),16);
digi = zeros([size(realout,2),16]);
for i = 1:16
    digi(:,abs(17-i)) = (digistr(:,i)=='1'); 
end
clear digistr


trialonsets = find(diff(digi(:,3))>0.5)+1;
stimonsets = interp1(probeonsets,imec_probeonsets/lfp_srate,trialonsets,'linear','extrap');
stimonsetsframes = interp1(probeonsets,imec_probeonsets/lfp_srate,trialonsets,'linear','extrap');
%% Use video to find the start and end of social touch of each stim - FIRST CROP
vidname = dir('*.avi');
vid = VideoReader(vidname(1).name);
tmp = [];
testim = vid.read(49000);
figure;
[croppedImage, rect] = imcrop(testim);

%% Use video to find the start and end of social touch of each stim - ASSIGN CROP
newrect = round(rect);
for iframe = 1:vid.NumFrames
    im = vid.read(iframe);
%     tmp = [tmp,im(325:361,85:121,2)];
    tmp = [tmp,im((newrect(2)):((newrect(2)+(newrect(4)))),(newrect(1)):((newrect(1)+(newrect(3)))),2)];
    if mod(iframe,100) == 1
        disp(iframe)
    end
end
axis1 = newrect(4);
axis2 = newrect(3);
tmp = reshape(tmp,[axis2+1,axis1+1,iframe]);
sts = squeeze(sum(sum(tmp,1),2));
%%
figure;
clf
hold on
plot(sts)
fsts = medfilt1(sts,100);
plot(fsts)
thresh = 1.57*(min(sts));
plot(xlim(),[1,1]*thresh)
tt = fsts>thresh;
idx = find(diff(tt)>0.5);
newidx = diff(idx);
plot(idx,fsts(idx),'ko')
   
%%
secondframeonsets_ = frameonsets_(81105+1:145003);
% stimonsets(1:40) = secondframeonsets_(idx(1:end));
stimonsets2 = secondframeonsets_(idx);
%%
secondframeonsets_ = frameonsets_(framelag+1:end);
stimonsets = secondframeonsets_(idx(1:end));
%% plot raster plots based on each presentation 

% raster plots for 5 seconds before and 5 second during and after for the
% first CONDITION

trialspks = {};

wpre = 2.5; 
wpost = 7.5; 

if length(stimonsets)>40
    lenonsets = length(stimonsets)/4;
else
    lenonsets = length(stimonsets);
end

lenonsets = 40;

for c = 1:length(spks)
    sp = spks{c};
    tmp = {};
    for itrial = 1:40
        o = stimonsets(itrial+80);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    trialspks{c} = tmp;
end

if length(stimonsets)>40
    trialspks2 = {};

    wpre = 2.5; 
    wpost = 7.5; 
 
    for c = 1:length(spks)
        sp = spks{c};
        tmp2 = {};
        for itrial = 1:40
            o = stimonsets(itrial+120);
            tmp2{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
        end
        trialspks2{c} = tmp2;
    end
end
    

%%
depthspks = {};

wpre = 2; 
wpost = 7; 
 
for c = 1:length(spks)
    sp = spks{c};
    tmp = {};
    for itrial = 56
        o = stimonsets(itrial);
        tmp{itrial} = (double(sp((sp>=o-wpre) & (sp<o+wpost)))-o);
    end
    depthspks{c} = tmp;
end

    
%close all 
% Save plots of spike rasters by depth
for c = 1:length(uclu)
    if clustergroup(c) ~= "noise" 
    fig = figure(107);
    hold on;
    plotrastersTC(depthspks{c},clusterdepth(c));
%     plot([0,0],[0,40],'--r')
%     plot([5,5],[0,40],'--r')
%axis([-2.5,7.5,0,40])
%     print(sprintf('rasters\\cluster%d',uclu(c)),'-dpng')
    ylim([0 max(clusterdepth)])
    end
end

%% Plot rasters

mkdir rastersForcobj
% Save plots of spike rasters for each cluster for first condition
for c = 1:length(uclu)
    fig = figure(100);
    clf
    plotRastergram(trialspks{c});hold all
    plot([0,0],[0,40],'--r')
    plot([5,5],[0,40],'--r')
    axis([-2.5,7.5,0,40])
    print(sprintf('rastersForcobj\\cluster%d',uclu(c)),'-dpng')
end

if length(stimonsets)>40
close all
mkdir rastersForcmo
% Save plots of spike rasters for each cluster for second condition
    for c = 1:length(uclu)
        fig = figure(100);
        clf
        plotRastergram(trialspks2{c});hold all
        plot([0,0],[0,40],'--r')
        plot([5,5],[0,40],'--r')
        axis([-2.5,7.5,0,40])
        print(sprintf('rastersForcmo\\cluster%d',uclu(c)),'-dpng')
    end
end


%-2.5,7.5
%%

figure;plotRastergram(trialspks{193});hold all
plot([0,0],[0,40],'--r')
plot([5,5],[0,40],'--r')
axis([-2,7,0,40])
xlabel(["Time s"])
ylabel(["Trial #"])

%% PSTH of all S1, striatal or BLA neurons across stim time
clear mmfirst
clear ssfirst
clear mmsecond
clear sssecond

%Find an clusters with less than 2 spikes across all time points and remove
%those values from that cluster to eliminate thos cells
for c = 1:length(uclu)
    almostemptyclus = ~cellfun(@isempty,trialspks{c});
    allsinglevalues = numel(find(almostemptyclus==1));
    findempty = find(almostemptyclus==1);
    if allsinglevalues == 1;
        trialspks{1,c}{1,findempty}=[];
    end
end


%Remove any cells that are empty
    for c = 1:length(uclu)
    for g = 1:lenonsets
        m(g) = isempty(trialspks{1,c}{1,g});
    end
        newm = all(m);
    if newm == 1
        wrongcells(c) = 1;
    else wrongcells(c) = 0;
    end
    end
    
if length(stimonsets)>40
    clear m
    clear newm
    for c = 1:length(uclu)
    almostemptyclus = ~cellfun(@isempty,trialspks2{c});
    allsinglevalues = numel(find(almostemptyclus==1));
    findempty = find(almostemptyclus==1);
    if allsinglevalues == 1;
        trialspks2{1,c}{1,findempty}=[];
    end
end


%Remove any cells that are empty
    for c = 1:length(uclu)
    for g = 1:lenonsets
        m(g) = isempty(trialspks2{1,c}{1,g});
    end
        newm = all(m);
    if newm == 1
        wrongcells(c) = 1;
    end
    end
end
    

    
 
%% Remove clusters with ISIs < 1.5 ms for > 5% of the time
ISIcutoff = 1.5/1000;

for c = 1:length(spks)
a = find(spks{c}>120);
if isempty(a) == 1
newspks{c} = [];
else
newspks{c} = spks{c}(a(1):end);
end
end

for c = 1:length(newspks)
ISIs{c} = diff(newspks{c});
end
for c = 1:length(ISIs)
diffclus = (ISIs{c}<ISIcutoff);
badclus(c) = sum(diffclus(:) == 1);
end

for c = 1:length(badclus)
if (badclus(c)/(length(spks{c})))>0.05
wrongcells(c) = 1;
end
end

% %% Isolated fast-spiking cells
% myKsDir = pwd;
% sp = loadKSdir(myKsDir);
% [spikeAmps, spikeDepths, templateYpos, tempAmps, tempsUnW, tempDur, tempPeakWF] = ...
% templatePositionsAmplitudes(sp.temps, sp.winv, sp.ycoords, sp.spikeTemplates, sp.tempScalingAmps);
% allclu = sp.clu;
% alltemp = sp.spikeTemplates;
% ap_srate = 30000.316318;
% tempDurinsec = (tempDur/ap_srate)*10^6;
% allclu = double(sp.clu);
% 
% %Find the clusters with template duration of 500 or more or less and delete
% %those - delete all more than 500 for fastspiking and delete all those less
% %than 500 for regular spiking
%  for c = 1:length(tempDurinsec)
% index=find(alltemp==c);
% if tempDurinsec(c)<500
% allclu(index)=nan;
% end
%  end
% 
% uniqueclu = unique(allclu);
% uniclu=uniqueclu(~isnan(uniqueclu));
% [tf,ucluindex] = ismember(uniclu,uclu);
% for c = 1:length(ucluindex)
%     wrongcells(ucluindex(c)) = 1;
% end
%     
exist trialspks2;
existtrialspks2 = ans;
%% Assigns all the good cells to mm
for c = 1:length(uclu)
    if wrongcells(c) == 1;
        mmfirst{c} = [];
        ssfirst{c} = [];
        mmsecond{c} = [];
        sssecond{c} = [];
    elseif wrongcells(c) == 0;
    binsize = 0.01;
    k = alpha_func(1,1,25,1/binsize,1000);
    k = [k*0,k];
    k = k/sum(k);
    bsp = convolve_spiketrains(trialspks{c},binsize,[-2.5,7.5],k)./binsize;
    if existtrialspks2 == 1
    bsp2 = convolve_spiketrains(trialspks2{c},binsize,[-2.5,7.5],k)./binsize;
    end
%     figure(40)
%     clf
%     subplot(2,1,1)
%    
%     imagesc(bsp)
%     colormap(flipud(gray))
%
%     xlim([0,size(bsp,2)])
%     subplot(2,1,2)
%     plot(mean(bsp,1))
%     xlim([0,size(bsp,2)])
%imagesc(-0.5:0.005:1.5,[1:80],bsp)
    mmfirst{c} = mean(bsp,1);
    ssfirst{c} = std(bsp,1)/sqrt(40);
    if existtrialspks2 == 1
    mmsecond{c} = mean(bsp2,1);
    sssecond{c} = std(bsp,1)/sqrt(40);
    end
%     figure(200);
%     plot(-2.5:binsize:7.5,mmfirst{c},'color','K')
%     ylabel('Spikes per second')
%     xlabel('time (s)')
%     if existtrialspks2 == 1
%     figure(201);
%     plot(-2.5:binsize:7.5,mmsecond{c}, 'color', 'K')
% % plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
%     ylabel('Spikes per second')
%     xlabel('time (s)')
%     end
    end
end

%%
% Empty any trialspks and their corresponding cluster according to if
% trialspks is empty
% Mean firng rate of all clusters in S1 and BLA across stimulation
% all S1 neurons
for c = 1:length(uclu)
    if clustergroup(c) == "noise" 
        mmfirst{c} = [];
        mmsecond{c} = [];
%     elseif clustergroup(c) == "mua" 
%         mmfirst{c} = []; 
%         mmsecond{c} = [];
    end
end

%%
figure; shadedErrorBar(-2.5:0.01:7.5, mmfirst{21},ssfirst{21})
xlim([-2 7])
ylabel(["Firing rate (Hz)"])
xlabel(["Time(s)"]);
figure;
plotRastergram(trialspks{338});
hold all;
plot([0,0],[0,40],'--r')
plot([5,5],[0,40],'--r')
axis([-2,7,0,40])
ylabel(["Trial #"])

%% For the first condition, state the name and then run everything 

filename = strsplit(binnames{length(binnames)-1},'_');
touchcond = filename(3);
disp(touchcond)


%%
disp("first S1 channels are specified");
s1mean = mmfirst;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(S1depths(1))    
        s1mean{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(S1depths(end))    
        s1mean{c} = [];
    end
end

% for c = 1:length(uclu)
%     if clusterdepth(c)>s1depth
%         s1mean{c} = [];
%     end
% end

s1mat = cell2mat(s1mean);

idx = cellfun('isempty',s1mean);
s1mean = s1mean(~idx);
%%

for n = 1:length(s1mean{1,1})
    for e = 1:length(s1mean)
        news1means(n,e) = s1mean{1,e}(n);
    end
    alls1mean(n) = mean(news1means(n,:));
end

figure;
plot(-2.5:binsize:7.5,alls1mean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);


%quick sem for S1
s1sem = ssfirst;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(S1depths(1))    
        s1sem{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(S1depths(end))    
        s1sem{c} = [];
    end
end

s1sem = s1sem(~idx);


for n = 1:length(s1sem{1,1})
    for e = 1:length(s1sem)
        news1sems(n,e) = s1sem{1,e}(n);
    end
    alls1sem(n) = mean(news1sems(n,:));
end

reals1sem = alls1sem/(sqrt(length(s1mean)));

figure;
errorbar(-2.5:binsize:7.5,alls1mean, reals1sem, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

%% all BLA neurons

blamean = mmfirst;
disp("next BLA channels are specified");
for c = 1:length(uclu)
    if clusterdepth(c)<bladepths(1)
        blamean{c} = [];
    end
end

for c = 1:length(uclu)
    if clusterdepth(c)>bladepths(end)
        blamean{c} = [];
    end
end

blamat = cell2mat(blamean);

idx2 = cellfun('isempty',blamean);
blamean = blamean(~idx2);


for n = 1:length(blamean{1,1})
    for e = 1:length(blamean)
        newblameans(n,e) = blamean{1,e}(n);
    end
    allblamean(n) = mean(newblameans(n,:));
end

figure;
plot(-2.5:binsize:7.5,allblamean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);

%quick sem for bla
blasem = ssfirst;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(bladepths(1))    
        blasem{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(bladepths(end))    
        blasem{c} = [];
    end
end


blasem = blasem(~idx2);


for n = 1:length(blasem{1,1})
    for e = 1:length(blasem)
        newblasems(n,e) = blasem{1,e}(n);
    end
    allblasem(n) = mean(newblasems(n,:));
end

realblasem = allblasem/(sqrt(length(blamean)));

figure;
errorbar(-2.5:binsize:7.5,allblamean, realblasem, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

% all striatal neurons 

%striataldepth = input("what is the max depth to not exceed for striatal?");
striatalmean = mmfirst;
disp("finally striatal channels are specified");
for c = 1:length(uclu)
    %if clusterdepth(c)>(s1depth-2000)
    if clusterdepth(c)<striataldepths(1)
        striatalmean{c} = [];
    end
end

for c = 1:length(uclu)
    if clusterdepth(c)>striataldepths(end)
        striatalmean{c} = [];
    end
end

striatalmat = cell2mat(striatalmean);

idx3 = cellfun('isempty',striatalmean);
striatalmean = striatalmean(~idx3);


for n = 1:length(striatalmean{1,1})
    for e = 1:length(striatalmean)
        newstriatalmeans(n,e) = striatalmean{1,e}(n);
    end
    allstriatalmean(n) = mean(newstriatalmeans(n,:));
end

figure;
plot(-2.5:binsize:7.5,allstriatalmean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);

%quick sem for bla
striatalsem = ssfirst;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(striataldepths(1))    
        striatalsem{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(striataldepths(end))    
        striatalsem{c} = [];
    end
end

striatalsem = striatalsem(~idx3);


for n = 1:length(striatalsem{1,1})
    for e = 1:length(striatalsem)
        newstriatalsems(n,e) = striatalsem{1,e}(n);
    end
    allstriatalsem(n) = mean(newstriatalsems(n,:));
end

realstriatalsem = allstriatalsem/(sqrt(length(striatalmean)));

figure;
errorbar(-2.5:binsize:7.5,allstriatalmean, realstriatalsem, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

%% Get normalized firing rates for S1 and BLA
%calculate normalized firing rate for BLA
newblameansize = size(newblameans);

for n = 1:(newblameansize(2));
normblamean(:,n) = ((newblameans(:,n))-(mean(newblameans(:,n))))/(std(newblameans(:,n)));
end

% normblamean(201,:)= 0;
avgnormbla = mean(normblamean');
% avgnormbla(201) = 0;

% calculate normalized firing rate for S1 
newS1meansize = size(news1means);

% news1means(201,:)=[];

for n = 1:(newS1meansize(2))
normS1mean(:,n) = ((news1means(:,n))-(mean(news1means(:,n))))/(std(news1means(:,n)));
end

% normS1mean(201,:)= 0;
avgnormS1 = mean(normS1mean');
% avgnormS1(201) = 0;


% calculate normalized firing rate for striatum 
newstriatalmeansize = size(newstriatalmeans);

% newstriatalmeans(201,:)=[];

for n = 1:(newstriatalmeansize(2))
normstriatalmean(:,n) = ((newstriatalmeans(:,n))-(mean(newstriatalmeans(:,n))))/(std(newstriatalmeans(:,n)));
end

% normS1mean(201,:)= 0;
avgnormstriatal = mean(normstriatalmean');
% avgnormS1(201) = 0;
%% Plot each neuron in BLA and S1 across time relative to stimulus onset
%Sorting each of the BLA cells relative to time of stimulus onset (early
%neurons first)
%close all

for n = 1:length(blamean)
    sortblamean(n,:) = normblamean(n,:);
    sortblamean(n,:) = sort(sortblamean(n,:));
end

normblameansw = normblamean';

[~,Indexofmax] = max(normblameansw,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indx(i);
    newmeanblasortedcells(i,:) = normblameansw(newindex,:);
end

newmeanblasortedcells(:,end) = nan;
binning = -2.5:binsize:7.5;

blalength = length(blamean);
figure(10);
imagesc(-2.5:binsize:7.5,[1:blalength],newmeanblasortedcells);
hold on
plot([0,0],[0,(blalength)],'--r')
plot([5,5],[0,(blalength)],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('BLA Single Cell Tuning to Social Touch')
%%
%Sort each S1 neuron relative to time of stimulus onset (early
%neurons first)

for n = 1:length(s1mean)
    sorts1mean(n,:) = normS1mean(n,:);
    sorts1mean(n,:) = sort(sorts1mean(n,:));
end

norms1meansw = normS1mean';

[~,Indexofmax] = max(norms1meansw,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indx(i);
    newmeans1sortedcells(i,:) = norms1meansw(newindex,:);
end

s1length = length(s1mean);
figure(11);
imagesc(-2.5:binsize:7.5,[1:s1length],newmeans1sortedcells);
hold on
plot([0,0],[0,s1length],'--r')
plot([5,5],[0,s1length],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('S1 Single Cell Tuning to Social Touch')

%Sort each striatal neuron relative to time of stimulus onset (early
%neurons first)

for n = 1:length(striatalmean)
    sortstriatalmean(n,:) = normstriatalmean(n,:);
    sortstriatalmean(n,:) = sort(sortstriatalmean(n,:));
end

normstriatalmeansw = normstriatalmean';

[~,Indexofmax] = max(normstriatalmeansw,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indx(i);
    newmeanstriatalsortedcells(i,:) = normstriatalmeansw(newindex,:);
end

striatallength = length(striatalmean);
figure(12);
imagesc(-2.5:binsize:7.5,[1:striatallength],newmeanstriatalsortedcells);
hold on
plot([0,0],[0,striatallength],'--r')
plot([5,5],[0,striatallength],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('Striatal Single Cell Tuning to Social Touch')


%% Plot the normalized and raw firing rates
BLAmax = max(allblamean);
BLAround = ceil(BLAmax);

normS1max = max(avgnormS1);
normS1round = ceil(normS1max);

%plot firing rate for BLA
figure(6);
plot(-2.5:binsize:7.5,allblamean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
hold on
plot([0,0],[0,BLAround],'--r')
plot([5,5],[0,BLAround],'--r')
xlim([-2.5 7.5])
title('Raw Average Firing Rate of BLA Cells to Social Touch')


%plot firing rate of S1

S1max = max(alls1mean);
S1round = ceil(S1max);

figure(7);
plot(-2.5:binsize:7.5,alls1mean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
ylim([0,S1round])
hold on
plot([0,0],[0,S1round],'--r')
plot([5,5],[0,S1round],'--r')
title('Raw Average Firing Rate of S1 Cells to Social Touch')


% plot average firing rate of striatum

striatalmax = max(allstriatalmean);
striatalround = ceil(striatalmax);

figure(8);
plot(-2.5:binsize:7.5,allstriatalmean,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
ylim([0,striatalround])
hold on
plot([0,0],[0,striatalround],'--r')
plot([5,5],[0,striatalround],'--r')
title('Raw Average Firing Rate of Striatal Cells to Social Touch')

%plot firing rate of both BLA and S1 and striatum
figure(10);
subplot(3,1,1)
plot(-2.5:binsize:7.5,alls1mean,'color','K')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
xlim([-2.5 7.5])
ylabel('Spikes per second')
title('S1')
subplot(3,1,2)
plot(-2.5:binsize:7.5,allstriatalmean,'color','G')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlim([-2.5 7.5])
title('Striatum')
subplot(3,1,3)
plot(-2.5:binsize:7.5,allblamean,'color','B')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
title('BLA')
sgtitle('Average Firing Rate of Cells to Social Touch')


%% For the SECOND condition, state the name and then run everything 
if stimonsets>40
filename = strsplit(binnames{length(binnames)},'_');
touchcond2 = filename(3);
disp(touchcond2)

%%
disp("first S1 channels are specified");
s1mean2 = mmsecond;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(S1depths(1))    
        s1mean2{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(S1depths(end))    
        s1mean2{c} = [];
    end
end

% for c = 1:length(uclu)
%     if clusterdepth(c)>s1depth
%         s1mean{c} = [];
%     end
% end

s1mat2 = cell2mat(s1mean2);

idx = cellfun('isempty',s1mean2);
s1mean2 = s1mean2(~idx);


for n = 1:length(s1mean2{1,1})
    for e = 1:length(s1mean2)
        news1means2(n,e) = s1mean2{1,e}(n);
    end
    alls1mean2(n) = mean(news1means2(n,:));
end

figure(13);
plot(-2.5:binsize:7.5,alls1mean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);


%quick sem for S1
s1sem2 = sssecond;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(S1depths(1))    
        s1sem2{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(S1depths(end))    
        s1sem2{c} = [];
    end
end

s1sem2 = s1sem2(~idx);


for n = 1:length(s1sem2{1,1})
    for e = 1:length(s1sem2)
        news1sems2(n,e) = s1sem2{1,e}(n);
    end
    alls1sem2(n) = mean(news1sems2(n,:));
end

reals1sem2 = alls1sem2/(sqrt(length(s1mean2)));

figure(14);
errorbar(-2.5:binsize:7.5,alls1mean2, reals1sem2, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

%% all BLA neurons
blamean2 = mmsecond;
disp("next BLA channels are specified");
for c = 1:length(uclu)
    if clusterdepth(c)<bladepths(1)
        blamean2{c} = [];
    end
end

for c = 1:length(uclu)
    if clusterdepth(c)>bladepths(end)
        blamean2{c} = [];
    end
end

blamat = cell2mat(blamean2);

idx2 = cellfun('isempty',blamean2);
blamean2 = blamean2(~idx2);


for n = 1:length(blamean2{1,1})
    for e = 1:length(blamean2)
        newblameans2(n,e) = blamean2{1,e}(n);
    end
    allblamean2(n) = mean(newblameans2(n,:));
end

figure(15);
plot(-2.5:binsize:7.5,allblamean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);

%quick sem for bla
blasem2 = sssecond;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(bladepths(1))    
        blasem2{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(bladepths(end))    
        blasem2{c} = [];
    end
end


blasem2 = blasem2(~idx2);


for n = 1:length(blasem2{1,1})
    for e = 1:length(blasem2)
        newblasems2(n,e) = blasem2{1,e}(n);
    end
    allblasem2(n) = mean(newblasems2(n,:));
end

realblasem2 = allblasem2/(sqrt(length(blamean2)));

figure(16);
errorbar(-2.5:binsize:7.5,allblamean2, realblasem2, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

% all striatal neurons 

%striataldepth = input("what is the max depth to not exceed for striatal?");
striatalmean2 = mmsecond;
disp("finally striatal channels are specified");
for c = 1:length(uclu)
    %if clusterdepth(c)>(s1depth-2000)
    if clusterdepth(c)<striataldepths(1)
        striatalmean2{c} = [];
    end
end

for c = 1:length(uclu)
    if clusterdepth(c)>striataldepths(end)
        striatalmean2{c} = [];
    end
end

striatalmat = cell2mat(striatalmean2);

idx3 = cellfun('isempty',striatalmean2);
striatalmean2 = striatalmean2(~idx3);


for n = 1:length(striatalmean2{1,1})
    for e = 1:length(striatalmean2)
        newstriatalmeans2(n,e) = striatalmean2{1,e}(n);
    end
    allstriatalmean2(n) = mean(newstriatalmeans2(n,:));
end

figure(17);
plot(-2.5:binsize:7.5,allstriatalmean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);

%quick sem for bla
striatalsem2 = sssecond;
for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)<(striataldepths(1))    
        striatalsem2{c} = [];
    end
end

for c = 1:length(uclu)
    %if clusterdepth(c)<(s1depth-2000)
    if clusterdepth(c)>(striataldepths(end))    
        striatalsem2{c} = [];
    end
end

striatalsem2 = striatalsem2(~idx3);


for n = 1:length(striatalsem2{1,1})
    for e = 1:length(striatalsem2)
        newstriatalsems2(n,e) = striatalsem2{1,e}(n);
    end
    allstriatalsem2(n) = mean(newstriatalsems2(n,:));
end

realstriatalsem2 = allstriatalsem2/(sqrt(length(striatalmean2)));

figure(18);
errorbar(-2.5:binsize:7.5,allstriatalmean2, realstriatalsem2, 'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5]);
% ylim([5 10]) 
hold on
plot([0,0],[0,10],'--r')
hold on
plot([5,5],[0,10],'--r')

end

%% Get normalized firing rates for S1 and BLA
%calculate normalized firing rate for BLA
newblameansize2 = size(newblameans2);

for n = 1:(newblameansize2(2));
normblamean2(:,n) = ((newblameans2(:,n))-(mean(newblameans2(:,n))))/(std(newblameans2(:,n)));
end

% normblamean(201,:)= 0;
avgnormbla2 = mean(normblamean2');
% avgnormbla(201) = 0;

% calculate normalized firing rate for S1 
newS1meansize2 = size(news1means2);

% news1means(201,:)=[];

for n = 1:(newS1meansize2(2))
normS1mean2(:,n) = ((news1means2(:,n))-(mean(news1means2(:,n))))/(std(news1means2(:,n)));
end

% normS1mean(201,:)= 0;
avgnormS12 = mean(normS1mean2');
% avgnormS1(201) = 0;


% calculate normalized firing rate for striatum 
newstriatalmeansize2 = size(newstriatalmeans2);

% newstriatalmeans(201,:)=[];

for n = 1:(newstriatalmeansize2(2))
normstriatalmean2(:,n) = ((newstriatalmeans2(:,n))-(mean(newstriatalmeans2(:,n))))/(std(newstriatalmeans2(:,n)));
end

% normS1mean(201,:)= 0;
avgnormstriatal2 = mean(normstriatalmean2');
% avgnormS1(201) = 0;
%% Plot each neuron in BLA and S1 across time relative to stimulus onset
%Sorting each of the BLA cells relative to time of stimulus onset (early
%neurons first)
%close(figure(13:18))
for n = 1:length(blamean2)
    sortblamean2(n,:) = normblamean2(n,:);
    sortblamean2(n,:) = sort(sortblamean2(n,:));
end

normblameansw2 = normblamean2';

[~,Indexofmax] = max(normblameansw2,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex2 = indx(i);
    newmeanblasortedcells2(i,:) = normblameansw2(newindex2,:);
end

newmeanblasortedcells2(:,end) = nan;
binning = -2.5:binsize:7.5;

blalength2 = length(blamean2);
figure(13);
imagesc(-2.5:binsize:7.5,[1:blalength2],newmeanblasortedcells2);
hold on
plot([0,0],[0,(blalength2)],'--r')
plot([5,5],[0,(blalength2)],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('BLA Single Cell Tuning to Social Touch')

%Sort each S1 neuron relative to time of stimulus onset (early
%neurons first)

for n = 1:length(s1mean2)
    sorts1mean2(n,:) = normS1mean2(n,:);
    sorts1mean2(n,:) = sort(sorts1mean2(n,:));
end

norms1meansw2 = normS1mean2';

[~,Indexofmax] = max(norms1meansw2,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex2 = indx(i);
    newmeans1sortedcells2(i,:) = norms1meansw2(newindex2,:);
end

s1length2 = length(s1mean2);
figure(14);
imagesc(-2.5:binsize:7.5,[1:s1length2],newmeans1sortedcells2);
hold on
plot([0,0],[0,s1length2],'--r')
plot([5,5],[0,s1length2],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('S1 Single Cell Tuning to Social Touch')

%Sort each striatal neuron relative to time of stimulus onset (early
%neurons first)

for n = 1:length(striatalmean2)
    sortstriatalmean2(n,:) = normstriatalmean2(n,:);
    sortstriatalmean2(n,:) = sort(sortstriatalmean2(n,:));
end

normstriatalmeansw2 = normstriatalmean2';

[~,Indexofmax] = max(normstriatalmeansw2,[],2);

[minum, indx] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex2 = indx(i);
    newmeanstriatalsortedcells2(i,:) = normstriatalmeansw2(newindex2,:);
end

striatallength2 = length(striatalmean2);
figure(15);
imagesc(-2.5:binsize:7.5,[1:striatallength2],newmeanstriatalsortedcells2);
hold on
plot([0,0],[0,striatallength2],'--r')
plot([5,5],[0,striatallength2],'--r')
ylabel('Cell #')
xlabel('time (s)')
c = colorbar;
c.Label.String = 'Normalized firing rate';
title('Striatal Single Cell Tuning to Social Touch')


%% Plot the normalized and raw firing rates
BLAmax2 = max(allblamean2);
BLAround2 = ceil(BLAmax2);

normS1max2 = max(avgnormS12);
normS1round2 = ceil(normS1max2);

%plot firing rate for BLA
figure(16);
plot(-2.5:binsize:7.5,allblamean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
hold on
plot([0,0],[0,BLAround2],'--r')
plot([5,5],[0,BLAround2],'--r')
xlim([-2.5 7.5])
title('Raw Average Firing Rate of BLA Cells to Social Touch')


%plot firing rate of S1

S1max2 = max(alls1mean2);
S1round2 = ceil(S1max2);

figure(17);
plot(-2.5:binsize:7.5,alls1mean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
ylim([0,S1round2])
hold on
plot([0,0],[0,S1round2],'--r')
plot([5,5],[0,S1round2],'--r')
title('Raw Average Firing Rate of S1 Cells to Social Touch')


% plot average firing rate of striatum

striatalmax2 = max(allstriatalmean2);
striatalround2 = ceil(striatalmax2);

figure(18);
plot(-2.5:binsize:7.5,allstriatalmean2,'color','K')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
ylim([0,striatalround2])
hold on
plot([0,0],[0,striatalround2],'--r')
plot([5,5],[0,striatalround2],'--r')
title('Raw Average Firing Rate of Striatal Cells to Social Touch')

%plot firing rate of both BLA and S1 and striatum
figure(19);
subplot(3,1,1)
plot(-2.5:binsize:7.5,alls1mean2,'color','K')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
xlim([-2.5 7.5])
ylabel('Spikes per second')
title('S1')
subplot(3,1,2)
plot(-2.5:binsize:7.5,allstriatalmean2,'color','G')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlim([-2.5 7.5])
title('Striatum')
subplot(3,1,3)
plot(-2.5:binsize:7.5,allblamean2,'color','B')
hold on
plot([0,0],[0,10],'--r')
plot([5,5],[0,10],'--r')
% plot(-0.5:binsize:1.5,mm+ss,'linewidth',0.5,'color',[0.5,0.5,0.5])
ylabel('Spikes per second')
xlabel('time (s)')
xlim([-2.5 7.5])
title('BLA')
sgtitle('Average Firing Rate of Cells to Social Touch')

%% save plots 
mkdir S1BLASpikes&FiringRates
cd S1BLASpikes&FiringRates

% for k = 6:19
%     saveas(figure(k),sprintf('figure_%d.jpg',k))
% end

%%
mkdir S1BLASpikes&FiringRates
cd S1BLASpikes&FiringRates
touchcond = string(touchcond);
touchfile = append('concatvariables', touchcond);
save(touchfile, "spks", "wrongcells", "trialspks", "touchcond", "stimonsets","uclu","S1depths","striataldepths","bladepths","clusterdepth","clustergroup", "s1mean","blamean","striatalmean")

if existtrialspks2 == 1
touchcond2 = string(touchcond2);
touchfile2 = append('concatvariables', touchcond2);
save(touchfile2, "spks", "wrongcells","trialspks2", "touchcond2", "stimonsets","uclu","S1depths","striataldepths","bladepths","clusterdepth","clustergroup", "s1mean2","blamean2","striatalmean2")
end
%% save plots for fast-spiking cells

for k = 6:12
    saveas(figure(k),sprintf('figure_%d.jpg', k))
end

%% save plots for regular-spiking cells
mkdir S1BLASpikes&FiringRates
cd S1BLASpikes&FiringRates

mkdir regularspikes&firingrates
cd regularspikes&firingrates

for k = 6:12
    saveas(figure(k),sprintf('figure_%d.jpg', k))
end
