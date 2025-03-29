%%
clear

%%
load('newstimonsets.mat');
%%
% create vector for trial type that denotes when trial is object versus
% social
trialtype(1:40) = 0;
trialtype(41:80) = 1;

% use trialtype for the type of context


%% create matrix with only the stim variables

stimtype(1) = "trial context";

stimdesignmatrix(1,:) = trialtype;


%% create behavior matrices for VOLUNTARY TOUCH
% create avoidance matrices first 

allavoidtrials = allBehavioralData.AllAvoidanceData.VOLOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;

allavoidtrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allavoidtrials(a, :) == 3 | allavoidtrials(a, :) == 4 | allavoidtrials(a, :) == 5);
    allavoidtrials2(a,j) = 1;
    allavoidavgvolmo(a) = mode(allavoidtrials2(a, 241:840));
    allavoidavgvolmo2(a) = mode(allavoidtrials(a, 241:840));
end


allavoidtrials = allBehavioralData.AllAvoidanceData.VOLMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;


allavoidtrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allavoidtrials(a, :) == 3 | allavoidtrials(a, :) == 4 | allavoidtrials(a, :) == 5);
    allavoidtrials2(a,j) = 1;
    allavoidavgvolobj(a) = mode(allavoidtrials2(a, 241:840));
    allavoidavgvolobj2(a) = mode(allavoidtrials(a, 241:840));
end

allavoidavg = [allavoidavgvolobj, allavoidavgvolmo];
% create eye squinting matrices


alleyetrials = allBehavioralData.AllFacialData.VOLMOAllFacialVariables.BEHAVbyTRIALRAW.BYTRIALEyeArearaw;

alleyetrials2 = alleyetrials;
for a = 1:40
    alleyeavgvolmo(a) = nanmean(alleyetrials2(a, 241:840));
    if isnan(alleyeavgvolmo(a)) == 1
        alleyeavgvolmo(a) = 0;
    end    
end

alleyetrials = allBehavioralData.AllFacialData.VOLOBJAllFacialVariables.BEHAVbyTRIALRAW.BYTRIALEyeArearaw;

alleyetrials2 = alleyetrials;
for a = 1:40
    alleyeavgvolobj(a) = nanmean(alleyetrials2(a, 241:840));
    if isnan(alleyeavgvolobj(a)) == 1
        alleyeavgvolobj(a) = 0;
    end    
end

alleyeavgboth = [alleyeavgvolobj, alleyeavgvolmo];

alleyeavgboth(find(alleyeavgboth == 0)) = NaN;

alleyeavg = (alleyeavgboth - nanmean(alleyeavgboth))/(nanstd(alleyeavgboth));

alleyeavg(find(isnan(alleyeavg))) = 0;
% create whisking matrices

allwhiskprotrials = allBehavioralData.AllAvoidanceData.VOLOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALwhiskproraw;

allwhiskprotrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allwhiskprotrials(a, :) == 1);
    allwhiskprotrials2(a,j) = 1;
    if nanmean(allwhiskprotrials2(a, 241:840)) > 0
    allwhiskproavgvolmo(a) = 1;
    else
    allwhiskproavgvolmo(a) = 0;
    end
end


allwhiskprotrials = allBehavioralData.AllAvoidanceData.VOLMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALwhiskproraw;


allwhiskprotrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allwhiskprotrials(a, :) == 1);
    allwhiskprotrials2(a,j) = 1;
    if nanmean(allwhiskprotrials2(a, 241:840)) > 0
    allwhiskproavgvolobj(a) = 1;
    else
    allwhiskproavgvolobj(a) = 0;
    end
end


allwhiskproavg = [allwhiskproavgvolobj, allwhiskproavgvolmo];

aversionvariables(1) = "runavoid";
aversionvariables(2) = "orbtight";
aversionvariables(3) = "whiskpro";

aversdesignmatrixVOL(1,:) = allavoidavg;
aversdesignmatrixVOL(2,:) = alleyeavg;
aversdesignmatrixVOL(3,:) = allwhiskproavg;

%% create matrix for locomotion, DLC movement & pupil

allmotiontrials = allBehavioralData.AllAvoidanceData.VOLOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;

allmotiontrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allmotiontrials(a, :) == 1 | allmotiontrials(a, :) == 2 | allmotiontrials(a, :) == 3 | allmotiontrials(a, :) == 4 | allmotiontrials(a, :) == 5);
    allmotiontrials2(a,j) = 1;
    allmotionavgvolmo(a) = mode(allmotiontrials2(a, 241:840));
    allmotionavgvolmo2(a) = mode(allmotiontrials(a, 241:840));
end


allmotiontrials = allBehavioralData.AllAvoidanceData.VOLMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;


allmotiontrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allmotiontrials(a, :) == 1 | allmotiontrials(a, :) == 2 | allmotiontrials(a, :) == 3 | allmotiontrials(a, :) == 4 | allmotiontrials(a, :) == 5);
    allmotiontrials2(a,j) = 1;
    allmotionavgvolobj(a) = mode(allmotiontrials2(a, 241:840));
    allmotionavgvolobj2(a) = mode(allmotiontrials(a, 241:840));
end

allmotionavg = [allmotionavgvolobj, allmotionavgvolmo];


%% DLCs
% whisk 1
DLCwhisk1trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk1m;
DLCwhisk2trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk2m;
DLCwhisk3trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk3m;
DLCwhisk4trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk4m;
DLCwhisk5trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk5m;
DLCwhisk6trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.whisk6m;

for a = 1:40
    DLCwhiskalltrial(a,:) = nanmedian([DLCwhisk1trials(a,:);DLCwhisk2trials(a,:);DLCwhisk3trials(a,:);DLCwhisk4trials(a,:);DLCwhisk5trials(a,:);DLCwhisk6trials(a,:)]);
    DLCwhiskavgtrial(a,:) = nanmean(DLCwhiskalltrial(a,121:420));
end

DLCwhiskavgtrialvolmo = DLCwhiskavgtrial';

for a = 1:40
    if isnan(DLCwhiskavgtrialvolmo(a)) == 1
        DLCwhiskavgtrialvolmo(a) = 0;
    end   
end

DLCwhisk1trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk1m;
DLCwhisk2trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk2m;
DLCwhisk3trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk3m;
DLCwhisk4trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk4m;
DLCwhisk5trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk5m;
DLCwhisk6trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.whisk6m;

