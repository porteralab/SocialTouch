%Code written to Calculate Relative Position of Mouse's Whiskers as a Feature of
%Aversion

%First reads the DeepLabCut excel files to extract XY coordinates of each
%whisker (out of 6)

%Extract each whisker pad coordinate
% clear
% close all

clear all
close all
clc

%finds the folder of interest
rd_dir = 'F:\Trish\Social Touch Videos\Fmr1KO Mice\Voluntary\Whisker Protraction Files';
%saves the aligned videos to new folder
sv_dir = 'F:\Trish\Social Touch Videos\Fmr1KO Mice\Voluntary\Whisker Protraction Files\Filtered';
mkdir(sv_dir);

files = dir(fullfile(rd_dir,'*.csv'));

for aa = 1:size(files,1)
    %finds the folder of interest
    files = dir(fullfile(rd_dir,'*.csv'));
    thisF = files(aa).name;
    filenum = aa;
    
    disp(thisF)
    
  pause(10)
  close all

whfile = readtable(fullfile(rd_dir,thisF));

x1 = whfile(:,2);
y1 = whfile(:,3);
x2 = whfile(:,5);
y2 = whfile(:,6);
x3 = whfile(:,8);
y3 = whfile(:,9);
x4 = whfile(:,11);
y4 = whfile(:,12);
x5 = whfile(:,14);
y5 = whfile(:,15);
x6 = whfile(:,17);
y6 = whfile(:,18);


%x1, y1
x1 = table2array(x1);


% x1 = mean(reshape(x1, 50, []));


y1 = table2array(y1);


% y1 = mean(reshape(y1, 50, []));


%x2, y2
x2 = table2array(x2);



y2 = table2array(y2);

%x3, y3
x3 = table2array(x3);


y3 = table2array(y3);

%x4, y4
x4 = table2array(x4);


y4 = table2array(y4);


%x5, y5
x5 = table2array(x5);

y5 = table2array(y5);

%x6, y6

x6 = table2array(x6);

y6 = table2array(y6);


xchangewhisker = [x1,x2,x3,x4,x5,x6];



newxchange = transpose(xchangewhisker);
meanxch = mean(newxchange);
medianxch = median(newxchange);






thisM = [thisF, '.mat'];
save(fullfile(sv_dir, thisM), 'xchangewhisker', 'newxchange', 'meanxch', 'medianxch');

clearvars -except aa rd_dir sv_dir
end
