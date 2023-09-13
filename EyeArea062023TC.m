%Code written to Calculate Area within the Mouse's Eye as a Feature of
%Aversion

%First read the DeepLabCut excel  files to extract the X and Y coordinates of
%each point around the eye

%Extract X coordinates for all points
% close all
% clear

clear all
close all
clc

%finds the folder of interest
rd_dir = 'F:\\Trish\\Social Touch Videos\\WT Mice\\Revised Face Videos\\Touch Videos';
%saves the aligned videos to new folder
sv_dir = 'F:\\Trish\\Social Touch Videos\\WT Mice\\Revised Face Videos\\Touch Videos\\Filtered';
mkdir(sv_dir);

files = dir(fullfile(rd_dir,'*.csv'));

base_dr = 'F:\\Trish\\Social Touch Videos\\WT Mice\\Revised Face Videos\\Baseline Videos';
basesv_dir = 'F:\\Trish\\Social Touch Videos\\WT Mice\\Revised Face Videos\\Baseline Videos\\Filtered';
mkdir(basesv_dir)

basefiles = dir(fullfile(base_dr, '*.csv'));

stim_dr = 'F:\\Trish\\Social Touch Videos\\WT Mice\\Revised Pupil and Running Videos';

stimfiles = dir(fullfile(stim_dr));

for aa = 1:size(files,1)
    thisF = files(aa).name;
    filenum = aa;
    
    disp(thisF)

    a = stimfiles(aa+2).name;
    cd(fullfile(stim_dr, a));
    b = cd;
    filein = dir(fullfile(b));
    c = filein(3).name;
    cd(c)
    
    fulla = a;
    disp(fulla)

    pupilstims = dir('*.mat');

    load(pupilstims(2).name, 'trialonsets2', 'frameonsets2');

    % move to baseline and get baseline value
    n = basefiles(aa).name;

    disp(n)

    cd(fullfile(base_dr));

    bEyeFile = readtable(fullfile(base_dr,n));
    
beyex1 = bEyeFile(:,2);

beyex1 = table2array(beyex1);
% eyex1 = str2double(eyex1);
% eyex1(1:1:2) = [];

beyex2 = bEyeFile(:,5);

beyex2 = table2array(beyex2);
% eyex2 = str2double(eyex2);
% eyex2(1:1:2) = [];

beyex3 = bEyeFile(:,8);

beyex3 = table2array(beyex3);
% eyex3 = str2double(eyex3);
% eyex3(1:1:2) = [];

beyex4 = bEyeFile(:,11);

beyex4 = table2array(beyex4);
% eyex4 = str2double(eyex4);
% eyex4(1:1:2) = [];

beyex5 = bEyeFile(:,14);

beyex5 = table2array(beyex5);
% eyex5 = str2double(eyex5);
% eyex5(1:1:2) = [];

beyex6 = bEyeFile(:,17);

beyex6 = table2array(beyex6);
% eyex6 = str2double(eyex6);
% eyex6(1:1:2) = [];

baseeyex = [beyex1, beyex2, beyex3, beyex4, beyex5, beyex6];

baseeyex = baseeyex.';
% 
% Extract Y coordinates for all points

beyey1 = bEyeFile(:,3);

beyey1 = table2array(beyey1);
% eyey1 = str2double(eyey1);
% eyey1(1:1:2) = [];

beyey2 = bEyeFile(:,6);

beyey2 = table2array(beyey2);
% eyey2 = str2double(eyey2);
% eyey2(1:1:2) = [];

beyey3 = bEyeFile(:,9);

beyey3 = table2array(beyey3);
% eyey3 = str2double(eyey3);
% eyey3(1:1:2) = [];

beyey4 = bEyeFile(:,12);

beyey4 = table2array(beyey4);
% eyey4 = str2double(eyey4);
% eyey4(1:1:2) = [];

beyey5 = bEyeFile(:,15);

beyey5 = table2array(beyey5);
% eyey5 = str2double(eyey5);
% eyey5(1:1:2) = [];

beyey6 = bEyeFile(:,18);

beyey6 = table2array(beyey6);
% eyey6 = str2double(eyey6);
% eyey6(1:1:2) = [];

baseyey = [beyey1, beyey2, beyey3, beyey4, beyey5, beyey6];

baseyey = baseyey.';

%Calculate area of polygon 

BaseEyeArea = polyarea(baseeyex, baseyey);

BaseEyeArea = BaseEyeArea.';

BaseEyeAreanew = BaseEyeArea(1:120*(floor(length(BaseEyeArea)/120)));

BaseEyeAreaSecs = mean(reshape(BaseEyeAreanew, 120, []));

BaseEyeAreaSecs = BaseEyeAreaSecs.';

BaseEyeAreaframes = BaseEyeArea;
BaseEyeAreaframesh = hampel(BaseEyeArea);
BaseEyeAreaframes = BaseEyeAreaframes * (25.4/729); %25.4/729 is conversion from pixels to mm
BaseEyeAreaframeshmm = BaseEyeAreaframesh * (25.4/729);
BaseEyeAreaH = hampel(BaseEyeAreaSecs);
BaseEyeAreaHmm = BaseEyeAreaH * (25.4/729);
BaseEyeAreaHmm = BaseEyeAreaHmm(1:length(BaseEyeAreaHmm));

% get the eye area for the stims

j = files(aa).name;

    disp(j)

    cd(fullfile(rd_dir));

EyeFile = readtable(fullfile(rd_dir,thisF));
    
eyex1 = EyeFile(:,2);

eyex1 = table2array(eyex1);
% eyex1 = str2double(eyex1);
% eyex1(1:1:2) = [];

eyex2 = EyeFile(:,5);