for a = 1:40
    DLCwhiskalltrial(a,:) = nanmedian([DLCwhisk1trials(a,:);DLCwhisk2trials(a,:);DLCwhisk3trials(a,:);DLCwhisk4trials(a,:);DLCwhisk5trials(a,:);DLCwhisk6trials(a,:)]);
    DLCwhiskavgtrial(a,:) = nanmean(DLCwhiskalltrial(a,121:420));
end

DLCwhiskavgtrialvolobj = DLCwhiskavgtrial';

for a=1:40
    if isnan(DLCwhiskavgtrialvolobj(a)) == 1
        DLCwhiskavgtrialvolobj(a) = 0;
    end  
end

allwhiskingDLCavgboth = [DLCwhiskavgtrialvolobj, DLCwhiskavgtrialvolmo];

allwhiskingDLCavgboth(find(allwhiskingDLCavgboth == 0)) = NaN;

allwhiskingDLCavg = (allwhiskingDLCavgboth - nanmean(allwhiskingDLCavgboth))/(nanstd(allwhiskingDLCavgboth));

allwhiskingDLCavg(find(isnan(allwhiskingDLCavg))) = 0;



%% create eye DLC

% eye 1
DLCeye1trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye1m;
DLCeye2trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye2m;
DLCeye3trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye3m;
DLCeye4trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye4m;
DLCeye5trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye5m;
DLCeye6trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.eye6m;

for a = 1:40
    DLCeyealltrial(a,:) = nanmedian([DLCeye1trials(a,:);DLCeye2trials(a,:);DLCeye3trials(a,:);DLCeye4trials(a,:);DLCeye5trials(a,:);DLCeye6trials(a,:)]);
    DLCeyeavgtrial(a,:) = nanmean(DLCeyealltrial(a,121:420));
end

DLCeyeavgtrialvolmo = DLCeyeavgtrial';

for a = 1:40
    if isnan(DLCeyeavgtrialvolmo(a)) == 1
        DLCeyeavgtrialvolmo(a) = 0;
    end   
end

DLCeye1trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye1m;
DLCeye2trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye2m;
DLCeye3trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye3m;
DLCeye4trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye4m;
DLCeye5trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye5m;
DLCeye6trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.eye6m;

for a = 1:40
    DLCeyealltrial(a,:) = nanmedian([DLCeye1trials(a,:);DLCeye2trials(a,:);DLCeye3trials(a,:);DLCeye4trials(a,:);DLCeye5trials(a,:);DLCeye6trials(a,:)]);
    DLCeyeavgtrial(a,:) = nanmean(DLCeyealltrial(a,121:420));
end

DLCeyeavgtrialvolobj = DLCeyeavgtrial';

for a=1:40
    if isnan(DLCeyeavgtrialvolobj(a)) == 1
        DLCeyeavgtrialvolobj(a) = 0;
    end  
end

alleyeDLCavgboth = [DLCeyeavgtrialvolobj, DLCeyeavgtrialvolmo];

alleyeDLCavgboth(find(alleyeDLCavgboth == 0)) = NaN;

alleyeDLCavg = (alleyeDLCavgboth - nanmean(alleyeDLCavgboth))/(nanstd(alleyeDLCavgboth));

alleyeDLCavg(find(isnan(alleyeDLCavg))) = 0;




%% create pupil DLC

% pupil 1
DLCpupil1trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil1m;
DLCpupil2trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil2m;
DLCpupil3trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil3m;
DLCpupil4trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil4m;
DLCpupil5trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil5m;
DLCpupil6trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.pupil6m;

for a = 1:40
    DLCpupilalltrial(a,:) = nanmedian([DLCpupil1trials(a,:);DLCpupil2trials(a,:);DLCpupil3trials(a,:);DLCpupil4trials(a,:);DLCpupil5trials(a,:);DLCpupil6trials(a,:)]);
    DLCpupilavgtrial(a,:) = nanmean(DLCpupilalltrial(a,121:420));
end

DLCpupilavgtrialvolmo = DLCpupilavgtrial';

for a = 1:40
    if isnan(DLCpupilavgtrialvolmo(a)) == 1
        DLCpupilavgtrialvolmo(a) = 0;
    end   
end

DLCpupil1trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil1m;
DLCpupil2trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil2m;
DLCpupil3trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil3m;
DLCpupil4trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil4m;
DLCpupil5trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil5m;
DLCpupil6trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.pupil6m;

for a = 1:40
    DLCpupilalltrial(a,:) = nanmedian([DLCpupil1trials(a,:);DLCpupil2trials(a,:);DLCpupil3trials(a,:);DLCpupil4trials(a,:);DLCpupil5trials(a,:);DLCpupil6trials(a,:)]);
    DLCpupilavgtrial(a,:) = nanmean(DLCpupilalltrial(a,121:420));
end

DLCpupilavgtrialvolobj = DLCpupilavgtrial';

for a=1:40
    if isnan(DLCpupilavgtrialvolobj(a)) == 1
        DLCpupilavgtrialvolobj(a) = 0;
    end  
end

allpupilDLCavgboth = [DLCpupilavgtrialvolobj, DLCpupilavgtrialvolmo];

allpupilDLCavgboth(find(allpupilDLCavgboth == 0)) = NaN;

allpupilDLCavg = (allpupilDLCavgboth - nanmean(allpupilDLCavgboth))/(nanstd(allpupilDLCavgboth));

allpupilDLCavg(find(isnan(allpupilDLCavg))) = 0;

%%
% mouth 1
DLCmouth1trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.mouth1m;
DLCmouth2trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.mouth2m;
DLCmouth3trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.mouth3m;


for a = 1:40
    DLCmouthalltrial(a,:) = nanmedian([DLCmouth1trials(a,:);DLCmouth2trials(a,:);DLCmouth3trials(a,:)]);
    DLCmouthavgtrial(a,:) = nanmean(DLCmouthalltrial(a,121:420));
end

DLCmouthavgtrialvolmo = DLCmouthavgtrial';

for a = 1:40
    if isnan(DLCmouthavgtrialvolmo(a)) == 1
        DLCmouthavgtrialvolmo(a) = 0;
    end   
end

