%%
clear

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
% n = [16:21,23:27,30:35,38:43];


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

for aa = 1:length(n)
DLCload = load(files(7).name);
fns = fieldnames(DLCload);
DLCload = rmfield(DLCload,(fns{7}));
fns = fieldnames(DLCload);
dlcdata = DLCload.(fns{n(aa)});
VOLOBJframes = frameonsets_(endofsession(4)+1:endofsession(5));
VOLOBJframesre = VOLOBJframes(1:2:end);
VOLOBJframesnew = VOLOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDVOLOBJ = 6*std(dlcdata);
badframes = find(dlcdata>STDVOLOBJ);
dlcdata(badframes) = nan;
hold on; plot(dlcdata);
badbouts = [];

% badbouts = ginput;

[filteredzscore,filtereddata, zscore, dlcdata] = filtvideotouchDLCMOTTC(dlcdata,types(1),VOLOBJfirstskip,VOLOBJsecondskip, badbouts);
VOLOBJdlc = filteredzscore;
VOLOBJdlcraw = filtereddata;

VOLOBJDLCALL.RAW.(fns{n(aa)}) = VOLOBJdlcraw;
VOLOBJDLCALL.ZSCORE.(fns{n(aa)}) = VOLOBJdlc;

smoothdlc = smoothdata(VOLOBJdlc,'movmean',12);

totalstimtime = 9;
for t = 1:length(stimonsets)/4
A = repmat(VOLOBJframesnew,[1 length(stimonsets(t))]);
prestim = stimonsets(t)-2;
poststim = stimonsets(t)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
dlcperstim = VOLOBJdlc(closestValuepre(t):closestValuepost(t));
dlctrialVOLOBJ(t,:) = dlcperstim(1:totalstimtime*60);
dlcperstimraw = VOLOBJdlcraw(closestValuepre(t):closestValuepost(t));
dlctrialVOLOBJraw(t,:) = dlcperstimraw(1:totalstimtime*60);

VOLOBJDLCALL.TRIALRAW.(fns{n(aa)}) = dlctrialVOLOBJraw;
VOLOBJDLCALL.TRIALZSCORE.(fns{n(aa)}) = dlctrialVOLOBJ;
end
end

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

for aa = 1:length(n)
DLCload = load(files(5).name);
fns = fieldnames(DLCload);
DLCload = rmfield(DLCload,(fns{7}));
fns = fieldnames(DLCload);
dlcdata = DLCload.(fns{n(aa)});
VOLMOframes = frameonsets_(endofsession(5)+1:endofsession(6));
VOLMOframesre = VOLMOframes(1:2:end);
VOLMOframesnew = VOLMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDVOLMO = 6*std(dlcdata);
badframes = find(dlcdata>STDVOLMO);
dlcdata(badframes) = nan;
hold on; plot(dlcdata);
badbouts = [];

% badbouts = ginput;

[filteredzscore,filtereddata, zscore, dlcdata] = filtvideotouchDLCMOTTC(dlcdata,types(1),VOLMOfirstskip,VOLMOsecondskip, badbouts);
VOLMOdlc = filteredzscore;
VOLMOdlcraw = filtereddata;

VOLMODLCALL.RAW.(fns{n(aa)}) = VOLMOdlcraw;
VOLMODLCALL.ZSCORE.(fns{n(aa)}) = VOLMOdlc;

smoothdlc = smoothdata(VOLMOdlc,'movmean',12);

totalstimtime = 9;
for t = 1:length(stimonsets)/4
A = repmat(VOLMOframesnew,[1 length(stimonsets(t+40))]);
prestim = stimonsets(t+40)-2;
poststim = stimonsets(t+40)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
dlcperstim = VOLMOdlc(closestValuepre(t):closestValuepost(t));
dlctrialVOLMO(t,:) = dlcperstim(1:totalstimtime*60);
dlcperstimraw = VOLMOdlcraw(closestValuepre(t):closestValuepost(t));
dlctrialVOLMOraw(t,:) = dlcperstimraw(1:totalstimtime*60);

VOLMODLCALL.TRIALRAW.(fns{n(aa)}) = dlctrialVOLMOraw;
VOLMODLCALL.TRIALZSCORE.(fns{n(aa)}) = dlctrialVOLMO;
end
end


%%
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

