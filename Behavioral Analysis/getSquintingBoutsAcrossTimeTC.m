clear
close all
load("frames", "frameonsets_", "apbin");
load("newstimonsets.mat", 'stimonsets')
cd AllBehaviorFiles
%%
files = dir('*AVERSIONBOUTS*');
behavfiles = dir('*addDLCaddAvoidfilteredupdate*');
endofsession = find(diff(frameonsets_)>3);
endofsession(length(endofsession)+1) = length(frameonsets_);
close all
types = ["volobj", "volmo", "forcobj", "forcmo"];

clear eyeonsets
clear eyeend

%%
fileload = load(files(1).name);
load(behavfiles(1).name);


lengthofsess = length(allBehavioralData.AllFacialData.VOLOBJAllFacialVariables.TOUCHTYPEBEHAVRAW.TOUCHTYPEEyeArearaw);


EyeSquintBOUTVOLOBJ = zeros(1,length(endofsession(1)+1:endofsession(2)));
EyeSquintBOUTVOLOBJ = EyeSquintBOUTVOLOBJ(1:lengthofsess);

if isfield(fileload.DLCBOUTS.EYEAREA, "VOLOBJ") == 1
VOLOBJeyeonsets = fileload.DLCBOUTS.EYEAREA.VOLOBJ.VOLOBJONSETS;
VOLOBJeyeend = fileload.DLCBOUTS.EYEAREA.VOLOBJ.VOLOBJEND;
VOLOBJframes = frameonsets_(endofsession(1)+1:endofsession(2));
VOLOBJframesre = VOLOBJframes;
VOLOBJframesnew = VOLOBJframesre(1:lengthofsess);


for t = 1:length(VOLOBJeyeonsets)
A = repmat(VOLOBJframesnew,[1 length(VOLOBJeyeonsets(t))]);
prestim = round(VOLOBJeyeonsets(t));
poststim = round(VOLOBJeyeend(t));
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
EyeSquintBOUTVOLOBJ(closestValuepre(t):closestValuepost(t)) = 1;
end
end

%%


lengthofsess = length(allBehavioralData.AllFacialData.VOLMOAllFacialVariables.TOUCHTYPEBEHAVRAW.TOUCHTYPEEyeArearaw);

EyeSquintBOUTVOLMO = zeros(1,length(endofsession(2)+1:endofsession(3)));
EyeSquintBOUTVOLMO = EyeSquintBOUTVOLMO(1:lengthofsess);

if isfield(fileload.DLCBOUTS.EYEAREA, "VOLMO") == 1
VOLMOeyeonsets = fileload.DLCBOUTS.EYEAREA.VOLMO.VOLMOONSETS;
VOLMOeyeend = fileload.DLCBOUTS.EYEAREA.VOLMO.VOLMOEND;

VOLMOframes = frameonsets_(endofsession(2)+1:endofsession(3));
VOLMOframesre = VOLMOframes;
VOLMOframesnew = VOLMOframesre(1:lengthofsess);


for t = 1:length(VOLMOeyeonsets)
A = repmat(VOLMOframesnew,[1 length(VOLMOeyeonsets(t))]);
prestim = round(VOLMOeyeonsets(t));
poststim = round(VOLMOeyeend(t));
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
EyeSquintBOUTVOLMO(closestValuepre(t):closestValuepost(t)) = 1;
end
end

%%


lengthofsess = length(allBehavioralData.AllFacialData.FORCOBJAllFacialVariables.TOUCHTYPEBEHAVRAW.TOUCHTYPEEyeArearaw);


EyeSquintBOUTFORCOBJ = zeros(1,length(endofsession(5)+1:endofsession(6)));
EyeSquintBOUTFORCOBJ = EyeSquintBOUTFORCOBJ(1:lengthofsess);

if isfield(fileload.DLCBOUTS.EYEAREA, "FORCOBJ") == 1
FORCOBJeyeonsets = fileload.DLCBOUTS.EYEAREA.FORCOBJ.FORCOBJONSETS;
FORCOBJeyeend = fileload.DLCBOUTS.EYEAREA.FORCOBJ.FORCOBJEND;
FORCOBJframes = frameonsets_(endofsession(5)+1:endofsession(6));
FORCOBJframesre = FORCOBJframes;
FORCOBJframesnew = FORCOBJframesre(1:lengthofsess);


for t = 1:length(FORCOBJeyeonsets)
A = repmat(FORCOBJframesnew,[1 length(FORCOBJeyeonsets(t))]);
prestim = round(FORCOBJeyeonsets(t));
poststim = round(FORCOBJeyeend(t));
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
EyeSquintBOUTFORCOBJ(closestValuepre(t):closestValuepost(t)) = 1;
end
end