DLCmouth1trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.mouth1m;
DLCmouth2trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.mouth2m;
DLCmouth3trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.mouth3m;


for a = 1:40
    DLCmouthalltrial(a,:) = nanmedian([DLCmouth1trials(a,:);DLCmouth2trials(a,:);DLCmouth3trials(a,:)]);
    DLCmouthavgtrial(a,:) = nanmean(DLCmouthalltrial(a,121:420));
end

DLCmouthavgtrialvolobj = DLCmouthavgtrial';

for a=1:40
    if isnan(DLCmouthavgtrialvolobj(a)) == 1
        DLCmouthavgtrialvolobj(a) = 0;
    end  
end

allmouthDLCavgboth = [DLCmouthavgtrialvolobj, DLCmouthavgtrialvolmo];

allmouthDLCavgboth(find(allmouthDLCavgboth == 0)) = NaN;

allmouthDLCavg = (allmouthDLCavgboth - nanmean(allmouthDLCavgboth))/(nanstd(allmouthDLCavgboth));

allmouthDLCavg(find(isnan(allmouthDLCavg))) = 0;

%% create nose DLC
% nose 1
DLCnose1trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.nose1m;
DLCnose2trials = DLCALLVariables.VOLMODLCALL.TRIALRAW.nose2m;



for a = 1:40
    DLCnosealltrial(a,:) = nanmedian([DLCnose1trials(a,:);DLCnose2trials(a,:)]);
    DLCnoseavgtrial(a,:) = nanmean(DLCnosealltrial(a,121:420));
end

DLCnoseavgtrialvolmo = DLCnoseavgtrial';

for a = 1:40
    if isnan(DLCnoseavgtrialvolmo(a)) == 1
        DLCnoseavgtrialvolmo(a) = 0;
    end   
end

DLCnose1trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.nose1m;
DLCnose2trials = DLCALLVariables.VOLOBJDLCALL.TRIALRAW.nose2m;


for a = 1:40
    DLCnosealltrial(a,:) = nanmedian([DLCnose1trials(a,:);DLCnose2trials(a,:)]);
    DLCnoseavgtrial(a,:) = nanmean(DLCnosealltrial(a,121:420));
end

DLCnoseavgtrialvolobj = DLCnoseavgtrial';

for a=1:40
    if isnan(DLCnoseavgtrialvolobj(a)) == 1
        DLCnoseavgtrialvolobj(a) = 0;
    end  
end

allnoseDLCavgboth = [DLCnoseavgtrialvolobj, DLCnoseavgtrialvolmo];

allnoseDLCavgboth(find(allnoseDLCavgboth == 0)) = NaN;

allnoseDLCavg = (allnoseDLCavgboth - nanmean(allnoseDLCavgboth))/(nanstd(allnoseDLCavgboth));

allnoseDLCavg(find(isnan(allnoseDLCavg))) = 0;
%% create design matrix for DLC labels only

DLCvariables(1) = "whiskingDLC";
DLCvariables(2) = "eyeDLC";
DLCvariables(3) = "pupilDLC";
DLCvariables(4) = "mouthDLC";
DLCvariables(5) = "noseDLC";

DLCdesignmatrixVOL(1,:) = allwhiskingDLCavg;
DLCdesignmatrixVOL(2,:) = alleyeDLCavg;
DLCdesignmatrixVOL(3,:) = allpupilDLCavg;
DLCdesignmatrixVOL(4,:) = allmouthDLCavg;
DLCdesignmatrixVOL(5,:) = allnoseDLCavg;



%% create additional behavior matrices

% create pupil matrices

allpupiltrials = allBehavioralData.PupilTRIALData.pupiltrialVOLOBJ;

allpupiltrials2 = allpupiltrials;
for a = 1:40
    allpupilsizeavgvolobj(a) = nanmean(allpupiltrials2(a, 241:840));
    if isnan(allpupilsizeavgvolobj(a)) == 1
        allpupilsizeavgvolobj(a) = 0;
    end    
end

allpupiltrials = allBehavioralData.PupilTRIALData.pupiltrialVOLMO;

allpupiltrials2 = allpupiltrials;
for a = 1:40
    allpupilsizeavgvolmo(a) = nanmean(allpupiltrials2(a, 241:840));
    if isnan(allpupilsizeavgvolmo(a)) == 1
        allpupilsizeavgvolmo(a) = 0;
    end    
end

allpupilavgboth = [allpupilsizeavgvolobj, allpupilsizeavgvolmo];

allpupilavgboth(find(allpupilavgboth == 0)) = NaN;

allpupilavg = (allpupilavgboth - nanmean(allpupilavgboth))/(nanstd(allpupilavgboth));

allpupilavg(find(isnan(allpupilavg))) = 0;

% create running matrices

allrunningtrials = allBehavioralData.RunTRIALData.runningtrialVOLOBJ;

allrunningtrials2 = allrunningtrials;
for a = 1:40
    allrunningavgvolobj(a) = nanmean(allrunningtrials2(a, 241:840));
    if isnan(allrunningavgvolobj(a)) == 1
        allrunningavgvolobj(a) = 0;
    end    
end

allrunningtrials = allBehavioralData.RunTRIALData.runningtrialVOLMO;

allrunningtrials2 = allrunningtrials;
for a = 1:40
    allrunningavgvolmo(a) = nanmean(allrunningtrials2(a, 241:840));
    if isnan(allrunningavgvolmo(a)) == 1
        allrunningavgvolmo(a) = 0;
    end    
end

allrunningavgboth = [allrunningavgvolobj, allrunningavgvolmo];

allrunningavgboth(find(allrunningavgboth == 0)) = NaN;

allrunningavg = (allrunningavgboth - nanmean(allrunningavgboth))/(nanstd(allrunningavgboth));

allrunningavg(find(isnan(allrunningavg))) = 0;

% create saccades matrices


allsaccadestrials = allBehavioralData.AllFacialData.VOLOBJAllFacialVariables.BEHAVbyTRIALFILT.BYTRIALpupilSaccades;


allsaccadestrials2 = allsaccadestrials;
for a = 1:40
    allsaccadesavgvolobj(a) = nanmean(allsaccadestrials2(a, 241:840));
    if isnan(allsaccadesavgvolobj(a)) == 1
        allsaccadesavgvolobj(a) = 0;
    end    
end

allsaccadestrials = allBehavioralData.AllFacialData.VOLMOAllFacialVariables.BEHAVbyTRIALFILT.BYTRIALpupilSaccades;