for aa = 1:length(n)
DLCload = load(files(3).name);
fns = fieldnames(DLCload);
DLCload = rmfield(DLCload,(fns{7}));
fns = fieldnames(DLCload);
dlcdata = DLCload.(fns{n(aa)});
FORCOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
FORCOBJframesre = FORCOBJframes(1:2:end);
FORCOBJframesnew = FORCOBJframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDFORCOBJ = 6*std(dlcdata);
badframes = find(dlcdata>STDFORCOBJ);
dlcdata(badframes) = nan;
hold on; plot(dlcdata);
badbouts = [];

% badbouts = ginput;

[filteredzscore,filtereddata, zscore, dlcdata] = filtvideotouchDLCMOTTC(dlcdata,types(1),FORCOBJfirstskip,FORCOBJsecondskip, badbouts);
FORCOBJdlc = filteredzscore;
FORCOBJdlcraw = filtereddata;

FORCOBJDLCALL.RAW.(fns{n(aa)}) = FORCOBJdlcraw;
FORCOBJDLCALL.ZSCORE.(fns{n(aa)}) = FORCOBJdlc;

smoothdlc = smoothdata(FORCOBJdlc,'movmean',12);

totalstimtime = 9;
for t = 1:length(stimonsets)/4
A = repmat(FORCOBJframesnew,[1 length(stimonsets(t+80))]);
prestim = stimonsets(t+80)-2;
poststim = stimonsets(t+80)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
dlcperstim = FORCOBJdlc(closestValuepre(t):closestValuepost(t));
dlctrialFORCOBJ(t,:) = dlcperstim(1:totalstimtime*60);
dlcperstimraw = FORCOBJdlcraw(closestValuepre(t):closestValuepost(t));
dlctrialFORCOBJraw(t,:) = dlcperstimraw(1:totalstimtime*60);

FORCOBJDLCALL.TRIALRAW.(fns{n(aa)}) = dlctrialFORCOBJraw;
FORCOBJDLCALL.TRIALZSCORE.(fns{n(aa)}) = dlctrialFORCOBJ;
end
end

close all

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

for aa = 1:length(n)
DLCload = load(files(1).name);
fns = fieldnames(DLCload);
DLCload = rmfield(DLCload,(fns{7}));
fns = fieldnames(DLCload);
% DLCload = rmfield(DLCload,(fns{7}));
% fns = fieldnames(DLCload);
dlcdata = DLCload.(fns{n(aa)});
FORCMOframes = frameonsets_(endofsession(2)+1:endofsession(3));
FORCMOframesre = FORCMOframes(1:2:end);
FORCMOframesnew = FORCMOframesre(1:length(dlcdata));
figure; plot(dlcdata)
STDFORCMO = 6*std(dlcdata);
badframes = find(dlcdata>STDFORCMO);
dlcdata(badframes) = nan;
hold on; plot(dlcdata);
badbouts = [];

% badbouts = ginput;

[filteredzscore,filtereddata, zscore, dlcdata] = filtvideotouchDLCMOTTC(dlcdata,types(1),FORCMOfirstskip,FORCMOsecondskip, badbouts);
FORCMOdlc = filteredzscore;
FORCMOdlcraw = filtereddata;

FORCMODLCALL.RAW.(fns{n(aa)}) = FORCMOdlcraw;
FORCMODLCALL.ZSCORE.(fns{n(aa)}) = FORCMOdlc;

smoothdlc = smoothdata(FORCMOdlc,'movmean',12);

totalstimtime = 9;
for t = 1:length(stimonsets)/4
A = repmat(FORCMOframesnew,[1 length(stimonsets(t+120))]);
prestim = stimonsets(t+120)-2;
poststim = stimonsets(t+120)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
dlcperstim = FORCMOdlc(closestValuepre(t):closestValuepost(t));
dlctrialFORCMO(t,:) = dlcperstim(1:totalstimtime*60);
dlcperstimraw = FORCMOdlcraw(closestValuepre(t):closestValuepost(t));
dlctrialFORCMOraw(t,:) = dlcperstimraw(1:totalstimtime*60);

FORCMODLCALL.TRIALRAW.(fns{n(aa)}) = dlctrialFORCMOraw;
FORCMODLCALL.TRIALZSCORE.(fns{n(aa)}) = dlctrialFORCMO;
end
end

close all

%%

DLCALLVariables.VOLOBJDLCALL = VOLOBJDLCALL;
DLCALLVariables.VOLMODLCALL = VOLMODLCALL;

DLCALLVariables.FORCOBJDLCALL = FORCOBJDLCALL;
DLCALLVariables.FORCMODLCALL = FORCMODLCALL;


%%
FileName = strcat(apbin, "DLCALLMotionVariables", ".mat");

save(FileName, "DLCALLVariables")


