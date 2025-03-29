

%%

clear
close all
load("frames", "frameonsets_", "apbin");
load("newstimonsets.mat", 'stimonsets')
cd AllBehaviorFiles

%%
FileName = strcat(apbin, "DLCALLAVERSIONBOUTS", ".mat");

load(FileName, "DLCBOUTS")
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
DLCload = load(files(3).name);
dlcdata = DLCload.pupilSaccadesframesh;
FORCOBJframes = frameonsets_(endofsession(4)+1:endofsession(5));
FORCOBJframesre = FORCOBJframes;
FORCOBJframesnew = FORCOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 1*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(FORCOBJfirstskip)
dlcdata(FORCOBJfirstskip(n)*120:FORCOBJsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([370 390])
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
dlcdata = DLCload.pupilSaccadesframesh;
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
dlcdata = DLCload.pupilSaccadesframesh;
VOLOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
VOLOBJframesre = VOLOBJframes;
VOLOBJframesnew = VOLOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 2.5*std(dlcdata);
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
DLCload = load(files(5).name);
dlcdata = DLCload.pupilSaccadesframesh;
VOLMOframes = frameonsets_(endofsession(5)+1:endofsession(6));
VOLMOframesre = VOLMOframes;
VOLMOframesnew = VOLMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDTOUCHTYPE = 4*std(dlcdata);
MEANSTDTOUCHTYPE = nanmean(dlcdata);
badframes = find(dlcdata> MEANSTDTOUCHTYPE + STDTOUCHTYPE | dlcdata< MEANSTDTOUCHTYPE - STDTOUCHTYPE);
dlcdata(badframes) = nan;
for n = 1:length(VOLMOfirstskip)
dlcdata(VOLMOfirstskip(n)*120:VOLMOsecondskip(n)*120) = nan;
end
hold on; plot(dlcdata);
figure; plot(dlcdata);
ylim([360 390])
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

DLCBOUTS.SACCADES.VOLMO.VOLMOONSETS = VOLMOONSETS;
DLCBOUTS.SACCADES.VOLMO.VOLMOEND = VOLMOEND;

DLCBOUTS.SACCADES.VOLOBJ.VOLOBJONSETS = VOLOBJONSETS;
DLCBOUTS.SACCADES.VOLOBJ.VOLOBJEND = VOLOBJEND;


DLCBOUTS.SACCADES.FORCMO.FORCMOONSETS = FORCMOONSETS;
DLCBOUTS.SACCADES.FORCMO.FORCMOEND = FORCMOEND;

DLCBOUTS.SACCADES.FORCOBJ.FORCOBJONSETS = FORCOBJONSETS;
DLCBOUTS.SACCADES.FORCOBJ.FORCOBJEND = FORCOBJEND;

FileName = strcat(apbin, "DLCALLAVERSIONBOUTS", ".mat");

save(FileName, "DLCBOUTS")