allsaccadestrials2 = allsaccadestrials;
for a = 1:40
    allsaccadesavgvolmo(a) = nanmean(allsaccadestrials2(a, 241:840));
    if isnan(allsaccadesavgvolmo(a)) == 1
        allsaccadesavgvolmo(a) = 0;
    end    
end

allsaccadesavgboth = [allsaccadesavgvolobj, allsaccadesavgvolmo];

allsaccadesavgboth(find(allsaccadesavgboth == 0)) = NaN;

allsaccadesavg = (allsaccadesavgboth - nanmean(allsaccadesavgboth))/(nanstd(allsaccadesavgboth));

allsaccadesavg(find(isnan(allsaccadesavg))) = 0;

otherbehavvariables(1) = "pupil";
otherbehavvariables(2) = "running";
otherbehavvariables(3) = "saccades";
otherbehavvariables(4) = "motionbi";

otherdesignmatrixVOL(1,:) = allpupilavg;
otherdesignmatrixVOL(2,:) = allrunningavg;
otherdesignmatrixVOL(3,:) = allsaccadesavg;
otherdesignmatrixVOL(4,:) = allmotionavg;


%% create behavior matrices for FORCED TOUCH
% load('newstimonsets.mat');

% create vector for trial type that denotes when trial is object versus
% social
trialtype(1:40) = 0;
trialtype(41:80) = 1;

% use trialtype for the type of context


%% create matrix with only the stim variables

stimtype(1) = "trial context";

stimdesignmatrix(1,:) = trialtype;


%% create behavior matrices for FORCED TOUCH
% create avoidance matrices first 

allavoidtrials = allBehavioralData.AllAvoidanceData.FORCOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;

allavoidtrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allavoidtrials(a, :) == 3 | allavoidtrials(a, :) == 4 | allavoidtrials(a, :) == 5);
    allavoidtrials2(a,j) = 1;
    allavoidavgforcmo(a) = mode(allavoidtrials2(a, 241:840));
    allavoidavgforcmo2(a) = mode(allavoidtrials(a, 241:840));
end


allavoidtrials = allBehavioralData.AllAvoidanceData.FORCMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;


allavoidtrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allavoidtrials(a, :) == 3 | allavoidtrials(a, :) == 4 | allavoidtrials(a, :) == 5);
    allavoidtrials2(a,j) = 1;
    allavoidavgforcobj(a) = mode(allavoidtrials2(a, 241:840));
    allavoidavgforcobj2(a) = mode(allavoidtrials(a, 241:840));
end

allavoidavg = [allavoidavgforcobj, allavoidavgforcmo];
% create eye squinting matrices


alleyetrials = allBehavioralData.AllFacialData.FORCMOAllFacialVariables.BEHAVbyTRIALRAW.BYTRIALEyeArearaw;

alleyetrials2 = alleyetrials;
for a = 1:40
    alleyeavgforcmo(a) = nanmean(alleyetrials2(a, 241:840));
    if isnan(alleyeavgforcmo(a)) == 1
        alleyeavgforcmo(a) = 0;
    end    
end

alleyetrials = allBehavioralData.AllFacialData.FORCOBJAllFacialVariables.BEHAVbyTRIALRAW.BYTRIALEyeArearaw;

alleyetrials2 = alleyetrials;
for a = 1:40
    alleyeavgforcobj(a) = nanmean(alleyetrials2(a, 241:840));
    if isnan(alleyeavgforcobj(a)) == 1
        alleyeavgforcobj(a) = 0;
    end    
end

alleyeavgboth = [alleyeavgforcobj, alleyeavgforcmo];

alleyeavgboth(find(alleyeavgboth == 0)) = NaN;

alleyeavg = (alleyeavgboth - nanmean(alleyeavgboth))/(nanstd(alleyeavgboth));

alleyeavg(find(isnan(alleyeavg))) = 0;
% create whisking matrices

allwhiskprotrials = allBehavioralData.AllAvoidanceData.FORCOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALwhiskproraw;

allwhiskprotrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allwhiskprotrials(a, :) == 1);
    allwhiskprotrials2(a,j) = 1;
    if nanmean(allwhiskprotrials2(a, 241:840)) > 0
    allwhiskproavgforcmo(a) = 1;
    else
    allwhiskproavgforcmo(a) = 0;
    end
end


allwhiskprotrials = allBehavioralData.AllAvoidanceData.FORCMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALwhiskproraw;


allwhiskprotrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allwhiskprotrials(a, :) == 1);
    allwhiskprotrials2(a,j) = 1;
    if nanmean(allwhiskprotrials2(a, 241:840)) > 0
    allwhiskproavgforcobj(a) = 1;
    else
    allwhiskproavgforcobj(a) = 0;
    end
end


allwhiskproavg = [allwhiskproavgforcobj, allwhiskproavgforcmo];

aversionvariables(1) = "runavoid";
aversionvariables(2) = "orbtight";
aversionvariables(3) = "whiskpro";

aversdesignmatrixFORC(1,:) = allavoidavg;
aversdesignmatrixFORC(2,:) = alleyeavg;
aversdesignmatrixFORC(3,:) = allwhiskproavg;

%% create matrix for locomotion, DLC movement & pupil

allmotiontrials = allBehavioralData.AllAvoidanceData.FORCOBJAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;

allmotiontrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allmotiontrials(a, :) == 1 | allmotiontrials(a, :) == 2 | allmotiontrials(a, :) == 3 | allmotiontrials(a, :) == 4 | allmotiontrials(a, :) == 5);
    allmotiontrials2(a,j) = 1;
    allmotionavgforcmo(a) = mode(allmotiontrials2(a, 241:840));
    allmotionavgforcmo2(a) = mode(allmotiontrials(a, 241:840));
end


allmotiontrials = allBehavioralData.AllAvoidanceData.FORCMOAllAvoidanceVariables.BEHAVbyTRIALRAW.BYTRIALrunavoidanceraw;


allmotiontrials2 = zeros(40, 1080);
for a = 1:40
    j = find(allmotiontrials(a, :) == 1 | allmotiontrials(a, :) == 2 | allmotiontrials(a, :) == 3 | allmotiontrials(a, :) == 4 | allmotiontrials(a, :) == 5);
    allmotiontrials2(a,j) = 1;
    allmotionavgforcobj(a) = mode(allmotiontrials2(a, 241:840));
    allmotionavgforcobj2(a) = mode(allmotiontrials(a, 241:840));
