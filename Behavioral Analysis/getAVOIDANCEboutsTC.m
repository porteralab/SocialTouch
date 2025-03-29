clear
close all
load("frames", "frameonsets_", "apbin");
load("newstimonsets.mat", 'stimonsets')
cd AllBehaviorFiles
%%
files = dir('*cam3*');
endofsession = find(diff(frameonsets_)>3);
endofsession(length(endofsession)+1) = length(frameonsets_);
close all
types = ["volobj", "volmo", "forcobj", "forcmo"];


%%
files = dir('*cam1*');
% endofsession = find(diff(frameonsets_)>3);

%%
disp(types(3))
    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
    %behavior is being interfered with (ie. grooming)
    firstskip = 'first frame to skip';
    secondskip = 'second frame to skip';
    disp('which frames to omit')
    a = input("do you want to input frames");
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    newfirstskip = [];
    newsecondskip = [];
    z = 1;
    if a == 1
    while(1)
        j = input(firstskip);
        k = input(secondskip);
        newfirstskip(z) = j;
        newsecondskip(z) = k;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        z = z+1;
        if m=='N'
            break
        end
    end
    end

FORCOBJfirstskip = newfirstskip;
FORCOBJsecondskip = newsecondskip;


%%
DLCload = load(files(5).name);
dlcdata = DLCload.EyeAreaframesh;
FORCOBJframes = frameonsets_(endofsession(4)+1:endofsession(5));
FORCOBJframesre = FORCOBJframes;
FORCOBJframesnew = FORCOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 2.5*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(FORCOBJfirstskip)
dlcdata(FORCOBJfirstskip(n)*120:FORCOBJsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([2000 6000])
badbouts = [];

%%
badbouts = ginput;
eyebouts = badbouts(:,1);
STARTbout = eyebouts(1:2:end);
ENDbout = eyebouts(2:2:end);

clear eyeonsets
clear eyeend
for t = 1:length(STARTbout)
A = repmat(FORCOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
eyeonsets(t) = FORCOBJframesnew(prestim);
eyeend(t) = FORCOBJframesnew(poststim);
end

FORCOBJONSETS = eyeonsets;
FORCOBJEND = eyeend;

%%
disp(types(4))
    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
    %behavior is being interfered with (ie. grooming)
    firstskip = 'first frame to skip';
    secondskip = 'second frame to skip';
    disp('which frames to omit')
    a = input("do you want to input frames");
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    newfirstskip = [];
    newsecondskip = [];
    z = 1;
    if a == 1
    while(1)
        j = input(firstskip);
        k = input(secondskip);
        newfirstskip(z) = j;
        newsecondskip(z) = k;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        z = z+1;
        if m=='N'
            break
        end
    end
    end

FORCMOfirstskip = newfirstskip;
FORCMOsecondskip = newsecondskip;


%%
DLCload = load(files(1).name);
dlcdata = DLCload.EyeAreaframesh;
FORCMOframes = frameonsets_(endofsession(2)+1:endofsession(3));
FORCMOframesre = FORCMOframes;
FORCMOframesnew = FORCMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 2*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(FORCMOfirstskip)
dlcdata(FORCMOfirstskip(n)*120:FORCMOsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([2000 6000])
badbouts = [];

%%
badbouts = ginput;
eyebouts = badbouts(:,1);
STARTbout = eyebouts(1:2:end);
ENDbout = eyebouts(2:2:end);

%%
clear eyeonsets
clear eyeend
for t = 1:length(STARTbout)
A = repmat(FORCMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
eyeonsets(t) = FORCMOframesnew(prestim);
eyeend(t) = FORCMOframesnew(poststim);
end

FORCMOONSETS = eyeonsets;
FORCMOEND = eyeend;

%
%
%
%%

disp(types(1))
    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
    %behavior is being interfered with (ie. grooming)
    firstskip = 'first frame to skip';
    secondskip = 'second frame to skip';
    disp('which frames to omit')
    a = input("do you want to input frames");
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    newfirstskip = [];
    newsecondskip = [];
    z = 1;
    if a == 1
    while(1)
        j = input(firstskip);
        k = input(secondskip);
        newfirstskip(z) = j;
        newsecondskip(z) = k;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        z = z+1;
        if m=='N'
            break
        end
    end
    end

VOLOBJfirstskip = newfirstskip;
VOLOBJsecondskip = newsecondskip;


%%
DLCload = load(files(3).name);
dlcdata = DLCload.EyeAreaframesh;
VOLOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
VOLOBJframesre = VOLOBJframes;
VOLOBJframesnew = VOLOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 3*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(VOLOBJfirstskip)
dlcdata(VOLOBJfirstskip(n)*120:VOLOBJsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([2000 6000])
badbouts = [];

%%
badbouts = ginput;
eyebouts = badbouts(:,1);
STARTbout = eyebouts(1:2:end);
ENDbout = eyebouts(2:2:end);

%%
clear eyeonsets
clear eyeend
for t = 1:length(STARTbout)
A = repmat(VOLOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
eyeonsets(t) = VOLOBJframesnew(prestim);
eyeend(t) = VOLOBJframesnew(poststim);
end

VOLOBJONSETS = eyeonsets;
VOLOBJEND = eyeend;

%%
disp(types(2))
    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
    %behavior is being interfered with (ie. grooming)
    firstskip = 'first frame to skip';
    secondskip = 'second frame to skip';
    disp('which frames to omit')
    a = input("do you want to input frames");
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    newfirstskip = [];
    newsecondskip = [];
    z = 1;
    if a == 1
    while(1)
        j = input(firstskip);
        k = input(secondskip);
        newfirstskip(z) = j;
        newsecondskip(z) = k;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        z = z+1;
        if m=='N'
            break
        end
    end
    end

VOLMOfirstskip = newfirstskip;
VOLMOsecondskip = newsecondskip;


%%
DLCload = load(files(7).name);
dlcdata = DLCload.EyeAreaframesh;
VOLMOframes = frameonsets_(endofsession(5)+1:endofsession(6));
VOLMOframesre = VOLMOframes;
VOLMOframesnew = VOLMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 3*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(VOLMOfirstskip)
dlcdata(VOLMOfirstskip(n)*120:VOLMOsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([2000 6000])
badbouts = [];

%%
badbouts = ginput;
eyebouts = badbouts(:,1);
STARTbout = eyebouts(1:2:end);
ENDbout = eyebouts(2:2:end);

%%
clear eyeonsets
clear eyeend
for t = 1:length(STARTbout)
A = repmat(VOLMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
eyeonsets(t) = VOLMOframesnew(prestim);
eyeend(t) = VOLMOframesnew(poststim);
end

VOLMOONSETS = eyeonsets;
VOLMOEND = eyeend;


%%

DLCBOUTS.EYEAREA.VOLMO.VOLMOONSETS = VOLMOONSETS;
DLCBOUTS.EYEAREA.VOLMO.VOLMOEND = VOLMOEND;

DLCBOUTS.EYEAREA.VOLOBJ.VOLOBJONSETS = VOLOBJONSETS;
DLCBOUTS.EYEAREA.VOLOBJ.VOLOBJEND = VOLOBJEND;


DLCBOUTS.EYEAREA.FORCMO.FORCMOONSETS = FORCMOONSETS;
DLCBOUTS.EYEAREA.FORCMO.FORCMOEND = FORCMOEND;

DLCBOUTS.EYEAREA.FORCOBJ.FORCOBJONSETS = FORCOBJONSETS;
DLCBOUTS.EYEAREA.FORCOBJ.FORCOBJEND = FORCOBJEND;

FileName = strcat(apbin, "DLCALLAVERSIONBOUTS", ".mat");

save(FileName, "DLCBOUTS")


%
%
%
%
%
%
%%

%% AVOIDANCE RUNNING 


files = dir('*cam2*');
% endofsession = find(diff(frameonsets_)>3);


%%

DLCload = load(files(3).name);
dlcdata = DLCload.newrundata;
FORCOBJframes = frameonsets_(endofsession(4)+1:endofsession(5));
FORCOBJframesre = FORCOBJframes;
FORCOBJframesnew = FORCOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allavoidperiods = find(dlcdata == 3 | dlcdata == 4 | dlcdata == 5);
avoidbouts = find(diff(allavoidperiods) > 120);
STARTbout(1) = allavoidperiods(1);
ENDbout(1) = allavoidperiods(avoidbouts(1));

for a = 2:length(avoidbouts)
    STARTbout(a) = allavoidperiods(avoidbouts(a-1)+1);
    ENDbout(a) = allavoidperiods(avoidbouts(a));
end

clear avoidonsets
clear avoidend
for t = 1:length(STARTbout)
A = repmat(FORCOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
avoidonsets(t) = FORCOBJframesnew(prestim);
avoidend(t) = FORCOBJframesnew(poststim);
end

FORCOBJAVOIDONSETS = avoidonsets;
FORCOBJAVOIDEND = avoidend;


%
clear STARTbout
clear ENDbout

allforwardperiods = find(dlcdata == 2);
forwardbouts = find(diff(allforwardperiods) > 120);
STARTbout(1) = allforwardperiods(1);
ENDbout(1) = allforwardperiods(forwardbouts(1));

for a = 2:length(forwardbouts)
    STARTbout(a) = allforwardperiods(forwardbouts(a-1)+1);
    ENDbout(a) = allforwardperiods(forwardbouts(a));
end

clear forwardonsets
clear forwardend
for t = 1:length(STARTbout)
A = repmat(FORCOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
forwardonsets(t) = FORCOBJframesnew(prestim);
forwardend(t) = FORCOBJframesnew(poststim);
end

FORCOBJFORWARDONSETS = forwardonsets;
FORCOBJFORWARDEND = forwardend;

%%
%%

DLCload = load(files(1).name);
dlcdata = DLCload.newrundata;
FORCMOframes = frameonsets_(endofsession(2)+1:endofsession(3));
FORCMOframesre = FORCMOframes;
FORCMOframesnew = FORCMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allavoidperiods = find(dlcdata == 3 | dlcdata == 4 | dlcdata == 5);
avoidbouts = find(diff(allavoidperiods) > 120);
STARTbout(1) = allavoidperiods(1);
ENDbout(1) = allavoidperiods(avoidbouts(1));

for a = 2:length(avoidbouts)
    STARTbout(a) = allavoidperiods(avoidbouts(a-1)+1);
    ENDbout(a) = allavoidperiods(avoidbouts(a));
end

clear avoidonsets
clear avoidend
for t = 1:length(STARTbout)
A = repmat(FORCMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
avoidonsets(t) = FORCMOframesnew(prestim);
avoidend(t) = FORCMOframesnew(poststim);
end

FORCMOAVOIDONSETS = avoidonsets;
FORCMOAVOIDEND = avoidend;


%
clear STARTbout
clear ENDbout

allforwardperiods = find(dlcdata == 2);
forwardbouts = find(diff(allforwardperiods) > 120);
STARTbout(1) = allforwardperiods(1);
ENDbout(1) = allforwardperiods(forwardbouts(1));

for a = 2:length(forwardbouts)
    STARTbout(a) = allforwardperiods(forwardbouts(a-1)+1);
    ENDbout(a) = allforwardperiods(forwardbouts(a));
end

clear forwardonsets
clear forwardend
for t = 1:length(STARTbout)
A = repmat(FORCMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
forwardonsets(t) = FORCMOframesnew(prestim);
forwardend(t) = FORCMOframesnew(poststim);
end

FORCMOFORWARDONSETS = forwardonsets;
FORCMOFORWARDEND = forwardend;

%%
DLCload = load(files(2).name);
dlcdata = DLCload.newrundata;
VOLOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
VOLOBJframesre = VOLOBJframes;
VOLOBJframesnew = VOLOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allavoidperiods = find(dlcdata == 3 | dlcdata == 4 | dlcdata == 5);
avoidbouts = find(diff(allavoidperiods) > 120);
STARTbout(1) = allavoidperiods(1);
ENDbout(1) = allavoidperiods(avoidbouts(1));

for a = 2:length(avoidbouts)
    STARTbout(a) = allavoidperiods(avoidbouts(a-1)+1);
    ENDbout(a) = allavoidperiods(avoidbouts(a));
end

clear avoidonsets
clear avoidend
for t = 1:length(STARTbout)
A = repmat(VOLOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
avoidonsets(t) = VOLOBJframesnew(prestim);
avoidend(t) = VOLOBJframesnew(poststim);
end

VOLOBJAVOIDONSETS = avoidonsets;
VOLOBJAVOIDEND = avoidend;


%
clear STARTbout
clear ENDbout

allforwardperiods = find(dlcdata == 2);
forwardbouts = find(diff(allforwardperiods) > 120);
STARTbout(1) = allforwardperiods(1);
ENDbout(1) = allforwardperiods(forwardbouts(1));

for a = 2:length(forwardbouts)
    STARTbout(a) = allforwardperiods(forwardbouts(a-1)+1);
    ENDbout(a) = allforwardperiods(forwardbouts(a));
end

clear forwardonsets
clear forwardend
for t = 1:length(STARTbout)
A = repmat(VOLOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
forwardonsets(t) = VOLOBJframesnew(prestim);
forwardend(t) = VOLOBJframesnew(poststim);
end

VOLOBJFORWARDONSETS = forwardonsets;
VOLOBJFORWARDEND = forwardend;

%%
%%

DLCload = load(files(4).name);
dlcdata = DLCload.newrundata;
VOLMOframes = frameonsets_(endofsession(5)+1:endofsession(6));
VOLMOframesre = VOLMOframes;
VOLMOframesnew = VOLMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allavoidperiods = find(dlcdata == 3 | dlcdata == 4 | dlcdata == 5);
avoidbouts = find(diff(allavoidperiods) > 120);

STARTbout(1) = allavoidperiods(1);
ENDbout(1) = allavoidperiods(avoidbouts(1));

if isempty(avoidbouts) == 0
for a = 2:length(avoidbouts)
    STARTbout(a) = allavoidperiods(avoidbouts(a-1)+1);
    ENDbout(a) = allavoidperiods(avoidbouts(a));
end

clear avoidonsets
clear avoidend
for t = 1:length(STARTbout)
A = repmat(VOLMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
avoidonsets(t) = VOLMOframesnew(prestim);
avoidend(t) = VOLMOframesnew(poststim);
end

VOLMOAVOIDONSETS = avoidonsets;
VOLMOAVOIDEND = avoidend;

else
end
%
clear STARTbout
clear ENDbout

allforwardperiods = find(dlcdata == 2);
forwardbouts = find(diff(allforwardperiods) > 120);
STARTbout(1) = allforwardperiods(1);
ENDbout(1) = allforwardperiods(forwardbouts(1));

for a = 2:length(forwardbouts)
    STARTbout(a) = allforwardperiods(forwardbouts(a-1)+1);
    ENDbout(a) = allforwardperiods(forwardbouts(a));
end

clear forwardonsets
clear forwardend
for t = 1:length(STARTbout)
A = repmat(VOLMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
forwardonsets(t) = VOLMOframesnew(prestim);
forwardend(t) = VOLMOframesnew(poststim);
end

VOLMOFORWARDONSETS = forwardonsets;
VOLMOFORWARDEND = forwardend;

%%

DLCBOUTS.RUNAVOID.VOLMO.VOLMOAVOIDONSETS = VOLMOAVOIDONSETS;
DLCBOUTS.RUNAVOID.VOLMO.VOLMOAVOIDEND = VOLMOAVOIDEND;

DLCBOUTS.RUNAVOID.VOLOBJ.VOLOBJAVOIDONSETS = VOLOBJAVOIDONSETS;
DLCBOUTS.RUNAVOID.VOLOBJ.VOLOBJAVOIDEND = VOLOBJAVOIDEND;


DLCBOUTS.RUNAVOID.FORCMO.FORCMOAVOIDONSETS = FORCMOAVOIDONSETS;
DLCBOUTS.RUNAVOID.FORCMO.FORCMOAVOIDEND = FORCMOAVOIDEND;

DLCBOUTS.RUNAVOID.FORCOBJ.FORCOBJAVOIDONSETS = FORCOBJAVOIDONSETS;
DLCBOUTS.RUNAVOID.FORCOBJ.FORCOBJAVOIDEND = FORCOBJAVOIDEND;

DLCBOUTS.RUNFORWARD.VOLMO.VOLMOFORWARDONSETS = VOLMOFORWARDONSETS;
DLCBOUTS.RUNFORWARD.VOLMO.VOLMOFORWARDEND = VOLMOFORWARDEND;

DLCBOUTS.RUNFORWARD.VOLOBJ.VOLOBJFORWARDONSETS = VOLOBJFORWARDONSETS;
DLCBOUTS.RUNFORWARD.VOLOBJ.VOLOBJFORWARDEND = VOLOBJFORWARDEND;


DLCBOUTS.RUNFORWARD.FORCMO.FORCMOFORWARDONSETS = FORCMOFORWARDONSETS;
DLCBOUTS.RUNFORWARD.FORCMO.FORCMOFORWARDEND = FORCMOFORWARDEND;

DLCBOUTS.RUNFORWARD.FORCOBJ.FORCOBJFORWARDONSETS = FORCOBJFORWARDONSETS;
DLCBOUTS.RUNFORWARD.FORCOBJ.FORCOBJFORWARDEND = FORCOBJFORWARDEND;

FileName = strcat(apbin, "DLCALLAVERSIONBOUTS", ".mat");

save(FileName, "DLCBOUTS")


%% WHISKPROTRACTION


files = dir('*cam2*');
% endofsession = find(diff(frameonsets_)>3);


%%

DLCload = load(files(3).name);
dlcdata = DLCload.newwhiskdata;
FORCOBJframes = frameonsets_(endofsession(4)+1:endofsession(5));
FORCOBJframesre = FORCOBJframes;
FORCOBJframesnew = FORCOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allwhiskproperiods = find(dlcdata == 1);
whiskprobouts = find(diff(allwhiskproperiods) > 120);
STARTbout(1) = allwhiskproperiods(1);
ENDbout(1) = allwhiskproperiods(whiskprobouts(1));

for a = 2:length(whiskprobouts)
    STARTbout(a) = allwhiskproperiods(whiskprobouts(a-1)+1);
    ENDbout(a) = allwhiskproperiods(whiskprobouts(a));
end

clear whiskproonsets
clear whiskproend
for t = 1:length(STARTbout)
A = repmat(FORCOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
whiskproonsets(t) = FORCOBJframesnew(prestim);
whiskproend(t) = FORCOBJframesnew(poststim);
end

FORCOBJWHISKPROONSETS = whiskproonsets;
FORCOBJWHISKPROEND = whiskproend;


%
clear STARTbout
clear ENDbout



%%
%%

DLCload = load(files(1).name);
dlcdata = DLCload.newwhiskdata;
FORCMOframes = frameonsets_(endofsession(2)+1:endofsession(3));
FORCMOframesre = FORCMOframes;
FORCMOframesnew = FORCMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allwhiskproperiods = find(dlcdata == 1);
whiskprobouts = find(diff(allwhiskproperiods) > 120);
STARTbout(1) = allwhiskproperiods(1);
ENDbout(1) = allwhiskproperiods(whiskprobouts(1));

for a = 2:length(whiskprobouts)
    STARTbout(a) = allwhiskproperiods(whiskprobouts(a-1)+1);
    ENDbout(a) = allwhiskproperiods(whiskprobouts(a));
end

clear whiskproonsets
clear whiskproend
for t = 1:length(STARTbout)
A = repmat(FORCMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
whiskproonsets(t) = FORCMOframesnew(prestim);
whiskproend(t) = FORCMOframesnew(poststim);
end

FORCMOWHISKPROONSETS = whiskproonsets;
FORCMOWHISKPROEND = whiskproend;


%
clear STARTbout
clear ENDbout



%%
DLCload = load(files(2).name);
dlcdata = DLCload.newwhiskdata;
VOLOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
VOLOBJframesre = VOLOBJframes;
VOLOBJframesnew = VOLOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allwhiskproperiods = find(dlcdata == 1);
whiskprobouts = find(diff(allwhiskproperiods) > 120);
STARTbout(1) = allwhiskproperiods(1);
ENDbout(1) = allwhiskproperiods(whiskprobouts(1));

for a = 2:length(whiskprobouts)
    STARTbout(a) = allwhiskproperiods(whiskprobouts(a-1)+1);
    ENDbout(a) = allwhiskproperiods(whiskprobouts(a));
end

clear whiskproonsets
clear whiskproend
for t = 1:length(STARTbout)
A = repmat(VOLOBJframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
whiskproonsets(t) = VOLOBJframesnew(prestim);
whiskproend(t) = VOLOBJframesnew(poststim);
end

VOLOBJWHISKPROONSETS = whiskproonsets;
VOLOBJWHISKPROEND = whiskproend;


%
clear STARTbout
clear ENDbout



%%
%%

DLCload = load(files(4).name);
dlcdata = DLCload.newwhiskdata;
VOLMOframes = frameonsets_(endofsession(5)+1:endofsession(6));
VOLMOframesre = VOLMOframes;
VOLMOframesnew = VOLMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
badbouts = [];

%%
clear STARTbout
clear ENDbout
allwhiskproperiods = find(dlcdata == 1);
whiskprobouts = find(diff(allwhiskproperiods) > 120);
STARTbout(1) = allwhiskproperiods(1);
ENDbout(1) = allwhiskproperiods(whiskprobouts(1));

for a = 2:length(whiskprobouts)
    STARTbout(a) = allwhiskproperiods(whiskprobouts(a-1)+1);
    ENDbout(a) = allwhiskproperiods(whiskprobouts(a));
end

clear whiskproonsets
clear whiskproend
for t = 1:length(STARTbout)
A = repmat(VOLMOframesnew,[1 length(STARTbout(t))]);
prestim = round(STARTbout(t));
poststim = round(ENDbout(t));
% [minValue,closestIndex] = min(abs(A-prestim));
% closestValuepre(t) = closestIndex;
% [minValue,closestIndex] = min(abs(A-poststim));
% closestValuepost(t) = closestIndex;
whiskproonsets(t) = VOLMOframesnew(prestim);
whiskproend(t) = VOLMOframesnew(poststim);
end

VOLMOWHISKPROONSETS = whiskproonsets;
VOLMOWHISKPROEND = whiskproend;


%
clear STARTbout
clear ENDbout



%%

DLCBOUTS.WHISKPRO.VOLMO.VOLMOWHISKPROONSETS = VOLMOWHISKPROONSETS;
DLCBOUTS.WHISKPRO.VOLMO.VOLMOWHISKPROEND = VOLMOWHISKPROEND;

DLCBOUTS.WHISKPRO.VOLOBJ.VOLOBJWHISKPROONSETS = VOLOBJWHISKPROONSETS;
DLCBOUTS.WHISKPRO.VOLOBJ.VOLOBJWHISKPROEND = VOLOBJWHISKPROEND;


DLCBOUTS.WHISKPRO.FORCMO.FORCMOWHISKPROONSETS = FORCMOWHISKPROONSETS;
DLCBOUTS.WHISKPRO.FORCMO.FORCMOWHISKPROEND = FORCMOWHISKPROEND;

DLCBOUTS.WHISKPRO.FORCOBJ.FORCOBJWHISKPROONSETS = FORCOBJWHISKPROONSETS;
DLCBOUTS.WHISKPRO.FORCOBJ.FORCOBJWHISKPROEND = FORCOBJWHISKPROEND;

FileName = strcat(apbin, "DLCALLAVERSIONBOUTS", ".mat");

save(FileName, "DLCBOUTS")