%%




lengthofsess = length(allBehavioralData.AllFacialData.FORCMOAllFacialVariables.TOUCHTYPEBEHAVRAW.TOUCHTYPEEyeArearaw);


EyeSquintBOUTFORCMO = zeros(1,length(endofsession(6)+1:endofsession(7)));
EyeSquintBOUTFORCMO = EyeSquintBOUTFORCMO(1:lengthofsess);

if isfield(fileload.DLCBOUTS.EYEAREA, "FORCMO") == 1
FORCMOeyeonsets = fileload.DLCBOUTS.EYEAREA.FORCMO.FORCMOONSETS;
FORCMOeyeend = fileload.DLCBOUTS.EYEAREA.FORCMO.FORCMOEND;
FORCMOframes = frameonsets_(endofsession(6)+1:endofsession(7));
FORCMOframesre = FORCMOframes;
FORCMOframesnew = FORCMOframesre(1:lengthofsess);


for t = 1:length(FORCMOeyeonsets)
A = repmat(FORCMOframesnew,[1 length(FORCMOeyeonsets(t))]);
prestim = round(FORCMOeyeonsets(t));
poststim = round(FORCMOeyeend(t));
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
EyeSquintBOUTFORCMO(closestValuepre(t):closestValuepost(t)) = 1;
end
end

%%
totalstimtime = 9;


for t = 1:length(stimonsets)/4
A = repmat(VOLOBJframesnew,[1 length(stimonsets(t))]);
prestim = stimonsets(t)-2;
poststim = stimonsets(t)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
eyeperstimraw = EyeSquintBOUTVOLOBJ(closestValuepre(t):closestValuepost(t));
eyetrialVOLOBJraw(t,:) = eyeperstimraw(1:totalstimtime*120);
end

%%
totalstimtime = 9;


for t = 1:length(stimonsets)/4
A = repmat(VOLMOframesnew,[1 length(stimonsets(t+40))]);
prestim = stimonsets(t+40)-2;
poststim = stimonsets(t+40)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
eyeperstimraw = EyeSquintBOUTVOLMO(closestValuepre(t):closestValuepost(t));
eyetrialVOLMOraw(t,:) = eyeperstimraw(1:totalstimtime*120);
end

%%
totalstimtime = 9;


for t = 1:length(stimonsets)/4
A = repmat(FORCOBJframesnew,[1 length(stimonsets(t+80))]);
prestim = stimonsets(t+80)-2;
poststim = stimonsets(t+80)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
eyeperstimraw = EyeSquintBOUTFORCOBJ(closestValuepre(t):closestValuepost(t));
eyetrialFORCOBJraw(t,:) = eyeperstimraw(1:totalstimtime*120);
end

%%
totalstimtime = 9;


for t = 1:length(stimonsets)/4
A = repmat(FORCMOframesnew,[1 length(stimonsets(t+120))]);
prestim = stimonsets(t+120)-2;
poststim = stimonsets(t+120)+7;
[minValue,closestIndex] = min(abs(A-prestim));
closestValuepre(t) = closestIndex;
[minValue,closestIndex] = min(abs(A-poststim));
closestValuepost(t) = closestIndex;
eyeperstimraw = EyeSquintBOUTFORCMO(closestValuepre(t):closestValuepost(t));
eyetrialFORCMOraw(t,:) = eyeperstimraw(1:totalstimtime*120);
end

%%
FileName = strcat(apbin, "allBehavioralData", "AllAvoidanceMOTIONDLCVariables", ".mat");

load(FileName, "allBehavioralData");

allBehavioralData.AllAvoidanceData.VOLOBJAllAvoidanceVariables.TOUCHTYPEEyeSquintingbyTRIAL = eyetrialVOLOBJraw;

allBehavioralData.AllAvoidanceData.VOLMOAllAvoidanceVariables.TOUCHTYPEEyeSquintingbyTRIAL = eyetrialVOLMOraw;

allBehavioralData.AllAvoidanceData.FORCOBJAllAvoidanceVariables.TOUCHTYPEEyeSquintingbyTRIAL = eyetrialFORCOBJraw;
allBehavioralData.AllAvoidanceData.FORCMOAllAvoidanceVariables.TOUCHTYPEEyeSquintingbyTRIAL = eyetrialFORCMOraw;


FileName = strcat(apbin, "allBehavioralData", "AllAvoidanceMOTIONDLCVariables", "withEYE", ".mat");

save(FileName, "allBehavioralData");