end

allmotionavg = [allmotionavgforcobj, allmotionavgforcmo];


%% DLCs
% whisk 1
DLCwhisk1trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk1m;
DLCwhisk2trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk2m;
DLCwhisk3trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk3m;
DLCwhisk4trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk4m;
DLCwhisk5trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk5m;
DLCwhisk6trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.whisk6m;

for a = 1:40
    DLCwhiskalltrial(a,:) = nanmedian([DLCwhisk1trials(a,:);DLCwhisk2trials(a,:);DLCwhisk3trials(a,:);DLCwhisk4trials(a,:);DLCwhisk5trials(a,:);DLCwhisk6trials(a,:)]);
    DLCwhiskavgtrial(a,:) = nanmean(DLCwhiskalltrial(a,121:420));
end

DLCwhiskavgtrialforcmo = DLCwhiskavgtrial';

for a = 1:40
    if isnan(DLCwhiskavgtrialforcmo(a)) == 1
        DLCwhiskavgtrialforcmo(a) = 0;
    end   
end

DLCwhisk1trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk1m;
DLCwhisk2trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk2m;
DLCwhisk3trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk3m;
DLCwhisk4trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk4m;
DLCwhisk5trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk5m;
DLCwhisk6trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.whisk6m;

for a = 1:40
    DLCwhiskalltrial(a,:) = nanmedian([DLCwhisk1trials(a,:);DLCwhisk2trials(a,:);DLCwhisk3trials(a,:);DLCwhisk4trials(a,:);DLCwhisk5trials(a,:);DLCwhisk6trials(a,:)]);
    DLCwhiskavgtrial(a,:) = nanmean(DLCwhiskalltrial(a,121:420));
end

DLCwhiskavgtrialforcobj = DLCwhiskavgtrial';

for a=1:40
    if isnan(DLCwhiskavgtrialforcobj(a)) == 1
        DLCwhiskavgtrialforcobj(a) = 0;
    end  
end

allwhiskingDLCavgboth = [DLCwhiskavgtrialforcobj, DLCwhiskavgtrialforcmo];

allwhiskingDLCavgboth(find(allwhiskingDLCavgboth == 0)) = NaN;

allwhiskingDLCavg = (allwhiskingDLCavgboth - nanmean(allwhiskingDLCavgboth))/(nanstd(allwhiskingDLCavgboth));

allwhiskingDLCavg(find(isnan(allwhiskingDLCavg))) = 0;



%% create eye DLC

% eye 1
DLCeye1trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye1m;
DLCeye2trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye2m;
DLCeye3trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye3m;
DLCeye4trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye4m;
DLCeye5trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye5m;
DLCeye6trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.eye6m;

for a = 1:40
    DLCeyealltrial(a,:) = nanmedian([DLCeye1trials(a,:);DLCeye2trials(a,:);DLCeye3trials(a,:);DLCeye4trials(a,:);DLCeye5trials(a,:);DLCeye6trials(a,:)]);
    DLCeyeavgtrial(a,:) = nanmean(DLCeyealltrial(a,121:420));
end

DLCeyeavgtrialforcmo = DLCeyeavgtrial';

for a = 1:40
    if isnan(DLCeyeavgtrialforcmo(a)) == 1
        DLCeyeavgtrialforcmo(a) = 0;
    end   
end

DLCeye1trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye1m;
DLCeye2trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye2m;
DLCeye3trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye3m;
DLCeye4trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye4m;
DLCeye5trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye5m;
DLCeye6trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.eye6m;

for a = 1:40
    DLCeyealltrial(a,:) = nanmedian([DLCeye1trials(a,:);DLCeye2trials(a,:);DLCeye3trials(a,:);DLCeye4trials(a,:);DLCeye5trials(a,:);DLCeye6trials(a,:)]);
    DLCeyeavgtrial(a,:) = nanmean(DLCeyealltrial(a,121:420));
end

DLCeyeavgtrialforcobj = DLCeyeavgtrial';

for a=1:40
    if isnan(DLCeyeavgtrialforcobj(a)) == 1
        DLCeyeavgtrialforcobj(a) = 0;
    end  
end

alleyeDLCavgboth = [DLCeyeavgtrialforcobj, DLCeyeavgtrialforcmo];

alleyeDLCavgboth(find(alleyeDLCavgboth == 0)) = NaN;

alleyeDLCavg = (alleyeDLCavgboth - nanmean(alleyeDLCavgboth))/(nanstd(alleyeDLCavgboth));

alleyeDLCavg(find(isnan(alleyeDLCavg))) = 0;




%% create pupil DLC

% pupil 1
DLCpupil1trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil1m;
DLCpupil2trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil2m;
DLCpupil3trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil3m;
DLCpupil4trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil4m;
DLCpupil5trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil5m;
DLCpupil6trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.pupil6m;

for a = 1:40
    DLCpupilalltrial(a,:) = nanmedian([DLCpupil1trials(a,:);DLCpupil2trials(a,:);DLCpupil3trials(a,:);DLCpupil4trials(a,:);DLCpupil5trials(a,:);DLCpupil6trials(a,:)]);
    DLCpupilavgtrial(a,:) = nanmean(DLCpupilalltrial(a,121:420));
end

DLCpupilavgtrialforcmo = DLCpupilavgtrial';

for a = 1:40
    if isnan(DLCpupilavgtrialforcmo(a)) == 1
        DLCpupilavgtrialforcmo(a) = 0;
    end   
end

DLCpupil1trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil1m;
DLCpupil2trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil2m;
DLCpupil3trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil3m;
DLCpupil4trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil4m;
DLCpupil5trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil5m;
DLCpupil6trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.pupil6m;

for a = 1:40
    DLCpupilalltrial(a,:) = nanmedian([DLCpupil1trials(a,:);DLCpupil2trials(a,:);DLCpupil3trials(a,:);DLCpupil4trials(a,:);DLCpupil5trials(a,:);DLCpupil6trials(a,:)]);
    DLCpupilavgtrial(a,:) = nanmean(DLCpupilalltrial(a,121:420));
end

DLCpupilavgtrialforcobj = DLCpupilavgtrial';