eyex2 = table2array(eyex2);
% eyex2 = str2double(eyex2);
% eyex2(1:1:2) = [];

eyex3 = EyeFile(:,8);

eyex3 = table2array(eyex3);
% eyex3 = str2double(eyex3);
% eyex3(1:1:2) = [];

eyex4 = EyeFile(:,11);

eyex4 = table2array(eyex4);
% eyex4 = str2double(eyex4);
% eyex4(1:1:2) = [];

eyex5 = EyeFile(:,14);

eyex5 = table2array(eyex5);
% eyex5 = str2double(eyex5);
% eyex5(1:1:2) = [];

eyex6 = EyeFile(:,17);

eyex6 = table2array(eyex6);
% eyex6 = str2double(eyex6);
% eyex6(1:1:2) = [];

eyex = [eyex1, eyex2, eyex3, eyex4, eyex5, eyex6];

eyex = eyex.';
% 
% Extract Y coordinates for all points

eyey1 = EyeFile(:,3);

eyey1 = table2array(eyey1);
% eyey1 = str2double(eyey1);
% eyey1(1:1:2) = [];

eyey2 = EyeFile(:,6);

eyey2 = table2array(eyey2);
% eyey2 = str2double(eyey2);
% eyey2(1:1:2) = [];

eyey3 = EyeFile(:,9);

eyey3 = table2array(eyey3);
% eyey3 = str2double(eyey3);
% eyey3(1:1:2) = [];

eyey4 = EyeFile(:,12);

eyey4 = table2array(eyey4);
% eyey4 = str2double(eyey4);
% eyey4(1:1:2) = [];

eyey5 = EyeFile(:,15);

eyey5 = table2array(eyey5);
% eyey5 = str2double(eyey5);
% eyey5(1:1:2) = [];

eyey6 = EyeFile(:,18);

eyey6 = table2array(eyey6);
% eyey6 = str2double(eyey6);
% eyey6(1:1:2) = [];

eyey = [eyey1, eyey2, eyey3, eyey4, eyey5, eyey6];

eyey = eyey.';

%Calculate area of polygon 

EyeArea = polyarea(eyex, eyey);

EyeArea = EyeArea.';

EyeAreanew = EyeArea(1:120*(floor(length(EyeArea)/120)));

EyeAreaSecs = mean(reshape(EyeAreanew, 120, []));

EyeAreaSecs = EyeAreaSecs.';

EyeAreaframes = EyeArea;
EyeAreaframesh = hampel(EyeArea);
EyeAreaframes = EyeAreaframes * (25.4/729);
EyeAreaframeshmm = EyeAreaframesh * (25.4/729);
EyeAreaH = hampel(EyeAreaSecs);
EyeAreaHmm = EyeAreaH * (25.4/729);
EyeAreaHmm = EyeAreaHmm(1:length(EyeAreaHmm));
figure(aa)
plot(EyeAreaHmm)
xlabel("Time (in seconds)")
ylabel("Area (pixels^2)")

exist trialonsets2

g = ans;

if g == 1
newtrialonsets = trialonsets2 - (frameonsets2(1));
else
newtrialonsets = input("enter trial onsets");
end

% get the stim orbital values

    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
    %behavior is being interfered with (ie. grooming)
    firstskip = 'first sec to skip'
    secondskip = 'last sec to skip'
    
%     newEyeAreaHmm = EyeAreaHmm(~isnan(EyeAreaHmm));
%     newEyeAreaHmm = (newEyeAreaHmm - nanmean(newEyeAreaHmm))/nanstd(newEyeAreaHmm);
    disp('which baseline secs to omit')
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    while(1)
        BaseEyeAreaHmm(input(firstskip):input(secondskip))=nan;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        if m=='N'
            break
        end
    end

    disp('which touch secs to omit')
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    while(1)
        EyeAreaHmm(input(firstskip):input(secondskip))=nan;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        if m=='N'
            break
        end
    end
    
    %EyeAreaHmm = (EyeAreaHmm - nanmean(EyeAreaHmm))/nanstd(EyeAreaHmm);
    
%     threshold = 'enter threshold that squinting occurs at';
%     figure; findchangepts(newEyeAreaHmm, 'Statistic', 'std', 'MinThreshold', 20);
%     P = prctile(EyeAreaHmm, 15)
%     EyeSquints = find(EyeAreaHmm((input(start)):(input(last))) < input(threshold));
%     %begin calculation for each of the behavioral measures
%     %before is condition before social touch begins
%     disp('before')
    
    AvgBaselineTouch = mean(BaseEyeAreaHmm(1:110), 'omitnan');

    AvgBeforeTouch = mean(EyeAreaHmm(1:120), 'omitnan');
    
    %during is condition for behavior during social touch
    disp('during')
    
    AvgDuringTouch = mean(EyeAreaHmm(newtrialonsets(1):newtrialonsets(20)+5), 'omitnan');
    
    %condition for first 5 social touch presentations
    disp('first 5')
    
    AvgFirst5 = mean(EyeAreaHmm(newtrialonsets(1):newtrialonsets(6)), 'omitnan');
    
    disp('last 5')
    
    %condition for last 5 social touch presentations
    AvgLast5 = mean(EyeAreaHmm(newtrialonsets(16):newtrialonsets(20)+5), 'omitnan');
    
    %saves relevant .mat files to a new file
    thisM = [thisF, '.mat'];
    save(fullfile(sv_dir, thisM), 'AvgBeforeTouch','AvgDuringTouch','AvgFirst5','AvgLast5', 'EyeAreaHmm');
    thisN = [n, '.mat'];
    save(fullfile(basesv_dir, thisN), 'AvgBaselineTouch','BaseEyeAreaHmm');


end