for a=1:40
    if isnan(DLCpupilavgtrialforcobj(a)) == 1
        DLCpupilavgtrialforcobj(a) = 0;
    end  
end

allpupilDLCavgboth = [DLCpupilavgtrialforcobj, DLCpupilavgtrialforcmo];

allpupilDLCavgboth(find(allpupilDLCavgboth == 0)) = NaN;

allpupilDLCavg = (allpupilDLCavgboth - nanmean(allpupilDLCavgboth))/(nanstd(allpupilDLCavgboth));

allpupilDLCavg(find(isnan(allpupilDLCavg))) = 0;

%%
% mouth 1
DLCmouth1trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.mouth1m;
DLCmouth2trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.mouth2m;
DLCmouth3trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.mouth3m;


for a = 1:40
    DLCmouthalltrial(a,:) = nanmedian([DLCmouth1trials(a,:);DLCmouth2trials(a,:);DLCmouth3trials(a,:)]);
    DLCmouthavgtrial(a,:) = nanmean(DLCmouthalltrial(a,121:420));
end

DLCmouthavgtrialforcmo = DLCmouthavgtrial';

for a = 1:40
    if isnan(DLCmouthavgtrialforcmo(a)) == 1
        DLCmouthavgtrialforcmo(a) = 0;
    end   
end

DLCmouth1trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.mouth1m;
DLCmouth2trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.mouth2m;
DLCmouth3trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.mouth3m;


for a = 1:40
    DLCmouthalltrial(a,:) = nanmedian([DLCmouth1trials(a,:);DLCmouth2trials(a,:);DLCmouth3trials(a,:)]);
    DLCmouthavgtrial(a,:) = nanmean(DLCmouthalltrial(a,121:420));
end

DLCmouthavgtrialforcobj = DLCmouthavgtrial';

for a=1:40
    if isnan(DLCmouthavgtrialforcobj(a)) == 1
        DLCmouthavgtrialforcobj(a) = 0;
    end  
end

allmouthDLCavgboth = [DLCmouthavgtrialforcobj, DLCmouthavgtrialforcmo];

allmouthDLCavgboth(find(allmouthDLCavgboth == 0)) = NaN;

allmouthDLCavg = (allmouthDLCavgboth - nanmean(allmouthDLCavgboth))/(nanstd(allmouthDLCavgboth));

allmouthDLCavg(find(isnan(allmouthDLCavg))) = 0;

%% create nose DLC
% nose 1
DLCnose1trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.nose1m;
DLCnose2trials = DLCALLVariables.FORCMODLCALL.TRIALRAW.nose2m;



for a = 1:40
    DLCnosealltrial(a,:) = nanmedian([DLCnose1trials(a,:);DLCnose2trials(a,:)]);
    DLCnoseavgtrial(a,:) = nanmean(DLCnosealltrial(a,121:420));
end

DLCnoseavgtrialforcmo = DLCnoseavgtrial';

for a = 1:40
    if isnan(DLCnoseavgtrialforcmo(a)) == 1
        DLCnoseavgtrialforcmo(a) = 0;
    end   
end

DLCnose1trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.nose1m;
DLCnose2trials = DLCALLVariables.FORCOBJDLCALL.TRIALRAW.nose2m;


for a = 1:40
    DLCnosealltrial(a,:) = nanmedian([DLCnose1trials(a,:);DLCnose2trials(a,:)]);
    DLCnoseavgtrial(a,:) = nanmean(DLCnosealltrial(a,121:420));
end

DLCnoseavgtrialforcobj = DLCnoseavgtrial';

for a=1:40
    if isnan(DLCnoseavgtrialforcobj(a)) == 1
        DLCnoseavgtrialforcobj(a) = 0;
    end  
end

allnoseDLCavgboth = [DLCnoseavgtrialforcobj, DLCnoseavgtrialforcmo];

allnoseDLCavgboth(find(allnoseDLCavgboth == 0)) = NaN;

allnoseDLCavg = (allnoseDLCavgboth - nanmean(allnoseDLCavgboth))/(nanstd(allnoseDLCavgboth));

allnoseDLCavg(find(isnan(allnoseDLCavg))) = 0;
%% create design matrix for DLC labels only

DLCvariables(1) = "whiskingDLC";
DLCvariables(2) = "eyeDLC";
DLCvariables(3) = "pupilDLC";
DLCvariables(4) = "mouthDLC";
DLCvariables(5) = "noseDLC";

DLCdesignmatrixFORC(1,:) = allwhiskingDLCavg;
DLCdesignmatrixFORC(2,:) = alleyeDLCavg;
DLCdesignmatrixFORC(3,:) = allpupilDLCavg;
DLCdesignmatrixFORC(4,:) = allmouthDLCavg;
DLCdesignmatrixFORC(5,:) = allnoseDLCavg;



%% create additional behavior matrices

% create pupil matrices

allpupiltrials = allBehavioralData.PupilTRIALData.pupiltrialFORCOBJ;

allpupiltrials2 = allpupiltrials;
for a = 1:40
    allpupilsizeavgforcobj(a) = nanmean(allpupiltrials2(a, 241:840));
    if isnan(allpupilsizeavgforcobj(a)) == 1
        allpupilsizeavgforcobj(a) = 0;
    end    
end

allpupiltrials = allBehavioralData.PupilTRIALData.pupiltrialFORCMO;

allpupiltrials2 = allpupiltrials;
for a = 1:40
    allpupilsizeavgforcmo(a) = nanmean(allpupiltrials2(a, 241:840));
    if isnan(allpupilsizeavgforcmo(a)) == 1
        allpupilsizeavgforcmo(a) = 0;
    end    
end

allpupilavgboth = [allpupilsizeavgforcobj, allpupilsizeavgforcmo];

allpupilavgboth(find(allpupilavgboth == 0)) = NaN;

allpupilavg = (allpupilavgboth - nanmean(allpupilavgboth))/(nanstd(allpupilavgboth));

allpupilavg(find(isnan(allpupilavg))) = 0;

% create running matrices

allrunningtrials = allBehavioralData.RunTRIALData.runningtrialFORCOBJ;

allrunningtrials2 = allrunningtrials;
for a = 1:40
    allrunningavgforcobj(a) = nanmean(allrunningtrials2(a, 241:840));
    if isnan(allrunningavgforcobj(a)) == 1
        allrunningavgforcobj(a) = 0;
    end    
end

allrunningtrials = allBehavioralData.RunTRIALData.runningtrialFORCMO;

allrunningtrials2 = allrunningtrials;
for a = 1:40
    allrunningavgforcmo(a) = nanmean(allrunningtrials2(a, 241:840));
    if isnan(allrunningavgforcmo(a)) == 1
        allrunningavgforcmo(a) = 0;
    end    
end

allrunningavgboth = [allrunningavgforcobj, allrunningavgforcmo];

allrunningavgboth(find(allrunningavgboth == 0)) = NaN;

allrunningavg = (allrunningavgboth - nanmean(allrunningavgboth))/(nanstd(allrunningavgboth));

allrunningavg(find(isnan(allrunningavg))) = 0;

% create saccades matrices


allsaccadestrials = allBehavioralData.AllFacialData.FORCOBJAllFacialVariables.BEHAVbyTRIALFILT.BYTRIALpupilSaccades;


allsaccadestrials2 = allsaccadestrials;
for a = 1:40
    allsaccadesavgforcobj(a) = nanmean(allsaccadestrials2(a, 241:840));
    if isnan(allsaccadesavgforcobj(a)) == 1
        allsaccadesavgforcobj(a) = 0;
    end    
end

allsaccadestrials = allBehavioralData.AllFacialData.FORCMOAllFacialVariables.BEHAVbyTRIALFILT.BYTRIALpupilSaccades;

allsaccadestrials2 = allsaccadestrials;
for a = 1:40
    allsaccadesavgforcmo(a) = nanmean(allsaccadestrials2(a, 241:840));
    if isnan(allsaccadesavgforcmo(a)) == 1
        allsaccadesavgforcmo(a) = 0;
    end    
end

allsaccadesavgboth = [allsaccadesavgforcobj, allsaccadesavgforcmo];

allsaccadesavgboth(find(allsaccadesavgboth == 0)) = NaN;

allsaccadesavg = (allsaccadesavgboth - nanmean(allsaccadesavgboth))/(nanstd(allsaccadesavgboth));

allsaccadesavg(find(isnan(allsaccadesavg))) = 0;

otherbehavvariables(1) = "pupil";
otherbehavvariables(2) = "running";
otherbehavvariables(3) = "saccades";
otherbehavvariables(4) = "motionbi";

otherdesignmatrixFORC(1,:) = allpupilavg;
otherdesignmatrixFORC(2,:) = allrunningavg;
otherdesignmatrixFORC(3,:) = allsaccadesavg;
otherdesignmatrixFORC(4,:) = allmotionavg;


%% get Y matrix for neural firing

S1allcells = allTrialData.S1trials.S1BINNEDstimsVOLOBJ;

for a = 1:length(S1allcells)
    for n = 1:40
        newS1allcells(n) = nanmean(S1allcells{a}(n, 41:140));
    end
S1VOLOBJbinnedcells(a,:) =  newS1allcells; 
end

STRallcells = allTrialData.STRtrials.STRBINNEDstimsVOLOBJ;

for a = 1:length(STRallcells)
    for n = 1:40
        newSTRallcells(n) = nanmean(STRallcells{a}(n, 41:140));
    end
STRVOLOBJbinnedcells(a,:) =  newSTRallcells; 
end

BLAallcells = allTrialData.BLAtrials.BLABINNEDstimsVOLOBJ;

for a = 1:length(BLAallcells)
    for n = 1:40
        newBLAallcells(n) = nanmean(BLAallcells{a}(n, 41:140));
    end
BLAVOLOBJbinnedcells(a,:) =  newBLAallcells; 
end
%%

S1allcells = allTrialData.S1trials.S1BINNEDstimsVOLMO;

for a = 1:length(S1allcells)
    for n = 1:40
        newS1allcells(n) = nanmean(S1allcells{a}(n, 41:140));
    end
S1VOLMObinnedcells(a,:) =  newS1allcells; 
end

STRallcells = allTrialData.STRtrials.STRBINNEDstimsVOLMO;

for a = 1:length(STRallcells)
    for n = 1:40
        newSTRallcells(n) = nanmean(STRallcells{a}(n, 41:140));
    end
STRVOLMObinnedcells(a,:) =  newSTRallcells; 
end

BLAallcells = allTrialData.BLAtrials.BLABINNEDstimsVOLMO;

for a = 1:length(BLAallcells)
    for n = 1:40
        newBLAallcells(n) = nanmean(BLAallcells{a}(n, 41:140));
    end
BLAVOLMObinnedcells(a,:) =  newBLAallcells; 
end
%%

for a = 1:length(S1allcells)
    S1VOLCatbinnedboth(a,:) = [S1VOLOBJbinnedcells(a,:), S1VOLMObinnedcells(a,:)];
    zerocells = find(S1VOLCatbinnedboth(a,:) == 0);
    S1VOLCatbinnedboth(a,zerocells) = NaN;
    S1VOLCatbinned(a,:) = (S1VOLCatbinnedboth(a,:) - nanmean(S1VOLCatbinnedboth(a,:)))/(nanstd(S1VOLCatbinnedboth(a,:)));
    nancells = find(isnan(S1VOLCatbinned(a,:)));
    S1VOLCatbinned(a,nancells) = 0;
end

for a = 1:length(STRallcells)
    STRVOLCatbinnedboth(a,:) = [STRVOLOBJbinnedcells(a,:), STRVOLMObinnedcells(a,:)];
    zerocells = find(STRVOLCatbinnedboth(a,:) == 0);
    STRVOLCatbinnedboth(a,zerocells) = NaN;
    STRVOLCatbinned(a,:) = (STRVOLCatbinnedboth(a,:) - nanmean(STRVOLCatbinnedboth(a,:)))/(nanstd(STRVOLCatbinnedboth(a,:)));
    nancells = find(isnan(STRVOLCatbinned(a,:)));
    STRVOLCatbinned(a,nancells) = 0;
end

for a = 1:length(BLAallcells)
    BLAVOLCatbinnedboth(a,:) = [BLAVOLOBJbinnedcells(a,:), BLAVOLMObinnedcells(a,:)];
    zerocells = find(BLAVOLCatbinnedboth(a,:) == 0);
    BLAVOLCatbinnedboth(a,zerocells) = NaN;
    BLAVOLCatbinned(a,:) = (BLAVOLCatbinnedboth(a,:) - nanmean(BLAVOLCatbinnedboth(a,:)))/(nanstd(BLAVOLCatbinnedboth(a,:)));
    nancells = find(isnan(BLAVOLCatbinned(a,:)));
    BLAVOLCatbinned(a,nancells) = 0;
end

%% get Y matrix for neural firing FORC


S1allcells = allTrialData.S1trials.S1BINNEDstimsFORCOBJ;

for a = 1:length(S1allcells)
    for n = 1:40
        newS1allcells(n) = nanmean(S1allcells{a}(n, 41:140));
    end
S1FORCOBJbinnedcells(a,:) =  newS1allcells; 
end

STRallcells = allTrialData.STRtrials.STRBINNEDstimsFORCOBJ;

for a = 1:length(STRallcells)
    for n = 1:40
        newSTRallcells(n) = nanmean(STRallcells{a}(n, 41:140));
    end
STRFORCOBJbinnedcells(a,:) =  newSTRallcells; 
end

BLAallcells = allTrialData.BLAtrials.BLABINNEDstimsFORCOBJ;

for a = 1:length(BLAallcells)
    for n = 1:40
        newBLAallcells(n) = nanmean(BLAallcells{a}(n, 41:140));
    end
BLAFORCOBJbinnedcells(a,:) =  newBLAallcells; 
end
%%

S1allcells = allTrialData.S1trials.S1BINNEDstimsFORCMO;

for a = 1:length(S1allcells)
    for n = 1:40
        newS1allcells(n) = nanmean(S1allcells{a}(n, 41:140));
    end
S1FORCMObinnedcells(a,:) =  newS1allcells; 
end

STRallcells = allTrialData.STRtrials.STRBINNEDstimsFORCMO;

for a = 1:length(STRallcells)
    for n = 1:40
        newSTRallcells(n) = nanmean(STRallcells{a}(n, 41:140));
    end
STRFORCMObinnedcells(a,:) =  newSTRallcells; 
end

BLAallcells = allTrialData.BLAtrials.BLABINNEDstimsFORCMO;

for a = 1:length(BLAallcells)
    for n = 1:40
        newBLAallcells(n) = nanmean(BLAallcells{a}(n, 41:140));
    end
BLAFORCMObinnedcells(a,:) =  newBLAallcells; 
end
%%

for a = 1:length(S1allcells)
    S1FORCCatbinnedboth(a,:) = [S1FORCOBJbinnedcells(a,:), S1FORCMObinnedcells(a,:)];
    zerocells = find(S1FORCCatbinnedboth(a,:) == 0);
    S1FORCCatbinnedboth(a,zerocells) = NaN;
    S1FORCCatbinned(a,:) = (S1FORCCatbinnedboth(a,:) - nanmean(S1FORCCatbinnedboth(a,:)))/(nanstd(S1FORCCatbinnedboth(a,:)));
    nancells = find(isnan(S1FORCCatbinned(a,:)));
    S1FORCCatbinned(a,nancells) = 0;
end

for a = 1:length(STRallcells)
    STRFORCCatbinnedboth(a,:) = [STRFORCOBJbinnedcells(a,:), STRFORCMObinnedcells(a,:)];
    zerocells = find(STRFORCCatbinnedboth(a,:) == 0);
    STRFORCCatbinnedboth(a,zerocells) = NaN;
    STRFORCCatbinned(a,:) = (STRFORCCatbinnedboth(a,:) - nanmean(STRFORCCatbinnedboth(a,:)))/(nanstd(STRFORCCatbinnedboth(a,:)));
    nancells = find(isnan(STRFORCCatbinned(a,:)));
    STRFORCCatbinned(a,nancells) = 0;
end

for a = 1:length(BLAallcells)
    BLAFORCCatbinnedboth(a,:) = [BLAFORCOBJbinnedcells(a,:), BLAFORCMObinnedcells(a,:)];
    zerocells = find(BLAFORCCatbinnedboth(a,:) == 0);
    BLAFORCCatbinnedboth(a,zerocells) = NaN;
    BLAFORCCatbinned(a,:) = (BLAFORCCatbinnedboth(a,:) - nanmean(BLAFORCCatbinnedboth(a,:)))/(nanstd(BLAFORCCatbinnedboth(a,:)));
    nancells = find(isnan(BLAFORCCatbinned(a,:)));
    BLAFORCCatbinned(a,nancells) = 0;
end

%% save each design matrix and neural data matrix for VOL
mkdir AllModelDesignMatricesAVGZScore
cd AllModelDesignMatricesAVGZScore

save("StimDesignMatrix", "stimdesignmatrix");
save("AversDesignMatrixVOL", "aversdesignmatrixVOL");

stimaverdesignmatrixVOL = [stimdesignmatrix; aversdesignmatrixVOL];
save("StimAversDesignMatrixVOL", "stimaverdesignmatrixVOL");

save("DLCDesignMatrixVOL", "DLCdesignmatrixVOL");

save("AddBehDesignMatrixVOL", "otherdesignmatrixVOL");

alldesignmatrixVOL = [stimdesignmatrix; aversdesignmatrixVOL; DLCdesignmatrixVOL; otherdesignmatrixVOL];

save("ALLStimBehMatrixVOL", "alldesignmatrixVOL");
%%
save("AversDesignMatrixFORC", "aversdesignmatrixFORC");

stimaverdesignmatrixFORC = [stimdesignmatrix; aversdesignmatrixFORC];
save("StimAversDesignMatrixFORC", "stimaverdesignmatrixFORC");

save("DLCDesignMatrixFORC", "DLCdesignmatrixFORC");

save("AddBehDesignMatrixFORC", "otherdesignmatrixFORC");

alldesignmatrixFORC = [stimdesignmatrix; aversdesignmatrixFORC; DLCdesignmatrixFORC; otherdesignmatrixFORC];

save("ALLStimBehMatrixFORC", "alldesignmatrixFORC");
%%

save("S1VOLCellMatrix", "S1VOLCatbinned");
save("STRVOLCellMatrix", "STRVOLCatbinned");
save("BLASVOLCellMatrix", "BLAVOLCatbinned");

save("S1FORCCellMatrix", "S1FORCCatbinned");
save("STRFORCCellMatrix", "STRFORCCatbinned");
save("BLASFORCCellMatrix", "BLAFORCCatbinned");
