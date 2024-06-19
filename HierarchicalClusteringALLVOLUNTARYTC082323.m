%% Create the groups for genotype

badS1WTVOLALL = find(all(isnan(WTS1cellsVOLALLNONSORT),2));

WTS1cellsVOLALLNONSORT(badS1WTVOLALL,:) = [];

badS1KOVOLALL = find(all(isnan(KOS1cellsVOLALLNONSORT),2));

KOS1cellsVOLALLNONSORT(badS1KOVOLALL,:) = [];

%%

allvolsocialS1WTALL(badS1WTVOLALL,:) = [];
allvolsocialS1KOALL(badS1KOVOLALL,:) = [];

allvolsocialS1WTZALL(badS1WTVOLALL,:) = [];
allvolsocialS1KOZALL(badS1KOVOLALL,:) = [];

allvolobjS1WTALL(badS1WTVOLALL,:) = [];
allvolobjS1KOALL(badS1KOVOLALL,:) = [];

allvolobjS1WTZALL(badS1WTVOLALL,:) = [];
allvolobjS1KOZALL(badS1KOVOLALL,:) = [];

%%

allvolsocialS1WTMODInd(badS1WTVOLALL) = [];
allvolsocialS1KOMODInd(badS1KOVOLALL) = [];
allvolobjS1WTMODInd(badS1WTVOLALL) = [];
allvolobjS1KOMODInd(badS1KOVOLALL) = [];

%% edit the other mod indices and AUC values

allvolsocialS1WTMODIndSTIM(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndSTIM(badS1KOVOLALL) = [];

allvolobjS1WTMODIndSTIM(badS1WTVOLALL) = [];
allvolobjS1KOMODIndSTIM(badS1KOVOLALL) = [];

allvolsocialS1WTMODIndSHORTSTIM(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndSHORTSTIM(badS1KOVOLALL) = [];

allvolobjS1WTMODIndSHORTSTIM(badS1WTVOLALL) = [];
allvolobjS1KOMODIndSHORTSTIM(badS1KOVOLALL) = [];

allvolsocialS1WTMODIndPLAT(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndPLAT(badS1KOVOLALL) = [];

allvolobjS1WTMODIndPLAT(badS1WTVOLALL) = [];
allvolobjS1KOMODIndPLAT(badS1KOVOLALL) = [];


allvolS1WTAUCSTIM(badS1WTVOLALL) = [];
allvolS1KOAUCSTIM(badS1KOVOLALL) = [];

allvolS1WTAUCSHORTSTIM(badS1WTVOLALL) = [];
allvolS1KOAUCSHORTSTIM(badS1KOVOLALL) = [];

allvolS1WTAUCPLAT(badS1WTVOLALL) = [];
allvolS1KOAUCPLAT(badS1KOVOLALL) = [];

%% additional mod indices & latency

allvolsocialS1WTMODIndFIRST10(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndFIRST10(badS1KOVOLALL) = [];

allvolobjS1WTMODIndFIRST10(badS1WTVOLALL) = [];
allvolobjS1KOMODIndFIRST10(badS1KOVOLALL) = [];

allvolsocialS1WTMODIndPLATFIRST10(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndPLATFIRST10(badS1KOVOLALL) = [];

allvolobjS1WTMODIndPLATFIRST10(badS1WTVOLALL) = [];
allvolobjS1KOMODIndPLATFIRST10(badS1KOVOLALL) = [];

allvolsocialS1WTMODIndSHORTSTIMFIRST10(badS1WTVOLALL) = [];
allvolsocialS1KOMODIndSHORTSTIMFIRST10(badS1KOVOLALL) = [];

allvolobjS1WTMODIndSHORTSTIMFIRST10(badS1WTVOLALL) = [];
allvolobjS1KOMODIndSHORTSTIMFIRST10(badS1KOVOLALL) = [];

allvolsocialS1WTLATENCYONSET(badS1WTVOLALL) = [];
allvolsocialS1KOLATENCYONSET(badS1KOVOLALL) = [];

allvolobjS1WTLATENCYONSET(badS1WTVOLALL) = [];
allvolobjS1KOLATENCYONSET(badS1KOVOLALL) = [];

allvolsocialS1WTLATENCYEND(badS1WTVOLALL) = [];
allvolsocialS1KOLATENCYEND(badS1KOVOLALL) = [];

allvolobjS1WTLATENCYEND(badS1WTVOLALL) = [];
allvolobjS1KOLATENCYEND(badS1KOVOLALL) = [];

%% spont activity
allvolS1WTSPONT(badS1WTVOLALL,:) = [];
allvolS1KOSPONT(badS1KOVOLALL,:) = [];
%% layers

allS1WTunitlayers(badS1WTVOLALL) = [];
allS1KOunitlayers(badS1KOVOLALL) = [];

%%
allvolsocialS1WTTRIALS(badS1WTVOLALL,:) = [];
allvolsocialS1KOTRIALS(badS1KOVOLALL,:) = [];

allvolobjS1WTTRIALS(badS1WTVOLALL,:) = [];
allvolobjS1KOTRIALS(badS1KOVOLALL,:) = [];

allvolsocialS1WTTRIALSSpks(badS1WTVOLALL,:) = [];
allvolsocialS1KOTRIALSSpks(badS1KOVOLALL,:) = [];

allvolobjS1WTTRIALSSpks(badS1WTVOLALL,:) = [];
allvolobjS1KOTRIALSSpks(badS1KOVOLALL,:) = [];

%%

S1mouseIDWT(badS1WTVOLALL) = [];
S1mouseIDKO(badS1KOVOLALL) = [];


%%

groupS1volALL(1:size(WTS1cellsVOLALLNONSORT,1)) = "WT";
groupS1volALL(1+size(WTS1cellsVOLALLNONSORT,1):size(WTS1cellsVOLALLNONSORT,1)+size(KOS1cellsVOLALLNONSORT,1)) = "KO";

S1volALL = [WTS1cellsVOLALLNONSORT;KOS1cellsVOLALLNONSORT];

ALLS1VOLSOCZ = [allvolsocialS1WTZALL;allvolsocialS1KOZALL];

ALLS1VOLSOC = [allvolsocialS1WTALL;allvolsocialS1KOALL];

ALLS1VOLOBJZ = [allvolobjS1WTZALL;allvolobjS1KOZALL];

ALLS1VOLOBJ = [allvolobjS1WTALL;allvolobjS1KOALL];

%%

allvolsocialS1MODInd = [allvolsocialS1WTMODInd, allvolsocialS1KOMODInd];
allvolobjS1MODInd = [allvolobjS1WTMODInd, allvolobjS1KOMODInd];


%% Combine new mod indices and AUC

allvolsocialS1MODIndSTIM = [allvolsocialS1WTMODIndSTIM, allvolsocialS1KOMODIndSTIM];
allvolobjS1MODIndSTIM = [allvolobjS1WTMODIndSTIM, allvolobjS1KOMODIndSTIM];

allvolsocialS1MODIndSHORTSTIM = [allvolsocialS1WTMODIndSHORTSTIM, allvolsocialS1KOMODIndSHORTSTIM];
allvolobjS1MODIndSHORTSTIM = [allvolobjS1WTMODIndSHORTSTIM, allvolobjS1KOMODIndSHORTSTIM];

allvolsocialS1MODIndPLAT = [allvolsocialS1WTMODIndPLAT, allvolsocialS1KOMODIndPLAT];
allvolobjS1MODIndPLAT = [allvolobjS1WTMODIndPLAT, allvolobjS1KOMODIndPLAT];


allvolsocialS1MODIndFIRST10 = [allvolsocialS1WTMODIndFIRST10, allvolsocialS1KOMODIndFIRST10];
allvolobjS1MODIndFIRST10 = [allvolobjS1WTMODIndFIRST10, allvolobjS1KOMODIndFIRST10];

allvolsocialS1MODIndPLATFIRST10 = [allvolsocialS1WTMODIndPLATFIRST10, allvolsocialS1KOMODIndPLATFIRST10];
allvolobjS1MODIndPLATFIRST10 = [allvolobjS1WTMODIndPLATFIRST10, allvolobjS1KOMODIndPLATFIRST10];

allvolsocialS1MODIndSHORTSTIMFIRST10 = [allvolsocialS1WTMODIndSHORTSTIMFIRST10, allvolsocialS1KOMODIndSHORTSTIMFIRST10];
allvolobjS1MODIndSHORTSTIMFIRST10 = [allvolobjS1WTMODIndSHORTSTIMFIRST10, allvolobjS1KOMODIndSHORTSTIMFIRST10];

allvolsocialS1LATENCYONSET = [allvolsocialS1WTLATENCYONSET, allvolsocialS1KOLATENCYONSET];
allvolobjS1LATENCYONSET = [allvolobjS1WTLATENCYONSET, allvolobjS1KOLATENCYONSET];

allvolsocialS1LATENCYEND = [allvolsocialS1WTLATENCYEND, allvolsocialS1KOLATENCYEND];
allvolobjS1LATENCYEND = [allvolobjS1WTLATENCYEND, allvolobjS1KOLATENCYEND];

allvolS1AUCSTIM = [allvolS1WTAUCSTIM, allvolS1KOAUCSTIM];

allvolS1AUCSHORTSTIM = [allvolS1WTAUCSHORTSTIM, allvolS1KOAUCSHORTSTIM];

allvolS1AUCPLAT = [allvolS1WTAUCPLAT, allvolS1KOAUCPLAT];


%%


allvolS1WTTRIALS= [allvolsocialS1WTTRIALS';allvolobjS1WTTRIALS'];
allvolS1KOTRIALS= [allvolsocialS1KOTRIALS';allvolobjS1KOTRIALS'];

allvolS1WTTRIALSSpks= [allvolsocialS1WTTRIALSSpks';allvolobjS1WTTRIALSSpks'];
allvolS1KOTRIALSSpks= [allvolsocialS1KOTRIALSSpks';allvolobjS1KOTRIALSSpks'];



%
%
%

%%

badSTRWTVOLALL = find(all(isnan(WTSTRcellsVOLALLNONSORT),2));

WTSTRcellsVOLALLNONSORT(badSTRWTVOLALL,:) = [];

badSTRKOVOLALL = find(all(isnan(KOSTRcellsVOLALLNONSORT),2));

KOSTRcellsVOLALLNONSORT(badSTRKOVOLALL,:) = [];

%%
allvolsocialSTRWTALL(badSTRWTVOLALL,:) = [];
allvolsocialSTRKOALL(badSTRKOVOLALL,:) = [];

allvolsocialSTRWTZALL(badSTRWTVOLALL,:) = [];
allvolsocialSTRKOZALL(badSTRKOVOLALL,:) = [];

allvolobjSTRWTALL(badSTRWTVOLALL,:) = [];
allvolobjSTRKOALL(badSTRKOVOLALL,:) = [];

allvolobjSTRWTZALL(badSTRWTVOLALL,:) = [];
allvolobjSTRKOZALL(badSTRKOVOLALL,:) = [];

%%
allvolsocialSTRWTMODInd(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODInd(badSTRKOVOLALL) = [];
allvolobjSTRWTMODInd(badSTRWTVOLALL) = [];
allvolobjSTRKOMODInd(badSTRKOVOLALL) = [];

%% edit the other mod indices and AUC values

allvolsocialSTRWTMODIndSTIM(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndSTIM(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndSTIM(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndSTIM(badSTRKOVOLALL) = [];

allvolsocialSTRWTMODIndSHORTSTIM(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndSHORTSTIM(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndSHORTSTIM(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndSHORTSTIM(badSTRKOVOLALL) = [];

allvolsocialSTRWTMODIndPLAT(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndPLAT(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndPLAT(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndPLAT(badSTRKOVOLALL) = [];

allvolSTRWTAUCSTIM(badSTRWTVOLALL) = [];
allvolSTRKOAUCSTIM(badSTRKOVOLALL) = [];

allvolSTRWTAUCSHORTSTIM(badSTRWTVOLALL) = [];
allvolSTRKOAUCSHORTSTIM(badSTRKOVOLALL) = [];

allvolSTRWTAUCPLAT(badSTRWTVOLALL) = [];
allvolSTRKOAUCPLAT(badSTRKOVOLALL) = [];

%%

allvolsocialSTRWTMODIndFIRST10(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndFIRST10(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndFIRST10(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndFIRST10(badSTRKOVOLALL) = [];

allvolsocialSTRWTMODIndPLATFIRST10(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndPLATFIRST10(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndPLATFIRST10(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndPLATFIRST10(badSTRKOVOLALL) = [];

allvolsocialSTRWTMODIndSHORTSTIMFIRST10(badSTRWTVOLALL) = [];
allvolsocialSTRKOMODIndSHORTSTIMFIRST10(badSTRKOVOLALL) = [];

allvolobjSTRWTMODIndSHORTSTIMFIRST10(badSTRWTVOLALL) = [];
allvolobjSTRKOMODIndSHORTSTIMFIRST10(badSTRKOVOLALL) = [];

allvolsocialSTRWTLATENCYONSET(badSTRWTVOLALL) = [];
allvolsocialSTRKOLATENCYONSET(badSTRKOVOLALL) = [];

allvolobjSTRWTLATENCYONSET(badSTRWTVOLALL) = [];
allvolobjSTRKOLATENCYONSET(badSTRKOVOLALL) = [];

allvolsocialSTRWTLATENCYEND(badSTRWTVOLALL) = [];
allvolsocialSTRKOLATENCYEND(badSTRKOVOLALL) = [];

allvolobjSTRWTLATENCYEND(badSTRWTVOLALL) = [];
allvolobjSTRKOLATENCYEND(badSTRKOVOLALL) = [];

%% spont activity
allvolSTRWTSPONT(badSTRWTVOLALL,:) = [];
allvolSTRKOSPONT(badSTRKOVOLALL,:) = [];

%%

allvolsocialSTRWTTRIALS(badSTRWTVOLALL,:) = [];
allvolsocialSTRKOTRIALS(badSTRKOVOLALL,:) = [];

allvolobjSTRWTTRIALS(badSTRWTVOLALL,:) = [];
allvolobjSTRKOTRIALS(badSTRKOVOLALL,:) = [];

allvolsocialSTRWTTRIALSSpks(badSTRWTVOLALL,:) = [];
allvolsocialSTRKOTRIALSSpks(badSTRKOVOLALL,:) = [];

allvolobjSTRWTTRIALSSpks(badSTRWTVOLALL,:) = [];
allvolobjSTRKOTRIALSSpks(badSTRKOVOLALL,:) = [];


%%

STRmouseIDWT(badSTRWTVOLALL) = [];
STRmouseIDKO(badSTRKOVOLALL) = [];

%%

groupSTRvolALL(1:size(WTSTRcellsVOLALLNONSORT,1)) = "WT";
groupSTRvolALL(1+size(WTSTRcellsVOLALLNONSORT,1):size(WTSTRcellsVOLALLNONSORT,1)+size(KOSTRcellsVOLALLNONSORT,1)) = "KO";

STRvolALL = [WTSTRcellsVOLALLNONSORT;KOSTRcellsVOLALLNONSORT];

ALLSTRVOLSOCZ = [allvolsocialSTRWTZALL;allvolsocialSTRKOZALL];

ALLSTRVOLSOC = [allvolsocialSTRWTALL;allvolsocialSTRKOALL];

ALLSTRVOLOBJZ = [allvolobjSTRWTZALL;allvolobjSTRKOZALL];

ALLSTRVOLOBJ = [allvolobjSTRWTALL;allvolobjSTRKOALL];

%
%
%

%%

allvolsocialSTRMODInd = [allvolsocialSTRWTMODInd, allvolsocialSTRKOMODInd];
allvolobjSTRMODInd = [allvolobjSTRWTMODInd, allvolobjSTRKOMODInd];

%% Combine new mod indices and AUC

allvolsocialSTRMODIndSTIM = [allvolsocialSTRWTMODIndSTIM, allvolsocialSTRKOMODIndSTIM];
allvolobjSTRMODIndSTIM = [allvolobjSTRWTMODIndSTIM, allvolobjSTRKOMODIndSTIM];

allvolsocialSTRMODIndSHORTSTIM = [allvolsocialSTRWTMODIndSHORTSTIM, allvolsocialSTRKOMODIndSHORTSTIM];
allvolobjSTRMODIndSHORTSTIM = [allvolobjSTRWTMODIndSHORTSTIM, allvolobjSTRKOMODIndSHORTSTIM];

allvolsocialSTRMODIndPLAT = [allvolsocialSTRWTMODIndPLAT, allvolsocialSTRKOMODIndPLAT];
allvolobjSTRMODIndPLAT = [allvolobjSTRWTMODIndPLAT, allvolobjSTRKOMODIndPLAT];

allvolsocialSTRMODIndFIRST10 = [allvolsocialSTRWTMODIndFIRST10, allvolsocialSTRKOMODIndFIRST10];
allvolobjSTRMODIndFIRST10 = [allvolobjSTRWTMODIndFIRST10, allvolobjSTRKOMODIndFIRST10];

allvolsocialSTRMODIndPLATFIRST10 = [allvolsocialSTRWTMODIndPLATFIRST10, allvolsocialSTRKOMODIndPLATFIRST10];
allvolobjSTRMODIndPLATFIRST10 = [allvolobjSTRWTMODIndPLATFIRST10, allvolobjSTRKOMODIndPLATFIRST10];

allvolsocialSTRMODIndSHORTSTIMFIRST10 = [allvolsocialSTRWTMODIndSHORTSTIMFIRST10, allvolsocialSTRKOMODIndSHORTSTIMFIRST10];
allvolobjSTRMODIndSHORTSTIMFIRST10 = [allvolobjSTRWTMODIndSHORTSTIMFIRST10, allvolobjSTRKOMODIndSHORTSTIMFIRST10];

allvolsocialSTRLATENCYONSET = [allvolsocialSTRWTLATENCYONSET, allvolsocialSTRKOLATENCYONSET];
allvolobjSTRLATENCYONSET = [allvolobjSTRWTLATENCYONSET, allvolobjSTRKOLATENCYONSET];

allvolsocialSTRLATENCYEND = [allvolsocialSTRWTLATENCYEND, allvolsocialSTRKOLATENCYEND];
allvolobjSTRLATENCYEND = [allvolobjSTRWTLATENCYEND, allvolobjSTRKOLATENCYEND];

allvolSTRAUCSTIM = [allvolSTRWTAUCSTIM, allvolSTRKOAUCSTIM];

allvolSTRAUCSHORTSTIM = [allvolSTRWTAUCSHORTSTIM, allvolSTRKOAUCSHORTSTIM];

allvolSTRAUCPLAT = [allvolSTRWTAUCPLAT, allvolSTRKOAUCPLAT];



%%

allvolSTRWTTRIALS= [allvolsocialSTRWTTRIALS';allvolobjSTRWTTRIALS'];
allvolSTRKOTRIALS= [allvolsocialSTRKOTRIALS';allvolobjSTRKOTRIALS'];

allvolSTRWTTRIALSSpks= [allvolsocialSTRWTTRIALSSpks';allvolobjSTRWTTRIALSSpks'];
allvolSTRKOTRIALSSpks= [allvolsocialSTRKOTRIALSSpks';allvolobjSTRKOTRIALSSpks'];
%
%
%

%%
badBLAWTVOLALL = find(all(isnan(WTBLAcellsVOLALLNONSORT),2));

WTBLAcellsVOLALLNONSORT(badBLAWTVOLALL,:) = [];

badBLAKOVOLALL = find(all(isnan(KOBLAcellsVOLALLNONSORT),2));

KOBLAcellsVOLALLNONSORT(badBLAKOVOLALL,:) = [];

%%

allvolsocialBLAWTALL(badBLAWTVOLALL,:) = [];
allvolsocialBLAKOALL(badBLAKOVOLALL,:) = [];

allvolsocialBLAWTZALL(badBLAWTVOLALL,:) = [];
allvolsocialBLAKOZALL(badBLAKOVOLALL,:) = [];

allvolobjBLAWTALL(badBLAWTVOLALL,:) = [];
allvolobjBLAKOALL(badBLAKOVOLALL,:) = [];

allvolobjBLAWTZALL(badBLAWTVOLALL,:) = [];
allvolobjBLAKOZALL(badBLAKOVOLALL,:) = [];

%%
allvolsocialBLAWTMODInd(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODInd(badBLAKOVOLALL) = [];
allvolobjBLAWTMODInd(badBLAWTVOLALL) = [];
allvolobjBLAKOMODInd(badBLAKOVOLALL) = [];

%% edit the other mod indices and AUC values

allvolsocialBLAWTMODIndSTIM(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndSTIM(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndSTIM(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndSTIM(badBLAKOVOLALL) = [];

allvolsocialBLAWTMODIndSHORTSTIM(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndSHORTSTIM(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndSHORTSTIM(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndSHORTSTIM(badBLAKOVOLALL) = [];

allvolsocialBLAWTMODIndPLAT(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndPLAT(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndPLAT(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndPLAT(badBLAKOVOLALL) = [];

allvolsocialBLAWTMODIndFIRST10(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndFIRST10(badBLAKOVOLALL) = [];


allvolBLAWTAUCSTIM(badBLAWTVOLALL) = [];
allvolBLAKOAUCSTIM(badBLAKOVOLALL) = [];

allvolBLAWTAUCSHORTSTIM(badBLAWTVOLALL) = [];
allvolBLAKOAUCSHORTSTIM(badBLAKOVOLALL) = [];

allvolBLAWTAUCPLAT(badBLAWTVOLALL) = [];
allvolBLAKOAUCPLAT(badBLAKOVOLALL) = [];

%%


allvolsocialBLAWTMODIndFIRST10(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndFIRST10(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndFIRST10(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndFIRST10(badBLAKOVOLALL) = [];

allvolsocialBLAWTMODIndPLATFIRST10(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndPLATFIRST10(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndPLATFIRST10(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndPLATFIRST10(badBLAKOVOLALL) = [];

allvolsocialBLAWTMODIndSHORTSTIMFIRST10(badBLAWTVOLALL) = [];
allvolsocialBLAKOMODIndSHORTSTIMFIRST10(badBLAKOVOLALL) = [];

allvolobjBLAWTMODIndSHORTSTIMFIRST10(badBLAWTVOLALL) = [];
allvolobjBLAKOMODIndSHORTSTIMFIRST10(badBLAKOVOLALL) = [];

allvolsocialBLAWTLATENCYONSET(badBLAWTVOLALL) = [];
allvolsocialBLAKOLATENCYONSET(badBLAKOVOLALL) = [];

allvolobjBLAWTLATENCYONSET(badBLAWTVOLALL) = [];
allvolobjBLAKOLATENCYONSET(badBLAKOVOLALL) = [];

allvolsocialBLAWTLATENCYEND(badBLAWTVOLALL) = [];
allvolsocialBLAKOLATENCYEND(badBLAKOVOLALL) = [];

allvolobjBLAWTLATENCYEND(badBLAWTVOLALL) = [];
allvolobjBLAKOLATENCYEND(badBLAKOVOLALL) = [];


%% spont activity
allvolBLAWTSPONT(badBLAWTVOLALL,:) = [];
allvolBLAKOSPONT(badBLAKOVOLALL,:) = [];
%%
allvolsocialBLAWTTRIALS(badBLAWTVOLALL,:) = [];
allvolsocialBLAKOTRIALS(badBLAKOVOLALL,:) = [];

allvolobjBLAWTTRIALS(badBLAWTVOLALL,:) = [];
allvolobjBLAKOTRIALS(badBLAKOVOLALL,:) = [];


allvolsocialBLAWTTRIALSSpks(badBLAWTVOLALL,:) = [];
allvolsocialBLAKOTRIALSSpks(badBLAKOVOLALL,:) = [];

allvolobjBLAWTTRIALSSpks(badBLAWTVOLALL,:) = [];
allvolobjBLAKOTRIALSSpks(badBLAKOVOLALL,:) = [];


%%
BLAmouseIDWT(badBLAWTVOLALL) = [];
BLAmouseIDKO(badBLAKOVOLALL) = [];



%%

groupBLAvolALL(1:size(WTBLAcellsVOLALLNONSORT,1)) = "WT";
groupBLAvolALL(1+size(WTBLAcellsVOLALLNONSORT,1):size(WTBLAcellsVOLALLNONSORT,1)+size(KOBLAcellsVOLALLNONSORT,1)) = "KO";

BLAvolALL = [WTBLAcellsVOLALLNONSORT;KOBLAcellsVOLALLNONSORT];

ALLBLAVOLSOCZ = [allvolsocialBLAWTZALL;allvolsocialBLAKOZALL];

ALLBLAVOLSOC = [allvolsocialBLAWTALL;allvolsocialBLAKOALL];

ALLBLAVOLOBJZ = [allvolobjBLAWTZALL;allvolobjBLAKOZALL];

ALLBLAVOLOBJ = [allvolobjBLAWTALL;allvolobjBLAKOALL];



%%

allvolsocialBLAMODInd = [allvolsocialBLAWTMODInd, allvolsocialBLAKOMODInd];
allvolobjBLAMODInd = [allvolobjBLAWTMODInd, allvolobjBLAKOMODInd];

%% Combine new mod indices and AUC

allvolsocialBLAMODIndSTIM = [allvolsocialBLAWTMODIndSTIM, allvolsocialBLAKOMODIndSTIM];
allvolobjBLAMODIndSTIM = [allvolobjBLAWTMODIndSTIM, allvolobjBLAKOMODIndSTIM];

allvolsocialBLAMODIndSHORTSTIM = [allvolsocialBLAWTMODIndSHORTSTIM, allvolsocialBLAKOMODIndSHORTSTIM];
allvolobjBLAMODIndSHORTSTIM = [allvolobjBLAWTMODIndSHORTSTIM, allvolobjBLAKOMODIndSHORTSTIM];

allvolsocialBLAMODIndPLAT = [allvolsocialBLAWTMODIndPLAT, allvolsocialBLAKOMODIndPLAT];
allvolobjBLAMODIndPLAT = [allvolobjBLAWTMODIndPLAT, allvolobjBLAKOMODIndPLAT];

allvolsocialBLAMODIndFIRST10 = [allvolsocialBLAWTMODIndFIRST10, allvolsocialBLAKOMODIndFIRST10];
allvolobjBLAMODIndFIRST10 = [allvolobjBLAWTMODIndFIRST10, allvolobjBLAKOMODIndFIRST10];

allvolsocialBLAMODIndPLATFIRST10 = [allvolsocialBLAWTMODIndPLATFIRST10, allvolsocialBLAKOMODIndPLATFIRST10];
allvolobjBLAMODIndPLATFIRST10 = [allvolobjBLAWTMODIndPLATFIRST10, allvolobjBLAKOMODIndPLATFIRST10];

allvolsocialBLAMODIndSHORTSTIMFIRST10 = [allvolsocialBLAWTMODIndSHORTSTIMFIRST10, allvolsocialBLAKOMODIndSHORTSTIMFIRST10];
allvolobjBLAMODIndSHORTSTIMFIRST10 = [allvolobjBLAWTMODIndSHORTSTIMFIRST10, allvolobjBLAKOMODIndSHORTSTIMFIRST10];

allvolsocialBLALATENCYONSET = [allvolsocialBLAWTLATENCYONSET, allvolsocialBLAKOLATENCYONSET];
allvolobjBLALATENCYONSET = [allvolobjBLAWTLATENCYONSET, allvolobjBLAKOLATENCYONSET];

allvolsocialBLALATENCYEND = [allvolsocialBLAWTLATENCYEND, allvolsocialBLAKOLATENCYEND];
allvolobjBLALATENCYEND = [allvolobjBLAWTLATENCYEND, allvolobjBLAKOLATENCYEND];

allvolBLAAUCSTIM = [allvolBLAWTAUCSTIM, allvolBLAKOAUCSTIM];

allvolBLAAUCSHORTSTIM = [allvolBLAWTAUCSHORTSTIM, allvolBLAKOAUCSHORTSTIM];

allvolBLAAUCPLAT = [allvolBLAWTAUCPLAT, allvolBLAKOAUCPLAT];

%%


%% spont activity
allvolBLAWTSPONT(badBLAWTVOLALL,:) = [];
allvolBLAKOSPONT(badBLAKOVOLALL,:) = [];

%%

allvolBLAWTTRIALS= [allvolsocialBLAWTTRIALS';allvolobjBLAWTTRIALS'];
allvolBLAKOTRIALS= [allvolsocialBLAKOTRIALS';allvolobjBLAKOTRIALS'];

allvolBLAWTTRIALSSpks= [allvolsocialBLAWTTRIALSSpks';allvolobjBLAWTTRIALSSpks'];
allvolBLAKOTRIALSSpks= [allvolsocialBLAKOTRIALSSpks';allvolobjBLAKOTRIALSSpks'];
%%
%
%
%

%%
load("REDOALLworkingfolderforclusteringVOL.mat", "allS1WTwidths", "allSTRWTwidths", "allBLAWTwidths", "allS1KOwidths", "allSTRKOwidths", "allBLAKOwidths");

%%
allS1WTsocwidths = allS1WTwidths;
allS1WTobjwidths = allS1WTwidths;

allSTRWTsocwidths = allSTRWTwidths;
allSTRWTobjwidths = allSTRWTwidths;

allBLAWTsocwidths = allBLAWTwidths;
allBLAWTobjwidths = allBLAWTwidths;

allS1KOsocwidths = allS1KOwidths;
allS1KOobjwidths = allS1KOwidths;

allSTRKOsocwidths = allSTRKOwidths;
allSTRKOobjwidths = allSTRKOwidths;

allBLAKOsocwidths = allBLAKOwidths;
allBLAKOobjwidths = allBLAKOwidths;


%%

allS1WTsocwidths(badS1WTVOLALL) = [];
allS1WTobjwidths(badS1WTVOLALL) = [];


allSTRWTsocwidths(badSTRWTVOLALL) = [];
allSTRWTobjwidths(badSTRWTVOLALL) = [];

allBLAWTsocwidths(badBLAWTVOLALL) = [];
allBLAWTobjwidths(badBLAWTVOLALL) = [];

allS1KOsocwidths(badS1KOVOLALL) = [];
allS1KOobjwidths(badS1KOVOLALL) = [];


allSTRKOsocwidths(badSTRKOVOLALL) = [];
allSTRKOobjwidths(badSTRKOVOLALL) = [];

allBLAKOsocwidths(badBLAKOVOLALL) = [];
allBLAKOobjwidths(badBLAKOVOLALL) = [];

% newmouseS1WT = mouseS1WT;
% newmouseS1KO = mouseS1KO;
% newmouseS1WT(badS1WTVOLALL) = [];
% newmouseS1KO(badS1KOVOLALL) = [];




%%
allvolsocS1widths = [allS1WTsocwidths,allS1KOsocwidths];
allvolsocSTRwidths = [allSTRWTsocwidths,allSTRKOsocwidths];
allvolsocBLAwidths = [allBLAWTsocwidths,allBLAKOsocwidths];

allvolobjS1widths = [allS1WTobjwidths,allS1KOobjwidths];
allvolobjSTRwidths = [allSTRWTobjwidths,allSTRKOobjwidths];
allvolobjBLAwidths = [allBLAWTobjwidths,allBLAKOobjwidths];

%%
for a = 1:size(S1volALL,1)
testS1ALL(a,:) = smoothdata(S1volALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testS1ALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsS1ALL(i,:) = testS1ALL(newindex,:);
end


%%
for a = 1:size(STRvolALL,1)
testSTRALL(a,:) = smoothdata(STRvolALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testSTRALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsSTRALL(i,:) = testSTRALL(newindex,:);
end

%%
for a = 1:size(BLAvolALL,1)
testBLAALL(a,:) = smoothdata(BLAvolALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testBLAALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsBLAALL(i,:) = testBLAALL(newindex,:);
end


%%

Y = tsne(S1volALL,'Algorithm','exact','Distance','euclidean');

figure; subplot(1,3,1), gscatter(Y(:,1),Y(:,2),groupS1volALL',eye(3));

[idxS1,c] = kmeans(Y,5,'MaxIter',10000,'Display','final','Replicates',10);

X = tsne(STRvolALL,'Algorithm','exact','Distance','euclidean');

[idxSTR,c] = kmeans(X,6,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,2), gscatter(X(:,1),X(:,2),groupSTRvolALL',eye(3));

Z = tsne(BLAvolALL,'Algorithm','exact','Distance','euclidean');

[idxBLA,c] = kmeans(Z,4,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,3), gscatter(Z(:,1),Z(:,2),groupBLAvolALL',eye(3));

%%
% 
% Y = tsne(testS1ALL,'Algorithm','exact','Distance','euclidean');
% 
% figure; subplot(1,3,1), gscatter(Y(:,1),Y(:,2),groupS1volALL',eye(3));
% 
% [idxS1,c] = kmeans(Y,5,'MaxIter',10000,'Display','final','Replicates',10);
% 
% X = tsne(testSTRALL,'Algorithm','exact','Distance','euclidean');
% 
% [idxSTR,c] = kmeans(X,6,'MaxIter',10000,'Display','final','Replicates',10);
% 
% subplot(1,3,2), gscatter(X(:,1),X(:,2),groupSTRvolALL',eye(3));
% 
% Z = tsne(testBLAALL,'Algorithm','exact','Distance','euclidean');
% 
% [idxBLA,c] = kmeans(Z,4,'MaxIter',10000,'Display','final','Replicates',10);
% 
% subplot(1,3,3), gscatter(Z(:,1),Z(:,2),groupBLAvolALL',eye(3));
% 


%%

[coeff,score,latent,tsquared,explained,mu] = pca(testSTRALL);
[idxSTR,c] = kmeans(score(:,1:15),4,'MaxIter',10000,'Display','final','Replicates',10);

% [rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testSTRALL), ...
%     'n_components', 2, 'n_neighbors', 6);
% 
% [idxSTR,c] = kmeans(rep_UMAP(:,1:2),6,'MaxIter',10000,'Display','final','Replicates',10);
% 



figure;
plot(X(idxSTR==1,1),X(idxSTR==1,2),'r.','MarkerSize',12)
hold on
plot(X(idxSTR==2,1),X(idxSTR==2,2),'b.','MarkerSize',12)
hold on; plot(X(idxSTR==3,1),X(idxSTR==3,2),'g.','MarkerSize',12)
hold on
plot(X(idxSTR==4,1),X(idxSTR==4,2),'k.','MarkerSize',12)
hold on
plot(X(idxSTR==5,1),X(idxSTR==5,2),'c.','MarkerSize',12)
hold on
plot(X(idxSTR==6,1),X(idxSTR==6,2),'m.','MarkerSize',12)


figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==1),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==2),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==3),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==4),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==5),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==5),:),1))),'lineprops', 'c'); 
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(idxSTR==6),:)),nanstd(ALLSTRVOLSOCZ(find(idxSTR==6),:))/(sqrt(size(ALLSTRVOLSOCZ(find(idxSTR==6),:),1))),'lineprops', 'm'); 

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRVOLOBJZ = ALLSTRVOLOBJZ;
newALLSTRVOLOBJZ(badSTRINF, :) = [];
newidxSTR = idxSTR;
newidxSTR(badSTRINF, :) = [];

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==1),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==1),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==2),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==2),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==3),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==3),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==4),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==4),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==5),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==5),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==5),:),1))),'lineprops', 'c'); 
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRVOLOBJZ(find(newidxSTR==6),:)),nanstd(newALLSTRVOLOBJZ(find(newidxSTR==6),:))/(sqrt(size(newALLSTRVOLOBJZ(find(newidxSTR==6),:),1))),'lineprops', 'm'); 



%% S1

[coeff,score,latent,tsquared,explained,mu] = pca(testS1ALL);
[idxS1,c] = kmeans(score(:,1:15),4,'MaxIter',10000,'Display','final','Replicates',10);
% 
% [rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testS1ALL), ...
%     'n_components', 2, 'n_neighbors', 5);
% 
% [idxS1,c] = kmeans(rep_UMAP(:,1:2),5,'MaxIter',10000,'Display','final','Replicates',10);


figure;
plot(Y(idxS1==1,1),Y(idxS1==1,2),'k.','MarkerSize',12)
hold on
plot(Y(idxS1==2,1),Y(idxS1==2,2),'r.','MarkerSize',12)
hold on; plot(Y(idxS1==3,1),Y(idxS1==3,2),'b.','MarkerSize',12)
hold on
plot(Y(idxS1==4,1),Y(idxS1==4,2),'c.','MarkerSize',12)
hold on
plot(Y(idxS1==5,1),Y(idxS1==5,2),'g.','MarkerSize',12)
% hold on
% plot(Y(idxS1==6,1),Y(idxS1==6,2),'m.','MarkerSize',12)
% hold on
% plot(Y(idxS1==7,1),Y(idxS1==7,2),'m.','MarkerSize',12)



[badS1INFr,badS1INFc] = find(ismember(ALLS1VOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1VOLSOCZ = ALLS1VOLSOCZ;
newALLS1VOLSOCZ(badS1INF, :) = [];
newidx = idxS1;
newidx(badS1INF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==1),:)),nanstd(ALLS1VOLSOCZ(find(idx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==2),:)),nanstd(ALLS1VOLSOCZ(find(idx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==3),:)),nanstd(ALLS1VOLSOCZ(find(idx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==4),:)),nanstd(ALLS1VOLSOCZ(find(idx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==5),:)),nanstd(ALLS1VOLSOCZ(find(idx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==1),:)),nanstd(newALLS1VOLSOCZ(find(newidx==1),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==2),:)),nanstd(newALLS1VOLSOCZ(find(newidx==2),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==3),:)),nanstd(newALLS1VOLSOCZ(find(newidx==3),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==4),:)),nanstd(newALLS1VOLSOCZ(find(newidx==4),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==5),:)),nanstd(newALLS1VOLSOCZ(find(newidx==5),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==6),:)),nanstd(newALLS1VOLSOCZ(find(newidx==6),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==6),:),1))),'lineprops', 'm'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLSOCZ(find(newidx==7),:)),nanstd(newALLS1VOLSOCZ(find(newidx==7),:))/(sqrt(size(newALLS1VOLSOCZ(find(newidx==7),:),1))),'lineprops', 'y'); hold on;

[badS1INFr,badS1INFc] = find(ismember(ALLS1VOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1VOLOBJZ = ALLS1VOLOBJZ;
newALLS1VOLOBJZ(badS1INF, :) = [];
newidx = idxS1;
newidx(badS1INF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==1),:)),nanstd(ALLS1VOLOBJZ(find(idx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==2),:)),nanstd(ALLS1VOLOBJZ(find(idx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==3),:)),nanstd(ALLS1VOLOBJZ(find(idx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==4),:)),nanstd(ALLS1VOLOBJZ(find(idx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==5),:)),nanstd(ALLS1VOLOBJZ(find(idx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==1),:)),nanstd(newALLS1VOLOBJZ(find(newidx==1),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==2),:)),nanstd(newALLS1VOLOBJZ(find(newidx==2),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==3),:)),nanstd(newALLS1VOLOBJZ(find(newidx==3),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==4),:)),nanstd(newALLS1VOLOBJZ(find(newidx==4),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==5),:)),nanstd(newALLS1VOLOBJZ(find(newidx==5),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==5),:),1))),'lineprops', 'c'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==6),:)),nanstd(newALLS1VOLOBJZ(find(newidx==6),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==6),:),1))),'lineprops', 'm'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1VOLOBJZ(find(newidx==7),:)),nanstd(newALLS1VOLOBJZ(find(newidx==7),:))/(sqrt(size(newALLS1VOLOBJZ(find(newidx==7),:),1))),'lineprops', 'y');

%% BLA

[coeff,score,latent,tsquared,explained,mu] = pca(testBLAALL);
[idxBLA,c] = kmeans(score(:,1:19),5,'MaxIter',10000,'Display','final','Replicates',10);
% 
% [rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testBLAALL), ...
%     'n_components', 2, 'n_neighbors', 5);
% 
% [idxBLA,c] = kmeans(rep_UMAP(:,1:2),4,'MaxIter',10000,'Display','final','Replicates',10);
% 
% 


figure;
plot(Z(idxBLA==1,1),Z(idxBLA==1,2),'k.','MarkerSize',12)
hold on
plot(Z(idxBLA==2,1),Z(idxBLA==2,2),'r.','MarkerSize',12)
hold on; plot(Z(idxBLA==3,1),Z(idxBLA==3,2),'b.','MarkerSize',12)
hold on
plot(Z(idxBLA==4,1),Z(idxBLA==4,2),'g.','MarkerSize',12)
% hold on
% plot(Z(idxBLA==5,1),Z(idxBLA==5,2),'c.','MarkerSize',12)

figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(idxBLA==1),:)),nanstd(ALLBLAVOLSOCZ(find(idxBLA==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(idxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(idxBLA==2),:)),nanstd(ALLBLAVOLSOCZ(find(idxBLA==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(idxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(idxBLA==3),:)),nanstd(ALLBLAVOLSOCZ(find(idxBLA==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(idxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(idxBLA==4),:)),nanstd(ALLBLAVOLSOCZ(find(idxBLA==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(idxBLA==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(idxBLA==5),:)),nanstd(ALLBLAVOLSOCZ(find(idxBLA==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(idxBLA==5),:),1))),'lineprops', 'c');



figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(idxBLA==1),:)),nanstd(ALLBLAVOLOBJZ(find(idxBLA==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(idxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(idxBLA==2),:)),nanstd(ALLBLAVOLOBJZ(find(idxBLA==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(idxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(idxBLA==3),:)),nanstd(ALLBLAVOLOBJZ(find(idxBLA==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(idxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(idxBLA==4),:)),nanstd(ALLBLAVOLOBJZ(find(idxBLA==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(idxBLA==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(idxBLA==5),:)),nanstd(ALLBLAVOLOBJZ(find(idxBLA==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(idxBLA==5),:),1))),'lineprops', 'c');


%%


%
%
%
%
%
%
% HERE WE WILL SEPARATE BY REGULAR SPIKING

%%
RSX = X(find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250),:);
RSidxSTR = idxSTR(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);
figure;subplot(4,1,1);
plot(RSX(RSidxSTR==1,1),RSX(RSidxSTR==1,2),'k.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==2,1),RSX(RSidxSTR==2,2),'r.','MarkerSize',12)
hold on; plot(RSX(RSidxSTR==3,1),RSX(RSidxSTR==3,2),'b.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==4,1),RSX(RSidxSTR==4,2),'c.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==5,1),RSX(RSidxSTR==5,2),'g.','MarkerSize',12)





RSALLSTRVOLSOCZ = ALLSTRVOLSOCZ(find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250),:);
RSALLSTRVOLOBJZ = ALLSTRVOLOBJZ(find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250),:);
subplot(4,1,2); gscatter(RSX(:,1),RSX(:,2));

subplot(4,1,3); shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRVOLSOCZ(find(RSidxSTR==1),:)),nanstd(RSALLSTRVOLSOCZ(find(RSidxSTR==1),:))/(sqrt(size(RSALLSTRVOLSOCZ(find(RSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRVOLSOCZ(find(RSidxSTR==2),:)),nanstd(RSALLSTRVOLSOCZ(find(RSidxSTR==2),:))/(sqrt(size(RSALLSTRVOLSOCZ(find(RSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRVOLSOCZ(find(RSidxSTR==3),:)),nanstd(RSALLSTRVOLSOCZ(find(RSidxSTR==3),:))/(sqrt(size(RSALLSTRVOLSOCZ(find(RSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRVOLSOCZ(find(RSidxSTR==4),:)),nanstd(RSALLSTRVOLSOCZ(find(RSidxSTR==4),:))/(sqrt(size(RSALLSTRVOLSOCZ(find(RSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRVOLSOCZ(find(RSidxSTR==5),:)),nanstd(RSALLSTRVOLSOCZ(find(RSidxSTR==5),:))/(sqrt(size(RSALLSTRVOLSOCZ(find(RSidxSTR==5),:),1))),'lineprops', 'c'); 

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
newRSALLSTRVOLOBJZ = RSALLSTRVOLOBJZ;
newRSALLSTRVOLOBJZ(badSTRINF, :) = [];
newRSidxSTR = RSidxSTR;
newRSidxSTR(badSTRINF, :) = [];

subplot(4,1,4); shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRVOLOBJZ(find(newRSidxSTR==1),:)),nanstd(newRSALLSTRVOLOBJZ(find(newRSidxSTR==1),:))/(sqrt(size(newRSALLSTRVOLOBJZ(find(newRSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRVOLOBJZ(find(newRSidxSTR==2),:)),nanstd(newRSALLSTRVOLOBJZ(find(newRSidxSTR==2),:))/(sqrt(size(newRSALLSTRVOLOBJZ(find(newRSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRVOLOBJZ(find(newRSidxSTR==3),:)),nanstd(newRSALLSTRVOLOBJZ(find(newRSidxSTR==3),:))/(sqrt(size(newRSALLSTRVOLOBJZ(find(newRSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRVOLOBJZ(find(newRSidxSTR==4),:)),nanstd(newRSALLSTRVOLOBJZ(find(newRSidxSTR==4),:))/(sqrt(size(newRSALLSTRVOLOBJZ(find(newRSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRVOLOBJZ(find(newRSidxSTR==5),:)),nanstd(newRSALLSTRVOLOBJZ(find(newRSidxSTR==5),:))/(sqrt(size(newRSALLSTRVOLOBJZ(find(newRSidxSTR==5),:),1))),'lineprops', 'c'); 



%% S1
RSY = Y(find(allvolsocS1widths>= 400),:);
%[idx,c] = kmeans(RSY,5);

RSidxS1 = idxS1(find(allvolsocS1widths>= 400));
figure; 

%subplot(3,1,1);
plot(RSY(RSidxS1==1,1),RSY(RSidxS1==1,2),'k.','MarkerSize',12)
hold on
plot(RSY(RSidxS1==2,1),RSY(RSidxS1==2,2),'r.','MarkerSize',12)
hold on; plot(RSY(RSidxS1==3,1),RSY(RSidxS1==3,2),'b.','MarkerSize',12)
hold on
plot(RSY(RSidxS1==4,1),RSY(RSidxS1==4,2),'c.','MarkerSize',12)
hold on
plot(RSY(RSidxS1==5,1),RSY(RSidxS1==5,2),'g.','MarkerSize',12)

RSALLS1VOLSOCZ = ALLS1VOLSOCZ(find(allvolsocS1widths>=400),:);
RSALLS1VOLOBJZ = ALLS1VOLOBJZ(find(allvolsocS1widths>=400),:);

% mouseS1 = [newmouseS1WT, newmouseS1KO];
% RSmouseS1 = mouseS1(find(allvolsocS1widths>=400));


[badS1INFr,badS1INFc] = find(ismember(RSALLS1VOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1VOLSOCZ = RSALLS1VOLSOCZ;
RSnewALLS1VOLSOCZ(badS1INF, :) = [];
newidx = RSidxS1;
newidx(badS1INF, :) = [];
% newRSmouseS1 = RSmouseS1;
% newRSmouseS1(badS1INF) = [];

% subplot(3,1,2); gscatter(RSY(:,1),RSY(:,2));
% figure; gscatter(RSY(:,1),RSY(:,2), RSmouseS1');

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==1),:)),nanstd(ALLS1VOLSOCZ(find(idx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==2),:)),nanstd(ALLS1VOLSOCZ(find(idx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==3),:)),nanstd(ALLS1VOLSOCZ(find(idx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==4),:)),nanstd(ALLS1VOLSOCZ(find(idx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==5),:)),nanstd(ALLS1VOLSOCZ(find(idx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLSOCZ(find(newidx==1),:)),nanstd(RSnewALLS1VOLSOCZ(find(newidx==1),:))/(sqrt(size(RSnewALLS1VOLSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLSOCZ(find(newidx==2),:)),nanstd(RSnewALLS1VOLSOCZ(find(newidx==2),:))/(sqrt(size(RSnewALLS1VOLSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLSOCZ(find(newidx==3),:)),nanstd(RSnewALLS1VOLSOCZ(find(newidx==3),:))/(sqrt(size(RSnewALLS1VOLSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLSOCZ(find(newidx==4),:)),nanstd(RSnewALLS1VOLSOCZ(find(newidx==4),:))/(sqrt(size(RSnewALLS1VOLSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLSOCZ(find(newidx==5),:)),nanstd(RSnewALLS1VOLSOCZ(find(newidx==5),:))/(sqrt(size(RSnewALLS1VOLSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); 

[badS1INFr,badS1INFc] = find(ismember(RSALLS1VOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1VOLOBJZ = RSALLS1VOLOBJZ;
RSnewALLS1VOLOBJZ(badS1INF, :) = [];
newidx = RSidxS1;
newidx(badS1INF, :) = [];
% newRSmouseS1 = RSmouseS1;
% newRSmouseS1(badS1INF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==1),:)),nanstd(ALLS1VOLOBJZ(find(idx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==2),:)),nanstd(ALLS1VOLOBJZ(find(idx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==3),:)),nanstd(ALLS1VOLOBJZ(find(idx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==4),:)),nanstd(ALLS1VOLOBJZ(find(idx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(idx==5),:)),nanstd(ALLS1VOLOBJZ(find(idx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLOBJZ(find(newidx==1),:)),nanstd(RSnewALLS1VOLOBJZ(find(newidx==1),:))/(sqrt(size(RSnewALLS1VOLOBJZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLOBJZ(find(newidx==2),:)),nanstd(RSnewALLS1VOLOBJZ(find(newidx==2),:))/(sqrt(size(RSnewALLS1VOLOBJZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLOBJZ(find(newidx==3),:)),nanstd(RSnewALLS1VOLOBJZ(find(newidx==3),:))/(sqrt(size(RSnewALLS1VOLOBJZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLOBJZ(find(newidx==4),:)),nanstd(RSnewALLS1VOLOBJZ(find(newidx==4),:))/(sqrt(size(RSnewALLS1VOLOBJZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1VOLOBJZ(find(newidx==5),:)),nanstd(RSnewALLS1VOLOBJZ(find(newidx==5),:))/(sqrt(size(RSnewALLS1VOLOBJZ(find(newidx==5),:),1))),'lineprops', 'c'); 


%% BLA

RSZ = Z;
RSidxBLA = idxBLA;
figure;subplot(4,1,1);
plot(RSZ(RSidxBLA==1,1),RSZ(RSidxBLA==1,2),'k.','MarkerSize',12)
hold on
plot(RSZ(RSidxBLA==2,1),RSZ(RSidxBLA==2,2),'r.','MarkerSize',12)
hold on; plot(RSZ(RSidxBLA==3,1),RSZ(RSidxBLA==3,2),'b.','MarkerSize',12)
hold on
plot(RSZ(RSidxBLA==4,1),RSZ(RSidxBLA==4,2),'c.','MarkerSize',12)
hold on
plot(RSZ(RSidxBLA==5,1),RSZ(RSidxBLA==5,2),'g.','MarkerSize',12)


RSALLBLAVOLSOCZ = ALLBLAVOLSOCZ;
RSALLBLAVOLOBJZ = ALLBLAVOLOBJZ;

subplot(4,1,2); gscatter(RSZ(:,1),RSZ(:,2));


subplot(4,1,3); shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLSOCZ(find(RSidxBLA==1),:)),nanstd(RSALLBLAVOLSOCZ(find(RSidxBLA==1),:))/(sqrt(size(RSALLBLAVOLSOCZ(find(RSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLSOCZ(find(RSidxBLA==2),:)),nanstd(RSALLBLAVOLSOCZ(find(RSidxBLA==2),:))/(sqrt(size(RSALLBLAVOLSOCZ(find(RSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLSOCZ(find(RSidxBLA==3),:)),nanstd(RSALLBLAVOLSOCZ(find(RSidxBLA==3),:))/(sqrt(size(RSALLBLAVOLSOCZ(find(RSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLSOCZ(find(RSidxBLA==4),:)),nanstd(RSALLBLAVOLSOCZ(find(RSidxBLA==4),:))/(sqrt(size(RSALLBLAVOLSOCZ(find(RSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLSOCZ(find(RSidxBLA==5),:)),nanstd(RSALLBLAVOLSOCZ(find(RSidxBLA==5),:))/(sqrt(size(RSALLBLAVOLSOCZ(find(RSidxBLA==5),:),1))),'lineprops', 'g'); hold on;


subplot(4,1,4); shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLOBJZ(find(RSidxBLA==1),:)),nanstd(RSALLBLAVOLOBJZ(find(RSidxBLA==1),:))/(sqrt(size(RSALLBLAVOLOBJZ(find(RSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLOBJZ(find(RSidxBLA==2),:)),nanstd(RSALLBLAVOLOBJZ(find(RSidxBLA==2),:))/(sqrt(size(RSALLBLAVOLOBJZ(find(RSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLOBJZ(find(RSidxBLA==3),:)),nanstd(RSALLBLAVOLOBJZ(find(RSidxBLA==3),:))/(sqrt(size(RSALLBLAVOLOBJZ(find(RSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLOBJZ(find(RSidxBLA==4),:)),nanstd(RSALLBLAVOLOBJZ(find(RSidxBLA==4),:))/(sqrt(size(RSALLBLAVOLOBJZ(find(RSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAVOLOBJZ(find(RSidxBLA==5),:)),nanstd(RSALLBLAVOLOBJZ(find(RSidxBLA==5),:))/(sqrt(size(RSALLBLAVOLOBJZ(find(RSidxBLA==5),:),1))),'lineprops', 'g'); hold on;

%%
%
%
%
%
%% ISOLATE BY GENOTYPE


RSS1cellssoc = find(allvolsocS1widths>= 400);

WTS1cellssoc = find(groupS1volALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allvolsocS1widths>= 400 & groupS1volALL == "WT");

WTS1socidx = idxS1WT(RSWTS1cellssoc);

RSS1mouseIDWT = S1mouseIDWT(RSWTS1cellssoc);


RSYWT = Y(RSWTS1cellssoc,:);
figure; subplot(2,1,1);
plot(RSYWT(WTS1socidx==1,1),RSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==2,1),RSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTS1socidx==3,1),RSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==4,1),RSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==5,1),RSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)

figure;
plot(RSYWT(RSS1mouseIDWT==1,1),RSYWT(RSS1mouseIDWT==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==2,1),RSYWT(RSS1mouseIDWT==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(RSS1mouseIDWT==3,1),RSYWT(RSS1mouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==4,1),RSYWT(RSS1mouseIDWT==4,2),'k.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==5,1),RSYWT(RSS1mouseIDWT==5,2),'c.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==6,1),RSYWT(RSS1mouseIDWT==6,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(RSS1mouseIDWT==3,1),RSYWT(RSS1mouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==7,1),RSYWT(RSS1mouseIDWT==7,2),'m.','MarkerSize',12)
hold on
plot(RSYWT(RSS1mouseIDWT==8,1),RSYWT(RSS1mouseIDWT==8,2),'c.','MarkerSize',12)



RSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(RSWTS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellssoc);
WTRSS1socialMODInd = allvolsocialS1MODInd(RSWTS1cellssoc);
WTRSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(RSWTS1cellssoc);
WTRSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(RSWTS1cellssoc);
WTRSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(RSWTS1cellssoc);
WTRSS1socialMODIndFIRST10 = allvolsocialS1MODIndFIRST10(RSWTS1cellssoc);
WTRSS1socialMODIndPLATFIRST10 = allvolsocialS1MODIndPLATFIRST10(RSWTS1cellssoc);
WTRSS1socialMODIndSHORTSTIMFIRST10 = allvolsocialS1MODIndSHORTSTIMFIRST10(RSWTS1cellssoc);

WTRSS1socialMODIndFIRST5 = allvolsocialS1MODIndFIRST5(RSWTS1cellssoc);
WTRSS1socialMODIndPLATFIRST5 = allvolsocialS1MODIndPLATFIRST5(RSWTS1cellssoc);
WTRSS1socialMODIndSHORTSTIMFIRST5 = allvolsocialS1MODIndSHORTSTIMFIRST5(RSWTS1cellssoc);

WTRSS1socialLATENCYONSET = allvolsocialS1LATENCYONSET(RSWTS1cellssoc);
WTRSS1socialLATENCYEND = allvolsocialS1LATENCYEND(RSWTS1cellssoc);

WTRSS1volAUCSTIM = allvolS1AUCSTIM(RSWTS1cellssoc);
WTRSS1volAUCSHORTSTIM = allvolS1AUCSHORTSTIM(RSWTS1cellssoc);
WTRSS1volAUCPLAT = allvolS1AUCPLAT(RSWTS1cellssoc);

% [badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(RSALLS1WTVOLSOCZ));
badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLSOCZ = RSALLS1WTVOLSOCZ;
RSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];


RSS1mouseIDWT(badS1INF) = [];

newWTRSS1socialMODIndNEW = WTRSS1socialMODInd;
newWTRSS1socialMODIndNEW(badS1INF) = [];

newWTRSS1socialMODIndSTIMNEW = WTRSS1socialMODIndSTIM;
newWTRSS1socialMODIndSTIMNEW(badS1INF) = [];

newWTRSS1socialMODIndSHORTSTIMNEW = WTRSS1socialMODIndSHORTSTIM;
newWTRSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newWTRSS1socialMODIndPLATNEW = WTRSS1socialMODIndPLAT;
newWTRSS1socialMODIndPLATNEW(badS1INF) = [];

newWTRSS1socialMODIndFIRST10NEW = WTRSS1socialMODIndFIRST10;
newWTRSS1socialMODIndFIRST10NEW(badS1INF) = [];

newWTRSS1socialMODIndPLATFIRST10NEW = WTRSS1socialMODIndPLATFIRST10;
newWTRSS1socialMODIndPLATFIRST10NEW(badS1INF) = [];

newWTRSS1socialMODIndSHORTSTIMFIRST10NEW = WTRSS1socialMODIndSHORTSTIMFIRST10;
newWTRSS1socialMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];

newWTRSS1socialLATENCYONSETNEW = WTRSS1socialLATENCYONSET;
newWTRSS1socialLATENCYONSETNEW(badS1INF) = [];

newWTRSS1socialLATENCYENDNEW = WTRSS1socialLATENCYEND;
newWTRSS1socialLATENCYENDNEW(badS1INF) = [];


newWTRSS1socialMODIndFIRST5NEW = WTRSS1socialMODIndFIRST5;
newWTRSS1socialMODIndFIRST5NEW(badS1INF) = [];

newWTRSS1socialMODIndPLATFIRST5NEW = WTRSS1socialMODIndPLATFIRST5;
newWTRSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newWTRSS1socialMODIndSHORTSTIMFIRST5NEW = WTRSS1socialMODIndSHORTSTIMFIRST5;
newWTRSS1socialMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];




newWTRSS1volAUCSTIMNEW = WTRSS1volAUCSTIM;
newWTRSS1volAUCSTIMNEW(badS1INF) = [];

newWTRSS1volAUCSHORTSTIMNEW = WTRSS1volAUCSHORTSTIM;
newWTRSS1volAUCSHORTSTIMNEW(badS1INF) = [];

newWTRSS1volAUCPLATNEW = WTRSS1volAUCPLAT;
newWTRSS1volAUCPLATNEW(badS1INF) = [];

RSallvolS1WTSPONT = allvolS1WTSPONT(RSWTS1cellssoc,:);
RSallvolS1WTSPONT(badS1INF,:) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);


%%
RSS1cellsobj = find(allvolobjS1widths>= 400);

WTS1cellsobj = find(groupS1volALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allvolobjS1widths>= 400 & groupS1volALL == "WT");

WTS1objidx = idxS1WT(RSWTS1cellsobj);

WTRSobjMODInd = allvolobjS1MODInd(RSWTS1cellsobj);

RSS1mouseIDWT = S1mouseIDWT(RSWTS1cellssoc);


RSYWT = Y(RSWTS1cellsobj,:);
figure;
plot(RSYWT(WTS1objidx==1,1),RSYWT(WTS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==2,1),RSYWT(WTS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTS1objidx==3,1),RSYWT(WTS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==4,1),RSYWT(WTS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==5,1),RSYWT(WTS1objidx==5,2),'c.','MarkerSize',12)

RSALLS1WTVOLOBJZ = ALLS1VOLOBJZ(RSWTS1cellsobj,:);

% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellsobj);
WTRSS1objMODInd = allvolobjS1MODInd(RSWTS1cellsobj);
WTRSS1objMODIndSTIM = allvolobjS1MODIndSTIM(RSWTS1cellsobj);
WTRSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(RSWTS1cellsobj);
WTRSS1objMODIndPLAT = allvolobjS1MODIndPLAT(RSWTS1cellsobj);
WTRSS1objMODIndFIRST10 = allvolobjS1MODIndFIRST10(RSWTS1cellsobj);
WTRSS1objMODIndPLATFIRST10 = allvolobjS1MODIndPLATFIRST10(RSWTS1cellsobj);
WTRSS1objMODIndSHORTSTIMFIRST10 = allvolobjS1MODIndSHORTSTIMFIRST10(RSWTS1cellsobj);

WTRSS1objLATENCYONSET = allvolobjS1LATENCYONSET(RSWTS1cellsobj);
WTRSS1objLATENCYEND = allvolobjS1LATENCYEND(RSWTS1cellsobj);

WTRSS1objMODIndFIRST5 = allvolobjS1MODIndFIRST5(RSWTS1cellsobj);
WTRSS1objMODIndPLATFIRST5 = allvolobjS1MODIndPLATFIRST5(RSWTS1cellsobj);
WTRSS1objMODIndSHORTSTIMFIRST5 = allvolobjS1MODIndSHORTSTIMFIRST5(RSWTS1cellsobj);

% [badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLOBJZ,Inf));
% [badS1INFr,badS1INFc] = find(isnan(RSALLS1WTVOLOBJZ));
% badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLOBJZ = RSALLS1WTVOLOBJZ;
RSnewALLS1WTVOLOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];

newWTRSS1objMODIndNEW = WTRSS1objMODInd;
newWTRSS1objMODIndNEW(badS1INF) = [];

newWTRSS1objMODIndSTIMNEW = WTRSS1objMODIndSTIM;
newWTRSS1objMODIndSTIMNEW(badS1INF) = [];

newWTRSS1objMODIndSHORTSTIMNEW = WTRSS1objMODIndSHORTSTIM;
newWTRSS1objMODIndSHORTSTIMNEW(badS1INF) = [];

newWTRSS1objMODIndPLATNEW = WTRSS1objMODIndPLAT;
newWTRSS1objMODIndPLATNEW(badS1INF) = [];

newWTRSS1objMODIndFIRST10NEW = WTRSS1objMODIndFIRST10;
newWTRSS1objMODIndFIRST10NEW(badS1INF) = [];

newWTRSS1objMODIndPLATFIRST10NEW = WTRSS1objMODIndPLATFIRST10;
newWTRSS1objMODIndPLATFIRST10NEW(badS1INF) = [];

newWTRSS1objMODIndSHORTSTIMFIRST10NEW = WTRSS1objMODIndSHORTSTIMFIRST10;
newWTRSS1objMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];

newWTRSS1objLATENCYONSETNEW = WTRSS1objLATENCYONSET;
newWTRSS1objLATENCYONSETNEW(badS1INF) = [];

newWTRSS1objLATENCYENDNEW = WTRSS1objLATENCYEND;
newWTRSS1objLATENCYENDNEW(badS1INF) = [];


newWTRSS1objMODIndFIRST5NEW = WTRSS1objMODIndFIRST5;
newWTRSS1objMODIndFIRST5NEW(badS1INF) = [];

newWTRSS1objMODIndPLATFIRST5NEW = WTRSS1objMODIndPLATFIRST5;
newWTRSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newWTRSS1objMODIndSHORTSTIMFIRST5NEW = WTRSS1objMODIndSHORTSTIMFIRST5;
newWTRSS1objMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];


RSS1mouseIDWT(badS1INF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

RSS1cellssoc = find(allvolsocS1widths>= 400);

KOS1cellssoc = find(groupS1volALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allvolsocS1widths>= 400 & groupS1volALL == "KO");

KOS1socidx = idxS1KO(RSKOS1cellssoc-533);


RSS1mouseIDKO = S1mouseIDKO(RSKOS1cellssoc-533);

RSYKO = Y(RSKOS1cellssoc,:);
figure;
plot(RSYKO(KOS1socidx==1,1),RSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==2,1),RSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOS1socidx==3,1),RSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==4,1),RSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==5,1),RSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)

RSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(RSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellssoc);

KORSS1socialMODInd = allvolsocialS1MODInd(RSKOS1cellssoc);

KORSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(RSKOS1cellssoc);
KORSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(RSKOS1cellssoc);
KORSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(RSKOS1cellssoc);
KORSS1socialMODIndFIRST10 = allvolsocialS1MODIndFIRST10(RSKOS1cellssoc);
KORSS1socialMODIndPLATFIRST10 = allvolsocialS1MODIndPLATFIRST10(RSKOS1cellssoc);
KORSS1socialMODIndSHORTSTIMFIRST10 = allvolsocialS1MODIndSHORTSTIMFIRST10(RSKOS1cellssoc);

KORSS1socialMODIndFIRST5 = allvolsocialS1MODIndFIRST5(RSKOS1cellssoc);
KORSS1socialMODIndPLATFIRST5 = allvolsocialS1MODIndPLATFIRST5(RSKOS1cellssoc);
KORSS1socialMODIndSHORTSTIMFIRST5 = allvolsocialS1MODIndSHORTSTIMFIRST5(RSKOS1cellssoc);

KORSS1socialLATENCYONSET = allvolsocialS1LATENCYONSET(RSKOS1cellssoc);
KORSS1socialLATENCYEND = allvolsocialS1LATENCYEND(RSKOS1cellssoc);
% KORSS1volAUCSTIM = allvolS1AUCSTIM(RSKOS1cellssoc);
% KORSS1volAUCSHORTSTIM = allvolS1AUCSHORTSTIM(RSKOS1cellssoc);
% KORSS1volAUCPLAT = allvolS1AUCPLAT(RSKOS1cellssoc);


% [badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(RSALLS1KOVOLSOCZ));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLSOCZ = RSALLS1KOVOLSOCZ;
RSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];

newKORSS1socialMODIndNEW = KORSS1socialMODInd;
newKORSS1socialMODIndNEW(badS1INF) = [];

newKORSS1socialMODIndSTIMNEW = KORSS1socialMODIndSTIM;
newKORSS1socialMODIndSTIMNEW(badS1INF) = [];

newKORSS1socialMODIndSHORTSTIMNEW = KORSS1socialMODIndSHORTSTIM;
newKORSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newKORSS1socialMODIndPLATNEW = KORSS1socialMODIndPLAT;
newKORSS1socialMODIndPLATNEW(badS1INF) = [];

newKORSS1socialMODIndFIRST10NEW = KORSS1socialMODIndFIRST10;
newKORSS1socialMODIndFIRST10NEW(badS1INF) = [];

newKORSS1socialMODIndPLATFIRST10NEW = KORSS1socialMODIndPLATFIRST10;
newKORSS1socialMODIndPLATFIRST10NEW(badS1INF) = [];

newKORSS1socialMODIndSHORTSTIMFIRST10NEW = KORSS1socialMODIndSHORTSTIMFIRST10;
newKORSS1socialMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];

newKORSS1socialLATENCYONSETNEW = KORSS1socialLATENCYONSET;
newKORSS1socialLATENCYONSETNEW(badS1INF) = [];

newKORSS1socialLATENCYENDNEW = KORSS1socialLATENCYEND;
newKORSS1socialLATENCYENDNEW(badS1INF) = [];

newKORSS1socialMODIndFIRST5NEW = KORSS1socialMODIndFIRST5;
newKORSS1socialMODIndFIRST5NEW(badS1INF) = [];

newKORSS1socialMODIndPLATFIRST5NEW = KORSS1socialMODIndPLATFIRST5;
newKORSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newKORSS1socialMODIndSHORTSTIMFIRST5NEW = KORSS1socialMODIndSHORTSTIMFIRST5;
newKORSS1socialMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];


% newKORSS1volAUCSTIMNEW = KORSS1volAUCSTIM;
% newKORSS1volAUCSTIMNEW(badS1INF) = [];
% 
% newKORSS1volAUCSHORTSTIMNEW = KORSS1volAUCSHORTSTIM;
% newKORSS1volAUCSHORTSTIMNEW(badS1INF) = [];
% 
% newKORSS1volAUCPLATNEW = KORSS1volAUCPLAT;
% newKORSS1volAUCPLATNEW(badS1INF) = [];

% RSS1mouseIDKO(badS1INF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

RSS1cellsobj = find(allvolobjS1widths>= 400);

KOS1cellsobj = find(groupS1volALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allvolobjS1widths>= 400 & groupS1volALL == "KO");

KOS1objidx = idxS1KO(RSKOS1cellsobj-533);

RSYKO = Y(RSKOS1cellsobj,:);
figure;
plot(RSYKO(KOS1objidx==1,1),RSYKO(KOS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==2,1),RSYKO(KOS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOS1objidx==3,1),RSYKO(KOS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==4,1),RSYKO(KOS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==5,1),RSYKO(KOS1objidx==5,2),'c.','MarkerSize',12)

RSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(RSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellsobj);

KORSS1objMODInd = allvolobjS1MODInd(RSKOS1cellsobj);
KORSS1objMODIndSTIM = allvolobjS1MODIndSTIM(RSKOS1cellsobj);
KORSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(RSKOS1cellsobj);
KORSS1objMODIndPLAT = allvolobjS1MODIndPLAT(RSKOS1cellsobj);

KORSS1objMODIndFIRST10 = allvolobjS1MODIndFIRST10(RSKOS1cellsobj);
KORSS1objMODIndPLATFIRST10 = allvolobjS1MODIndPLATFIRST10(RSKOS1cellsobj);
KORSS1objMODIndSHORTSTIMFIRST10 = allvolobjS1MODIndSHORTSTIMFIRST10(RSKOS1cellsobj);

KORSS1objLATENCYONSET = allvolobjS1LATENCYONSET(RSKOS1cellsobj);
KORSS1objLATENCYEND = allvolobjS1LATENCYEND(RSKOS1cellsobj);

KORSS1objMODIndFIRST5 = allvolobjS1MODIndFIRST5(RSKOS1cellsobj);
KORSS1objMODIndPLATFIRST5 = allvolobjS1MODIndPLATFIRST5(RSKOS1cellsobj);
KORSS1objMODIndSHORTSTIMFIRST5 = allvolobjS1MODIndSHORTSTIMFIRST5(RSKOS1cellsobj);

% [badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLOBJZ,Inf));
% [badS1INFr,badS1INFc] = find(isnan(RSALLS1KOVOLOBJZ));
% badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLOBJZ = RSALLS1KOVOLOBJZ;
RSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];

newKORSS1objMODIndNEW = KORSS1objMODInd;
newKORSS1objMODIndNEW(badS1INF) = [];

newKORSS1objMODIndSTIMNEW = KORSS1objMODIndSTIM;
newKORSS1objMODIndSTIMNEW(badS1INF) = [];

newKORSS1objMODIndSHORTSTIMNEW = KORSS1objMODIndSHORTSTIM;
newKORSS1objMODIndSHORTSTIMNEW(badS1INF) = [];

newKORSS1objMODIndPLATNEW = KORSS1objMODIndPLAT;
newKORSS1objMODIndPLATNEW(badS1INF) = [];

newKORSS1objMODIndFIRST10NEW = KORSS1objMODIndFIRST10;
newKORSS1objMODIndFIRST10NEW(badS1INF) = [];

newKORSS1objMODIndPLATFIRST10NEW = KORSS1objMODIndPLATFIRST10;
newKORSS1objMODIndPLATFIRST10NEW(badS1INF) = [];

newKORSS1objMODIndSHORTSTIMFIRST10NEW = KORSS1objMODIndSHORTSTIMFIRST10;
newKORSS1objMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];

newKORSS1objLATENCYONSETNEW = KORSS1objLATENCYONSET;
newKORSS1objLATENCYONSETNEW(badS1INF) = [];

newKORSS1objLATENCYENDNEW = KORSS1objLATENCYEND;
newKORSS1objLATENCYENDNEW(badS1INF) = [];

newKORSS1objMODIndFIRST5NEW = KORSS1objMODIndFIRST5;
newKORSS1objMODIndFIRST5NEW(badS1INF) = [];

newKORSS1objMODIndPLATFIRST5NEW = KORSS1objMODIndPLATFIRST5;
newKORSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newKORSS1objMODIndSHORTSTIMFIRST5NEW = KORSS1objMODIndSHORTSTIMFIRST5;
newKORSS1objMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];


RSS1mouseIDKO(badS1INF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


%
%
%
%
%%
%
%
%
%
%% BLA



WTBLAcellssoc = find(groupBLAvolALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAvolALL == "WT");

WTBLAsocidx = idxBLAWT(RSWTBLAcellssoc);
RSBLAmouseIDWT = BLAmouseIDWT(RSWTBLAcellssoc);


RSYWT = Y(RSWTBLAcellssoc,:);
figure;
plot(RSYWT(WTBLAsocidx==1,1),RSYWT(WTBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==2,1),RSYWT(WTBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAsocidx==3,1),RSYWT(WTBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==4,1),RSYWT(WTBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);
WTRSBLAsocialMODInd = allvolsocialBLAMODInd(RSWTBLAcellssoc);

WTRSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(RSWTBLAcellssoc);
WTRSBLAsocialMODIndFIRST10 = allvolsocialBLAMODIndFIRST10(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLATFIRST10 = allvolsocialBLAMODIndPLATFIRST10(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIMFIRST10 = allvolsocialBLAMODIndSHORTSTIMFIRST10(RSWTBLAcellssoc);

WTRSBLAsocialMODIndFIRST5 = allvolsocialBLAMODIndFIRST5(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLATFIRST5 = allvolsocialBLAMODIndPLATFIRST5(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIMFIRST5 = allvolsocialBLAMODIndSHORTSTIMFIRST5(RSWTBLAcellssoc);

WTRSBLAsocialLATENCYONSET = allvolsocialBLALATENCYONSET(RSWTBLAcellssoc);
WTRSBLAsocialLATENCYEND = allvolsocialBLALATENCYEND(RSWTBLAcellssoc);

WTRSBLAvolAUCSTIM = allvolBLAAUCSTIM(RSWTBLAcellssoc);
WTRSBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAvolAUCPLAT = allvolBLAAUCPLAT(RSWTBLAcellssoc);

% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLSOCZ,Inf));
[badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAWTVOLSOCZ));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLSOCZ = RSALLBLAWTVOLSOCZ;
RSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];

newWTRSBLAsocialMODIndNEW = WTRSBLAsocialMODInd;
newWTRSBLAsocialMODIndNEW(badBLAINF) = [];

newWTRSBLAsocialMODIndSTIMNEW = WTRSBLAsocialMODIndSTIM;
newWTRSBLAsocialMODIndSTIMNEW(badBLAINF) = [];

newWTRSBLAsocialMODIndSHORTSTIMNEW = WTRSBLAsocialMODIndSHORTSTIM;
newWTRSBLAsocialMODIndSHORTSTIMNEW(badBLAINF) = [];

newWTRSBLAsocialMODIndPLATNEW = WTRSBLAsocialMODIndPLAT;
newWTRSBLAsocialMODIndPLATNEW(badBLAINF) = [];

newWTRSBLAsocialMODIndFIRST10NEW = WTRSBLAsocialMODIndFIRST10;
newWTRSBLAsocialMODIndFIRST10NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndPLATFIRST10NEW = WTRSBLAsocialMODIndPLATFIRST10;
newWTRSBLAsocialMODIndPLATFIRST10NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndSHORTSTIMFIRST10NEW = WTRSBLAsocialMODIndSHORTSTIMFIRST10;
newWTRSBLAsocialMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];

newWTRSBLAsocialLATENCYONSETNEW = WTRSBLAsocialLATENCYONSET;
newWTRSBLAsocialLATENCYONSETNEW(badBLAINF) = [];

newWTRSBLAsocialLATENCYENDNEW = WTRSBLAsocialLATENCYEND;
newWTRSBLAsocialLATENCYENDNEW(badBLAINF) = [];


newWTRSBLAsocialMODIndFIRST5NEW = WTRSBLAsocialMODIndFIRST5;
newWTRSBLAsocialMODIndFIRST5NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndPLATFIRST5NEW = WTRSBLAsocialMODIndPLATFIRST5;
newWTRSBLAsocialMODIndPLATFIRST5NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndSHORTSTIMFIRST5NEW = WTRSBLAsocialMODIndSHORTSTIMFIRST5;
newWTRSBLAsocialMODIndSHORTSTIMFIRST5NEW (badBLAINF) = [];

newWTRSBLAvolAUCSTIMNEW = WTRSBLAvolAUCSTIM;
newWTRSBLAvolAUCSTIMNEW(badBLAINF) = [];

newWTRSBLAvolAUCSHORTSTIMNEW = WTRSBLAvolAUCSHORTSTIM;
newWTRSBLAvolAUCSHORTSTIMNEW(badBLAINF) = [];

newWTRSBLAvolAUCPLATNEW = WTRSBLAvolAUCPLAT;
newWTRSBLAvolAUCPLATNEW(badBLAINF) = [];


RSallvolBLAWTSPONT = allvolBLAWTSPONT(RSWTBLAcellssoc,:);
RSallvolBLAWTSPONT(badBLAINF,:) = [];

% RSBLAmouseIDWT(badBLAINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;



WTBLAcellsobj = find(groupBLAvolALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAvolALL == "WT");

WTBLAobjidx = idxBLAWT(RSWTBLAcellsobj);


RSYWT = Y(RSWTBLAcellsobj,:);
figure;
plot(RSYWT(WTBLAobjidx==1,1),RSYWT(WTBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==2,1),RSYWT(WTBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAobjidx==3,1),RSYWT(WTBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==4,1),RSYWT(WTBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAWTVOLOBJZ = ALLBLAVOLOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);
WTRSBLAobjMODInd = allvolobjBLAMODInd(RSWTBLAcellsobj);

WTRSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(RSWTBLAcellsobj);
WTRSBLAobjMODIndFIRST10 = allvolobjBLAMODIndFIRST10(RSWTBLAcellssoc);
WTRSBLAobjMODIndPLATFIRST10 = allvolobjBLAMODIndPLATFIRST10(RSWTBLAcellssoc);
WTRSBLAobjMODIndSHORTSTIMFIRST10 = allvolobjBLAMODIndSHORTSTIMFIRST10(RSWTBLAcellssoc);

WTRSBLAobjLATENCYONSET = allvolobjBLALATENCYONSET(RSWTBLAcellssoc);
WTRSBLAobjLATENCYEND = allvolobjBLALATENCYEND(RSWTBLAcellssoc);

WTRSBLAobjMODIndFIRST5 = allvolobjBLAMODIndFIRST5(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLATFIRST5 = allvolobjBLAMODIndPLATFIRST5(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIMFIRST5 = allvolobjBLAMODIndSHORTSTIMFIRST5(RSWTBLAcellsobj);


% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLOBJZ,Inf));
% [badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAWTVOLOBJZ));
% badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLOBJZ = RSALLBLAWTVOLOBJZ;
RSnewALLBLAWTVOLOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];

newWTRSBLAobjMODIndNEW = WTRSBLAobjMODInd;
newWTRSBLAobjMODIndNEW(badBLAINF) = [];

newWTRSBLAobjMODIndSTIMNEW = WTRSBLAobjMODIndSTIM;
newWTRSBLAobjMODIndSTIMNEW(badBLAINF) = [];

newWTRSBLAobjMODIndSHORTSTIMNEW = WTRSBLAobjMODIndSHORTSTIM;
newWTRSBLAobjMODIndSHORTSTIMNEW(badBLAINF) = [];

newWTRSBLAobjMODIndPLATNEW = WTRSBLAobjMODIndPLAT;
newWTRSBLAobjMODIndPLATNEW(badBLAINF) = [];

newWTRSBLAobjMODIndFIRST10NEW = WTRSBLAobjMODIndFIRST10;
newWTRSBLAobjMODIndFIRST10NEW(badBLAINF) = [];

newWTRSBLAobjMODIndPLATFIRST10NEW = WTRSBLAobjMODIndPLATFIRST10;
newWTRSBLAobjMODIndPLATFIRST10NEW(badBLAINF) = [];

newWTRSBLAobjMODIndSHORTSTIMFIRST10NEW = WTRSBLAobjMODIndSHORTSTIMFIRST10;
newWTRSBLAobjMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];


newWTRSBLAobjMODIndFIRST5NEW = WTRSBLAobjMODIndFIRST5;
newWTRSBLAobjMODIndFIRST5NEW(badBLAINF) = [];

newWTRSBLAobjMODIndPLATFIRST5NEW = WTRSBLAobjMODIndPLATFIRST5;
newWTRSBLAobjMODIndPLATFIRST5NEW(badBLAINF) = [];

newWTRSBLAobjMODIndSHORTSTIMFIRST5NEW = WTRSBLAobjMODIndSHORTSTIMFIRST5;
newWTRSBLAobjMODIndSHORTSTIMFIRST5NEW (badBLAINF) = [];

newWTRSBLAobjLATENCYONSETNEW = WTRSBLAobjLATENCYONSET;
newWTRSBLAobjLATENCYONSETNEW(badBLAINF) = [];

newWTRSBLAobjLATENCYENDNEW = WTRSBLAobjLATENCYEND;
newWTRSBLAobjLATENCYENDNEW(badBLAINF) = [];

RSBLAmouseIDWT(badBLAINF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZ(find(newWTBLAobjidx==4),:),1)))); xlim([-2 6.95]);hold on;

%%


KOBLAcellssoc = find(groupBLAvolALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAvolALL == "KO");

KOBLAsocidx = idxBLAKO(RSKOBLAcellssoc-240);
RSBLAmouseIDKO = BLAmouseIDKO(RSKOBLAcellssoc-240);

RSYKO = Y(RSKOBLAcellssoc,:);
figure;
plot(RSYKO(KOBLAsocidx==1,1),RSYKO(KOBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==2,1),RSYKO(KOBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAsocidx==3,1),RSYKO(KOBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==4,1),RSYKO(KOBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellssoc);
KORSBLAsocialMODInd = allvolsocialBLAMODInd(RSKOBLAcellssoc);

KORSBLAsocialMODIndSTIM = allvolsocialBLAMODIndSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIM = allvolsocialBLAMODIndSHORTSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLAT = allvolsocialBLAMODIndPLAT(RSKOBLAcellssoc);
KORSBLAsocialMODIndFIRST10 = allvolsocialBLAMODIndFIRST10(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLATFIRST10 = allvolsocialBLAMODIndPLATFIRST10(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIMFIRST10 = allvolsocialBLAMODIndSHORTSTIMFIRST10(RSKOBLAcellssoc);

KORSBLAsocialLATENCYONSET = allvolsocialBLALATENCYONSET(RSKOBLAcellssoc);
KORSBLAsocialLATENCYEND = allvolsocialBLALATENCYEND(RSKOBLAcellssoc);

KORSBLAsocialMODIndFIRST5 = allvolsocialBLAMODIndFIRST5(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLATFIRST5 = allvolsocialBLAMODIndPLATFIRST5(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIMFIRST5 = allvolsocialBLAMODIndSHORTSTIMFIRST5(RSKOBLAcellssoc);
% KORSBLAvolAUCSTIM = allvolBLAAUCSTIM(RSKOBLAcellssoc);
% KORSBLAvolAUCSHORTSTIM = allvolBLAAUCSHORTSTIM(RSKOBLAcellssoc);
% KORSBLAvolAUCPLAT = allvolBLAAUCPLAT(RSKOBLAcellssoc);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLSOCZ,Inf));
[badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAKOVOLSOCZ));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLSOCZ = RSALLBLAKOVOLSOCZ;
RSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

newKORSBLAsocialMODIndNEW = KORSBLAsocialMODInd;
newKORSBLAsocialMODIndNEW(badBLAINF) = [];

newKORSBLAsocialMODIndSTIMNEW = KORSBLAsocialMODIndSTIM;
newKORSBLAsocialMODIndSTIMNEW(badBLAINF) = [];

newKORSBLAsocialMODIndSHORTSTIMNEW = KORSBLAsocialMODIndSHORTSTIM;
newKORSBLAsocialMODIndSHORTSTIMNEW(badBLAINF) = [];

newKORSBLAsocialMODIndPLATNEW = KORSBLAsocialMODIndPLAT;
newKORSBLAsocialMODIndPLATNEW(badBLAINF) = [];

newKORSBLAsocialMODIndFIRST10NEW = KORSBLAsocialMODIndFIRST10;
newKORSBLAsocialMODIndFIRST10NEW(badBLAINF) = [];

newKORSBLAsocialMODIndPLATFIRST10NEW = KORSBLAsocialMODIndPLATFIRST10;
newKORSBLAsocialMODIndPLATFIRST10NEW(badBLAINF) = [];

newKORSBLAsocialMODIndSHORTSTIMFIRST10NEW = KORSBLAsocialMODIndSHORTSTIMFIRST10;
newKORSBLAsocialMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];

newKORSBLAsocialLATENCYONSETNEW = KORSBLAsocialLATENCYONSET;
newKORSBLAsocialLATENCYONSETNEW(badBLAINF) = [];

newKORSBLAsocialLATENCYENDNEW = KORSBLAsocialLATENCYEND;
newKORSBLAsocialLATENCYENDNEW(badBLAINF) = [];


newKORSBLAsocialMODIndFIRST5NEW = KORSBLAsocialMODIndFIRST5;
newKORSBLAsocialMODIndFIRST5NEW(badBLAINF) = [];

newKORSBLAsocialMODIndPLATFIRST5NEW = KORSBLAsocialMODIndPLATFIRST5;
newKORSBLAsocialMODIndPLATFIRST5NEW(badBLAINF) = [];

newKORSBLAsocialMODIndSHORTSTIMFIRST5NEW = KORSBLAsocialMODIndSHORTSTIMFIRST5;
newKORSBLAsocialMODIndSHORTSTIMFIRST5NEW (badBLAINF) = [];

% RSBLAmouseIDKO(badBLAINF) = [];
% newKORSBLAvolAUCSTIMNEW = KORSBLAvolAUCSTIM;
% newKORSBLAvolAUCSTIMNEW(badBLAINF) = [];
% 
% newKORSBLAvolAUCSHORTSTIMNEW = KORSBLAvolAUCSHORTSTIM;
% newKORSBLAvolAUCSHORTSTIMNEW(badBLAINF) = [];
% 
% newKORSBLAvolAUCPLATNEW = KORSBLAvolAUCPLAT;
% newKORSBLAvolAUCPLATNEW(badBLAINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;



KOBLAcellsobj = find(groupBLAvolALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAvolALL == "KO");

KOBLAobjidx = idxBLAKO(RSKOBLAcellsobj-240);

RSYKO = Y(RSKOBLAcellsobj,:);
figure;
plot(RSYKO(KOBLAobjidx==1,1),RSYKO(KOBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==2,1),RSYKO(KOBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAobjidx==3,1),RSYKO(KOBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==4,1),RSYKO(KOBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAKOVOLOBJZ = ALLBLAVOLOBJZ(RSKOBLAcellsobj,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellsobj);

KORSBLAobjMODInd = allvolobjBLAMODInd(RSKOBLAcellsobj);

KORSBLAobjMODIndSTIM = allvolobjBLAMODIndSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIM = allvolobjBLAMODIndSHORTSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndPLAT = allvolobjBLAMODIndPLAT(RSKOBLAcellsobj);

KORSBLAobjMODIndFIRST10 = allvolobjBLAMODIndFIRST10(RSKOBLAcellssoc);
KORSBLAobjMODIndPLATFIRST10 = allvolobjBLAMODIndPLATFIRST10(RSKOBLAcellssoc);
KORSBLAobjMODIndSHORTSTIMFIRST10 = allvolobjBLAMODIndSHORTSTIMFIRST10(RSKOBLAcellssoc);

KORSBLAobjLATENCYONSET = allvolobjBLALATENCYONSET(RSKOBLAcellssoc);
KORSBLAobjLATENCYEND = allvolobjBLALATENCYEND(RSKOBLAcellssoc);

KORSBLAobjMODIndFIRST5 = allvolobjBLAMODIndFIRST5(RSKOBLAcellsobj);
KORSBLAobjMODIndPLATFIRST5 = allvolobjBLAMODIndPLATFIRST5(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIMFIRST5 = allvolobjBLAMODIndSHORTSTIMFIRST5(RSKOBLAcellsobj);
% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLOBJZ,Inf));
% [badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAKOVOLOBJZ));
% badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLOBJZ = RSALLBLAKOVOLOBJZ;
RSnewALLBLAKOVOLOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

newKORSBLAobjMODIndNEW = KORSBLAobjMODInd;
newKORSBLAobjMODIndNEW(badBLAINF) = [];


newKORSBLAobjMODIndSTIMNEW = KORSBLAobjMODIndSTIM;
newKORSBLAobjMODIndSTIMNEW(badBLAINF) = [];

newKORSBLAobjMODIndSHORTSTIMNEW = KORSBLAobjMODIndSHORTSTIM;
newKORSBLAobjMODIndSHORTSTIMNEW(badBLAINF) = [];

newKORSBLAobjMODIndPLATNEW = KORSBLAobjMODIndPLAT;
newKORSBLAobjMODIndPLATNEW(badBLAINF) = [];

newKORSBLAobjMODIndFIRST10NEW = KORSBLAobjMODIndFIRST10;
newKORSBLAobjMODIndFIRST10NEW(badBLAINF) = [];

newKORSBLAobjMODIndPLATFIRST10NEW = KORSBLAobjMODIndPLATFIRST10;
newKORSBLAobjMODIndPLATFIRST10NEW(badBLAINF) = [];

newKORSBLAobjMODIndSHORTSTIMFIRST10NEW = KORSBLAobjMODIndSHORTSTIMFIRST10;
newKORSBLAobjMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];

newKORSBLAobjLATENCYONSETNEW = KORSBLAobjLATENCYONSET;
newKORSBLAobjLATENCYONSETNEW(badBLAINF) = [];

newKORSBLAobjLATENCYENDNEW = KORSBLAobjLATENCYEND;
newKORSBLAobjLATENCYENDNEW(badBLAINF) = [];


newKORSBLAobjMODIndFIRST5NEW = KORSBLAobjMODIndFIRST5;
newKORSBLAobjMODIndFIRST5NEW(badBLAINF) = [];

newKORSBLAobjMODIndPLATFIRST5NEW = KORSBLAobjMODIndPLATFIRST5;
newKORSBLAobjMODIndPLATFIRST5NEW(badBLAINF) = [];

newKORSBLAobjMODIndSHORTSTIMFIRST5NEW = KORSBLAobjMODIndSHORTSTIMFIRST5;
newKORSBLAobjMODIndSHORTSTIMFIRST5NEW (badBLAINF) = [];


RSBLAmouseIDKO(badBLAINF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;




%% ISOLATE BY GENOTYPE


RSSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

RSWTSTRcellssoc = find(groupSTRvolALL == "WT");

WTSTRsocidx = idxSTRWT(RSWTSTRcellssoc);

RSSTRmouseIDWT = STRmouseIDWT(RSWTSTRcellssoc);


RSXWT = X(RSWTSTRcellssoc,:);
figure;
plot(RSXWT(WTSTRsocidx==1,1),RSXWT(WTSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==2,1),RSXWT(WTSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(WTSTRsocidx==3,1),RSXWT(WTSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==4,1),RSXWT(WTSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==5,1),RSXWT(WTSTRsocidx==5,2),'c.','MarkerSize',12)

figure;
plot(RSXWT(RSSTRmouseIDWT==1,1),RSXWT(RSSTRmouseIDWT==1,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==2,1),RSXWT(RSSTRmouseIDWT==2,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(RSSTRmouseIDWT==3,1),RSXWT(RSSTRmouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==4,1),RSXWT(RSSTRmouseIDWT==4,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==5,1),RSXWT(RSSTRmouseIDWT==5,2),'c.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==6,1),RSXWT(RSSTRmouseIDWT==6,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(RSSTRmouseIDWT==3,1),RSXWT(RSSTRmouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==7,1),RSXWT(RSSTRmouseIDWT==7,2),'m.','MarkerSize',12)
hold on
plot(RSXWT(RSSTRmouseIDWT==8,1),RSXWT(RSSTRmouseIDWT==8,2),'c.','MarkerSize',12)


RSALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(RSWTSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellssoc);
WTRSSTRsocialMODInd = allvolsocialSTRMODInd(RSWTSTRcellssoc);

WTRSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(RSWTSTRcellssoc);
WTRSSTRsocialMODIndFIRST10 = allvolsocialSTRMODIndFIRST10(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLATFIRST10 = allvolsocialSTRMODIndPLATFIRST10(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIMFIRST10 = allvolsocialSTRMODIndSHORTSTIMFIRST10(RSWTSTRcellssoc);

WTRSSTRsocialMODIndFIRST5 = allvolsocialSTRMODIndFIRST5(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLATFIRST5 = allvolsocialSTRMODIndPLATFIRST5(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIMFIRST5 = allvolsocialSTRMODIndSHORTSTIMFIRST5(RSWTSTRcellssoc);



WTRSSTRsocialLATENCYONSET = allvolsocialSTRLATENCYONSET(RSWTSTRcellssoc);
WTRSSTRsocialLATENCYEND = allvolsocialSTRLATENCYEND(RSWTSTRcellssoc);

WTRSSTRvolAUCSTIM = allvolSTRAUCSTIM(RSWTSTRcellssoc);
WTRSSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(RSWTSTRcellssoc);
WTRSSTRvolAUCPLAT = allvolSTRAUCPLAT(RSWTSTRcellssoc);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLSOCZ = RSALLSTRWTVOLSOCZ;
RSnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];

newWTRSSTRsocialMODIndNEW = WTRSSTRsocialMODInd;
newWTRSSTRsocialMODIndNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndSTIMNEW = WTRSSTRsocialMODIndSTIM;
newWTRSSTRsocialMODIndSTIMNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndSHORTSTIMNEW = WTRSSTRsocialMODIndSHORTSTIM;
newWTRSSTRsocialMODIndSHORTSTIMNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndPLATNEW = WTRSSTRsocialMODIndPLAT;
newWTRSSTRsocialMODIndPLATNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndFIRST10NEW = WTRSSTRsocialMODIndFIRST10;
newWTRSSTRsocialMODIndFIRST10NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndPLATFIRST10NEW = WTRSSTRsocialMODIndPLATFIRST10;
newWTRSSTRsocialMODIndPLATFIRST10NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndSHORTSTIMFIRST10NEW = WTRSSTRsocialMODIndSHORTSTIMFIRST10;
newWTRSSTRsocialMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];

newWTRSSTRsocialLATENCYONSETNEW = WTRSSTRsocialLATENCYONSET;
newWTRSSTRsocialLATENCYONSETNEW(badSTRINF) = [];

newWTRSSTRsocialLATENCYENDNEW = WTRSSTRsocialLATENCYEND;
newWTRSSTRsocialLATENCYENDNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndFIRST5NEW = WTRSSTRsocialMODIndFIRST5;
newWTRSSTRsocialMODIndFIRST5NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndPLATFIRST5NEW = WTRSSTRsocialMODIndPLATFIRST5;
newWTRSSTRsocialMODIndPLATFIRST5NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndSHORTSTIMFIRST5NEW = WTRSSTRsocialMODIndSHORTSTIMFIRST5;
newWTRSSTRsocialMODIndSHORTSTIMFIRST5NEW (badSTRINF) = [];

newWTRSSTRvolAUCSTIMNEW = WTRSSTRvolAUCSTIM;
newWTRSSTRvolAUCSTIMNEW(badSTRINF) = [];

newWTRSSTRvolAUCSHORTSTIMNEW = WTRSSTRvolAUCSHORTSTIM;
newWTRSSTRvolAUCSHORTSTIMNEW(badSTRINF) = [];

newWTRSSTRvolAUCPLATNEW = WTRSSTRvolAUCPLAT;
newWTRSSTRvolAUCPLATNEW(badSTRINF) = [];

% RSSTRmouseIDWT(badSTRINF) = [];

RSallvolSTRWTSPONT = allvolSTRWTSPONT(RSWTSTRcellssoc,:);
RSallvolSTRWTSPONT(badSTRINF,:) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRvolALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(groupSTRvolALL == "WT");

WTSTRobjidx = idxSTRWT(RSWTSTRcellsobj);



RSXWT = X(RSWTSTRcellsobj,:);
figure;
plot(RSXWT(WTSTRobjidx==1,1),RSXWT(WTSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==2,1),RSXWT(WTSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(WTSTRobjidx==3,1),RSXWT(WTSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==4,1),RSXWT(WTSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==5,1),RSXWT(WTSTRobjidx==5,2),'c.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==6,1),RSXWT(WTSTRobjidx==6,2),'c.','MarkerSize',12)

RSALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(RSWTSTRcellsobj,:);

% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);
WTRSSTRobjMODInd = allvolobjSTRMODInd(RSWTSTRcellsobj);
WTRSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(RSWTSTRcellsobj);
WTRSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(RSWTSTRcellsobj);
WTRSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(RSWTSTRcellsobj);
WTRSSTRobjMODIndFIRST10 = allvolobjSTRMODIndFIRST10(RSWTSTRcellssoc);
WTRSSTRobjMODIndPLATFIRST10 = allvolobjSTRMODIndPLATFIRST10(RSWTSTRcellssoc);
WTRSSTRobjMODIndSHORTSTIMFIRST10 = allvolobjSTRMODIndSHORTSTIMFIRST10(RSWTSTRcellssoc);


WTRSSTRobjMODIndFIRST5 = allvolobjSTRMODIndFIRST5(RSWTSTRcellsobj);
WTRSSTRobjMODIndPLATFIRST5 = allvolobjSTRMODIndPLATFIRST5(RSWTSTRcellsobj);
WTRSSTRobjMODIndSHORTSTIMFIRST5 = allvolobjSTRMODIndSHORTSTIMFIRST5(RSWTSTRcellsobj);

WTRSSTRobjLATENCYONSET = allvolobjSTRLATENCYONSET(RSWTSTRcellssoc);
WTRSSTRobjLATENCYEND = allvolobjSTRLATENCYEND(RSWTSTRcellssoc);

% [badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLOBJZ,Inf));
% badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLOBJZ = RSALLSTRWTVOLOBJZ;
RSnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];

newWTRSSTRobjMODIndNEW = WTRSSTRobjMODInd;
newWTRSSTRobjMODIndNEW(badSTRINF) = [];

newWTRSSTRobjMODIndSTIMNEW = WTRSSTRobjMODIndSTIM;
newWTRSSTRobjMODIndSTIMNEW(badSTRINF) = [];

newWTRSSTRobjMODIndSHORTSTIMNEW = WTRSSTRobjMODIndSHORTSTIM;
newWTRSSTRobjMODIndSHORTSTIMNEW(badSTRINF) = [];

newWTRSSTRobjMODIndPLATNEW = WTRSSTRobjMODIndPLAT;
newWTRSSTRobjMODIndPLATNEW(badSTRINF) = [];

newWTRSSTRobjMODIndFIRST10NEW = WTRSSTRobjMODIndFIRST10;
newWTRSSTRobjMODIndFIRST10NEW(badSTRINF) = [];

newWTRSSTRobjMODIndPLATFIRST10NEW = WTRSSTRobjMODIndPLATFIRST10;
newWTRSSTRobjMODIndPLATFIRST10NEW(badSTRINF) = [];

newWTRSSTRobjMODIndSHORTSTIMFIRST10NEW = WTRSSTRobjMODIndSHORTSTIMFIRST10;
newWTRSSTRobjMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];

newWTRSSTRobjLATENCYONSETNEW = WTRSSTRobjLATENCYONSET;
newWTRSSTRobjLATENCYONSETNEW(badSTRINF) = [];

newWTRSSTRobjLATENCYENDNEW = WTRSSTRobjLATENCYEND;
newWTRSSTRobjLATENCYENDNEW(badSTRINF) = [];

newWTRSSTRobjMODIndFIRST5NEW = WTRSSTRobjMODIndFIRST5;
newWTRSSTRobjMODIndFIRST5NEW(badSTRINF) = [];

newWTRSSTRobjMODIndPLATFIRST5NEW = WTRSSTRobjMODIndPLATFIRST5;
newWTRSSTRobjMODIndPLATFIRST5NEW(badSTRINF) = [];

newWTRSSTRobjMODIndSHORTSTIMFIRST5NEW = WTRSSTRobjMODIndSHORTSTIMFIRST5;
newWTRSSTRobjMODIndSHORTSTIMFIRST5NEW (badSTRINF) = [];

RSSTRmouseIDWT(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(groupSTRvolALL == "KO");

KOSTRsocidx = idxSTRKO(RSKOSTRcellssoc-266);
RSSTRmouseIDKO = STRmouseIDKO(RSKOSTRcellssoc-266);

RSXKO = X(RSKOSTRcellssoc,:);
figure;
plot(RSXKO(KOSTRsocidx==1,1),RSXKO(KOSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==2,1),RSXKO(KOSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXKO(KOSTRsocidx==3,1),RSXKO(KOSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==4,1),RSXKO(KOSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==5,1),RSXKO(KOSTRsocidx==5,2),'c.','MarkerSize',12)

RSALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(RSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellssoc);
KORSSTRsocialMODInd = allvolsocialSTRMODInd(RSKOSTRcellssoc);

KORSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(RSKOSTRcellssoc);
KORSSTRsocialMODIndFIRST10 = allvolsocialSTRMODIndFIRST10(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLATFIRST10 = allvolsocialSTRMODIndPLATFIRST10(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIMFIRST10 = allvolsocialSTRMODIndSHORTSTIMFIRST10(RSKOSTRcellssoc);

KORSSTRsocialLATENCYONSET = allvolsocialSTRLATENCYONSET(RSKOSTRcellssoc);
KORSSTRsocialLATENCYEND = allvolsocialSTRLATENCYEND(RSKOSTRcellssoc);

KORSSTRsocialMODIndFIRST5 = allvolsocialSTRMODIndFIRST5(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLATFIRST5 = allvolsocialSTRMODIndPLATFIRST5(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIMFIRST5 = allvolsocialSTRMODIndSHORTSTIMFIRST5(RSKOSTRcellssoc);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLSOCZ = RSALLSTRKOVOLSOCZ;
RSnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];

newKORSSTRsocialMODIndNEW = KORSSTRsocialMODInd;
newKORSSTRsocialMODIndNEW(badSTRINF) = [];

newKORSSTRsocialMODIndSTIMNEW = KORSSTRsocialMODIndSTIM;
newKORSSTRsocialMODIndSTIMNEW(badSTRINF) = [];

newKORSSTRsocialMODIndSHORTSTIMNEW = KORSSTRsocialMODIndSHORTSTIM;
newKORSSTRsocialMODIndSHORTSTIMNEW(badSTRINF) = [];

newKORSSTRsocialMODIndPLATNEW = KORSSTRsocialMODIndPLAT;
newKORSSTRsocialMODIndPLATNEW(badSTRINF) = [];


newKORSSTRsocialMODIndFIRST10NEW = KORSSTRsocialMODIndFIRST10;
newKORSSTRsocialMODIndFIRST10NEW(badSTRINF) = [];

newKORSSTRsocialMODIndPLATFIRST10NEW = KORSSTRsocialMODIndPLATFIRST10;
newKORSSTRsocialMODIndPLATFIRST10NEW(badSTRINF) = [];

newKORSSTRsocialMODIndSHORTSTIMFIRST10NEW = KORSSTRsocialMODIndSHORTSTIMFIRST10;
newKORSSTRsocialMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];

newKORSSTRsocialLATENCYONSETNEW = KORSSTRsocialLATENCYONSET;
newKORSSTRsocialLATENCYONSETNEW(badSTRINF) = [];

newKORSSTRsocialLATENCYENDNEW = KORSSTRsocialLATENCYEND;
newKORSSTRsocialLATENCYENDNEW(badSTRINF) = [];

newKORSSTRsocialMODIndFIRST5NEW = KORSSTRsocialMODIndFIRST5;
newKORSSTRsocialMODIndFIRST5NEW(badSTRINF) = [];

newKORSSTRsocialMODIndPLATFIRST5NEW = KORSSTRsocialMODIndPLATFIRST5;
newKORSSTRsocialMODIndPLATFIRST5NEW(badSTRINF) = [];

newKORSSTRsocialMODIndSHORTSTIMFIRST5NEW = KORSSTRsocialMODIndSHORTSTIMFIRST5;
newKORSSTRsocialMODIndSHORTSTIMFIRST5NEW (badSTRINF) = [];


RSSTRmouseIDKO(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRvolALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(groupSTRvolALL == "KO");

KOSTRobjidx = idxSTRKO(RSKOSTRcellsobj-266);


RSXKO = X(RSKOSTRcellsobj,:);
figure;
plot(RSXKO(KOSTRobjidx==1,1),RSXKO(KOSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==2,1),RSXKO(KOSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXKO(KOSTRobjidx==3,1),RSXKO(KOSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==4,1),RSXKO(KOSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==5,1),RSXKO(KOSTRobjidx==5,2),'c.','MarkerSize',12)

RSALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(RSKOSTRcellsobj,:);

KORSSTRobjMODInd = allvolobjSTRMODInd(RSKOSTRcellsobj);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellsobj);
KORSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(RSKOSTRcellsobj);
KORSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(RSKOSTRcellsobj);
KORSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(RSKOSTRcellsobj);
KORSSTRobjMODIndFIRST10 = allvolobjSTRMODIndFIRST10(RSKOSTRcellssoc);
KORSSTRobjMODIndPLATFIRST10 = allvolobjSTRMODIndPLATFIRST10(RSKOSTRcellssoc);
KORSSTRobjMODIndSHORTSTIMFIRST10 = allvolobjSTRMODIndSHORTSTIMFIRST10(RSKOSTRcellssoc);

KORSSTRobjLATENCYONSET = allvolobjSTRLATENCYONSET(RSKOSTRcellssoc);
KORSSTRobjLATENCYEND = allvolobjSTRLATENCYEND(RSKOSTRcellssoc);

KORSSTRobjMODIndFIRST5 = allvolobjSTRMODIndFIRST5(RSKOSTRcellsobj);
KORSSTRobjMODIndPLATFIRST5 = allvolobjSTRMODIndPLATFIRST5(RSKOSTRcellsobj);
KORSSTRobjMODIndSHORTSTIMFIRST5 = allvolobjSTRMODIndSHORTSTIMFIRST5(RSKOSTRcellsobj);

% [badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLOBJZ,Inf));
% badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLOBJZ = RSALLSTRKOVOLOBJZ;
RSnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];

newKORSSTRobjMODIndNEW = KORSSTRobjMODInd;
newKORSSTRobjMODIndNEW(badSTRINF) = [];

newKORSSTRobjMODIndSTIMNEW = KORSSTRobjMODIndSTIM;
newKORSSTRobjMODIndSTIMNEW(badSTRINF) = [];

newKORSSTRobjMODIndSHORTSTIMNEW = KORSSTRobjMODIndSHORTSTIM;
newKORSSTRobjMODIndSHORTSTIMNEW(badSTRINF) = [];

newKORSSTRobjMODIndPLATNEW = KORSSTRobjMODIndPLAT;
newKORSSTRobjMODIndPLATNEW(badSTRINF) = [];

newKORSSTRobjMODIndFIRST10NEW = KORSSTRobjMODIndFIRST10;
newKORSSTRobjMODIndFIRST10NEW(badSTRINF) = [];

newKORSSTRobjMODIndPLATFIRST10NEW = KORSSTRobjMODIndPLATFIRST10;
newKORSSTRobjMODIndPLATFIRST10NEW(badSTRINF) = [];

newKORSSTRobjMODIndSHORTSTIMFIRST10NEW = KORSSTRobjMODIndSHORTSTIMFIRST10;
newKORSSTRobjMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];

newKORSSTRobjLATENCYONSETNEW = KORSSTRobjLATENCYONSET;
newKORSSTRobjLATENCYONSETNEW(badSTRINF) = [];

newKORSSTRobjLATENCYENDNEW = KORSSTRobjLATENCYEND;
newKORSSTRobjLATENCYENDNEW(badSTRINF) = [];

newKORSSTRobjMODIndFIRST5NEW = KORSSTRobjMODIndFIRST5;
newKORSSTRobjMODIndFIRST5NEW(badSTRINF) = [];

newKORSSTRobjMODIndPLATFIRST5NEW = KORSSTRobjMODIndPLATFIRST5;
newKORSSTRobjMODIndPLATFIRST5NEW(badSTRINF) = [];

newKORSSTRobjMODIndSHORTSTIMFIRST5NEW = KORSSTRobjMODIndSHORTSTIMFIRST5;
newKORSSTRobjMODIndSHORTSTIMFIRST5NEW (badSTRINF) = [];

RSSTRmouseIDKO(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%
FSS1cellssoc = find(allvolsocS1widths< 400);

WTS1cellssoc = find(groupS1volALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allvolsocS1widths< 400 & groupS1volALL == "WT");

WTS1socidx = idxS1WT(FSWTS1cellssoc);

FSS1mouseIDWT = S1mouseIDWT(FSWTS1cellssoc);


FSYWT = Y(FSWTS1cellssoc,:);
figure; subplot(2,1,1);
plot(FSYWT(WTS1socidx==1,1),FSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==2,1),FSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(WTS1socidx==3,1),FSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==4,1),FSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==5,1),FSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)

figure;
plot(FSYWT(FSS1mouseIDWT==1,1),FSYWT(FSS1mouseIDWT==1,2),'r.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==2,1),FSYWT(FSS1mouseIDWT==2,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(FSS1mouseIDWT==3,1),FSYWT(FSS1mouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==4,1),FSYWT(FSS1mouseIDWT==4,2),'k.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==5,1),FSYWT(FSS1mouseIDWT==5,2),'c.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==6,1),FSYWT(FSS1mouseIDWT==6,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(FSS1mouseIDWT==3,1),FSYWT(FSS1mouseIDWT==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==7,1),FSYWT(FSS1mouseIDWT==7,2),'m.','MarkerSize',12)
hold on
plot(FSYWT(FSS1mouseIDWT==8,1),FSYWT(FSS1mouseIDWT==8,2),'c.','MarkerSize',12)



FSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(FSWTS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellssoc);
WTFSS1socialMODInd = allvolsocialS1MODInd(FSWTS1cellssoc);
WTFSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(FSWTS1cellssoc);

WTFSS1socialMODIndFIRST5 = allvolsocialS1MODIndFIRST5(FSWTS1cellssoc);
WTFSS1socialMODIndPLATFIRST5 = allvolsocialS1MODIndPLATFIRST5(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIMFIRST5 = allvolsocialS1MODIndSHORTSTIMFIRST5(FSWTS1cellssoc);

WTFSS1volAUCSTIM = allvolS1AUCSTIM(FSWTS1cellssoc);
WTFSS1volAUCSHORTSTIM = allvolS1AUCSHORTSTIM(FSWTS1cellssoc);
WTFSS1volAUCPLAT = allvolS1AUCPLAT(FSWTS1cellssoc);


KOFSS1socialMODIndFIRST5 = allvolsocialS1MODIndFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndPLATFIRST5 = allvolsocialS1MODIndPLATFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIMFIRST5 = allvolsocialS1MODIndSHORTSTIMFIRST5(FSKOS1cellssoc);

% [badS1INFr,badS1INFc] = find(ismember(FSALLS1WTVOLSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1WTVOLSOCZ));
badS1INF = unique(badS1INFr);
FSnewALLS1WTVOLSOCZ = FSALLS1WTVOLSOCZ;
FSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];

newWTFSS1socialMODIndNEW = WTFSS1socialMODInd;
newWTFSS1socialMODIndNEW(badS1INF) = [];

newWTFSS1socialMODIndSTIMNEW = WTFSS1socialMODIndSTIM;
newWTFSS1socialMODIndSTIMNEW(badS1INF) = [];

newWTFSS1socialMODIndSHORTSTIMNEW = WTFSS1socialMODIndSHORTSTIM;
newWTFSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newWTFSS1socialMODIndPLATNEW = WTFSS1socialMODIndPLAT;
newWTFSS1socialMODIndPLATNEW(badS1INF) = [];

newWTFSS1socialMODIndFIRST5NEW = WTFSS1socialMODIndFIRST5;
newWTFSS1socialMODIndFIRST5NEW(badS1INF) = [];

newWTFSS1socialMODIndPLATFIRST5NEW = WTFSS1socialMODIndPLATFIRST5;
newWTFSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newWTFSS1socialMODIndSHORTSTIMFIRST5NEW = WTFSS1socialMODIndSHORTSTIMFIRST5;
newWTFSS1socialMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];


newWTFSS1volAUCSTIMNEW = WTFSS1volAUCSTIM;
newWTFSS1volAUCSTIMNEW(badS1INF) = [];

newWTFSS1volAUCSHORTSTIMNEW = WTFSS1volAUCSHORTSTIM;
newWTFSS1volAUCSHORTSTIMNEW(badS1INF) = [];

newWTFSS1volAUCPLATNEW = WTFSS1volAUCPLAT;
newWTFSS1volAUCPLATNEW(badS1INF) = [];




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);


FSS1cellsobj = find(allvolobjS1widths< 400);

WTS1cellsobj = find(groupS1volALL == "WT");

%FSWTS1cellsobj = find(ismember(WTS1cellsobj,FSS1cellsobj)==1);

FSWTS1cellsobj = find(allvolobjS1widths< 400 & groupS1volALL == "WT");

WTS1objidx = idxS1WT(FSWTS1cellsobj);

WTFSobjMODInd = allvolobjS1MODInd(FSWTS1cellsobj);




FSYWT = Y(FSWTS1cellsobj,:);
figure;
plot(FSYWT(WTS1objidx==1,1),FSYWT(WTS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYWT(WTS1objidx==2,1),FSYWT(WTS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(WTS1objidx==3,1),FSYWT(WTS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(WTS1objidx==4,1),FSYWT(WTS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYWT(WTS1objidx==5,1),FSYWT(WTS1objidx==5,2),'c.','MarkerSize',12)

FSALLS1WTVOLOBJZ = ALLS1VOLOBJZ(FSWTS1cellsobj,:);

% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellsobj);
WTFSS1objMODInd = allvolobjS1MODInd(FSWTS1cellsobj);
WTFSS1objMODIndSTIM = allvolobjS1MODIndSTIM(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(FSWTS1cellsobj);
WTFSS1objMODIndPLAT = allvolobjS1MODIndPLAT(FSWTS1cellsobj);

WTFSS1objMODIndFIRST5 = allvolobjS1MODIndFIRST5(FSWTS1cellsobj);
WTFSS1objMODIndPLATFIRST5 = allvolobjS1MODIndPLATFIRST5(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIMFIRST5 = allvolobjS1MODIndSHORTSTIMFIRST5(FSWTS1cellsobj);
% [badS1INFr,badS1INFc] = find(ismember(FSALLS1WTVOLOBJZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1WTVOLOBJZ));
badS1INF = unique(badS1INFr);
FSnewALLS1WTVOLOBJZ = FSALLS1WTVOLOBJZ;
FSnewALLS1WTVOLOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1FSWTnoinf = newmouseS1FSWT;
% newmouseS1FSWTnoinf(badS1INF) = [];

newWTFSS1objMODIndNEW = WTFSS1objMODInd;
newWTFSS1objMODIndNEW(badS1INF) = [];

newWTFSS1objMODIndSTIMNEW = WTFSS1objMODIndSTIM;
newWTFSS1objMODIndSTIMNEW(badS1INF) = [];

newWTFSS1objMODIndSHORTSTIMNEW = WTFSS1objMODIndSHORTSTIM;
newWTFSS1objMODIndSHORTSTIMNEW(badS1INF) = [];

newWTFSS1objMODIndPLATNEW = WTFSS1objMODIndPLAT;
newWTFSS1objMODIndPLATNEW(badS1INF) = [];

newWTFSS1objMODIndFIRST5NEW = WTFSS1objMODIndFIRST5;
newWTFSS1objMODIndFIRST5NEW(badS1INF) = [];

newWTFSS1objMODIndPLATFIRST5NEW = WTFSS1objMODIndPLATFIRST5;
newWTFSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newWTFSS1objMODIndSHORTSTIMFIRST5NEW = WTFSS1objMODIndSHORTSTIMFIRST5;
newWTFSS1objMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:)),nanstd(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:))/(sqrt(size(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:)),nanstd(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:))/(sqrt(size(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:)),nanstd(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:))/(sqrt(size(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:)),nanstd(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:))/(sqrt(size(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:)),nanstd(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:))/(sqrt(size(FSnewALLS1WTVOLOBJZ(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

FSS1cellssoc = find(allvolsocS1widths< 400);

KOS1cellssoc = find(groupS1volALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allvolsocS1widths< 400 & groupS1volALL == "KO");

KOS1socidx = idxS1KO(FSKOS1cellssoc-533);




FSYKO = Y(FSKOS1cellssoc,:);
figure;
plot(FSYKO(KOS1socidx==1,1),FSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==2,1),FSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYKO(KOS1socidx==3,1),FSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==4,1),FSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==5,1),FSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)

FSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(FSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1(FSKOS1cellssoc);

KOFSS1socialMODInd = allvolsocialS1MODInd(FSKOS1cellssoc);

KOFSS1socialMODIndSTIM = allvolsocialS1MODIndSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIM = allvolsocialS1MODIndSHORTSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndPLAT = allvolsocialS1MODIndPLAT(FSKOS1cellssoc);


KOFSS1socialMODIndFIRST5 = allvolsocialS1MODIndFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndPLATFIRST5 = allvolsocialS1MODIndPLATFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIMFIRST5 = allvolsocialS1MODIndSHORTSTIMFIRST5(FSKOS1cellssoc);
% KOFSS1volAUCSTIM = allvolS1AUCSTIM(FSKOS1cellssoc);
% KOFSS1volAUCSHORTSTIM = allvolS1AUCSHORTSTIM(FSKOS1cellssoc);
% KOFSS1volAUCPLAT = allvolS1AUCPLAT(FSKOS1cellssoc);


% [badS1INFr,badS1INFc] = find(ismember(FSALLS1KOVOLSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1KOVOLSOCZ));
badS1INF = unique(badS1INFr);
FSnewALLS1KOVOLSOCZ = FSALLS1KOVOLSOCZ;
FSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];

newKOFSS1socialMODIndNEW = KOFSS1socialMODInd;
newKOFSS1socialMODIndNEW(badS1INF) = [];

newKOFSS1socialMODIndSTIMNEW = KOFSS1socialMODIndSTIM;
newKOFSS1socialMODIndSTIMNEW(badS1INF) = [];

newKOFSS1socialMODIndSHORTSTIMNEW = KOFSS1socialMODIndSHORTSTIM;
newKOFSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newKOFSS1socialMODIndPLATNEW = KOFSS1socialMODIndPLAT;
newKOFSS1socialMODIndPLATNEW(badS1INF) = [];


newKOFSS1socialMODIndFIRST5NEW = KOFSS1socialMODIndFIRST5;
newKOFSS1socialMODIndFIRST5NEW(badS1INF) = [];

newKOFSS1socialMODIndPLATFIRST5NEW = KOFSS1socialMODIndPLATFIRST5;
newKOFSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newKOFSS1socialMODIndSHORTSTIMFIRST5NEW = KOFSS1socialMODIndSHORTSTIMFIRST5;
newKOFSS1socialMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];
% 
% newKOFSS1volAUCSTIMNEW = KOFSS1volAUCSTIM;
% newKOFSS1volAUCSTIMNEW(badS1INF) = [];
% 
% newKOFSS1volAUCSHORTSTIMNEW = KOFSS1volAUCSHORTSTIM;
% newKOFSS1volAUCSHORTSTIMNEW(badS1INF) = [];
% 
% newKOFSS1volAUCPLATNEW = KOFSS1volAUCPLAT;
% newKOFSS1volAUCPLATNEW(badS1INF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

FSS1cellsobj = find(allvolobjS1widths< 400);

KOS1cellsobj = find(groupS1volALL == "KO");

%FSKOS1cellsobj = find(ismember(KOS1cellsobj,FSS1cellsobj)==1);

FSKOS1cellsobj = find(allvolobjS1widths< 400 & groupS1volALL == "KO");

KOS1objidx = idxS1KO(FSKOS1cellsobj-533);

FSYKO = Y(FSKOS1cellsobj,:);
figure;
plot(FSYKO(KOS1objidx==1,1),FSYKO(KOS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYKO(KOS1objidx==2,1),FSYKO(KOS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYKO(KOS1objidx==3,1),FSYKO(KOS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYKO(KOS1objidx==4,1),FSYKO(KOS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYKO(KOS1objidx==5,1),FSYKO(KOS1objidx==5,2),'c.','MarkerSize',12)

FSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(FSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1(FSKOS1cellsobj);

KOFSS1objMODInd = allvolobjS1MODInd(FSKOS1cellsobj);
KOFSS1objMODIndSTIM = allvolobjS1MODIndSTIM(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIM = allvolobjS1MODIndSHORTSTIM(FSKOS1cellsobj);
KOFSS1objMODIndPLAT = allvolobjS1MODIndPLAT(FSKOS1cellsobj);

KOFSS1objMODIndFIRST5 = allvolobjS1MODIndFIRST5(FSKOS1cellsobj);
KOFSS1objMODIndPLATFIRST5 = allvolobjS1MODIndPLATFIRST5(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIMFIRST5 = allvolobjS1MODIndSHORTSTIMFIRST5(FSKOS1cellsobj);

% [badS1INFr,badS1INFc] = find(ismember(FSALLS1KOVOLOBJZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1KOVOLOBJZ));
badS1INF = unique(badS1INFr);
FSnewALLS1KOVOLOBJZ = FSALLS1KOVOLOBJZ;
FSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1FSKOnoinf = newmouseS1FSKO;
% newmouseS1FSKOnoinf(badS1INF) = [];

newKOFSS1objMODIndNEW = KOFSS1objMODInd;
newKOFSS1objMODIndNEW(badS1INF) = [];

newKOFSS1objMODIndSTIMNEW = KOFSS1objMODIndSTIM;
newKOFSS1objMODIndSTIMNEW(badS1INF) = [];

newKOFSS1objMODIndSHORTSTIMNEW = KOFSS1objMODIndSHORTSTIM;
newKOFSS1objMODIndSHORTSTIMNEW(badS1INF) = [];

newKOFSS1objMODIndPLATNEW = KOFSS1objMODIndPLAT;
newKOFSS1objMODIndPLATNEW(badS1INF) = [];

newKOFSS1objMODIndFIRST5NEW = KOFSS1objMODIndFIRST5;
newKOFSS1objMODIndFIRST5NEW(badS1INF) = [];

newKOFSS1objMODIndPLATFIRST5NEW = KOFSS1objMODIndPLATFIRST5;
newKOFSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newKOFSS1objMODIndSHORTSTIMFIRST5NEW = KOFSS1objMODIndSHORTSTIMFIRST5;
newKOFSS1objMODIndSHORTSTIMFIRST5NEW (badS1INF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:)),nanstd(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:))/(sqrt(size(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:)),nanstd(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:))/(sqrt(size(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:)),nanstd(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:))/(sqrt(size(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:)),nanstd(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:))/(sqrt(size(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:)),nanstd(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:))/(sqrt(size(FSnewALLS1KOVOLOBJZ(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


%% Create cells sorted based on cluster

[~,Indexofmax] = max(testSTRALL,[],2);

[minum, indxall] = sort(idxSTR,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsSTRsortPCA(i,:) = testSTRALL(newindex,:);
end


[~,Indexofmax] = max(testBLAALL,[],2);

[minum, indxall] = sort(idxBLA,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsBLAsortPCA(i,:) = testBLAALL(newindex,:);
end

[~,Indexofmax] = max(testS1ALL,[],2);

[minum, indxall] = sort(idxS1,'ascend');


for i = 1:length(indxall)
    newindex = indxall(i);
    newmeansortedcellsS1sortPCA(i,:) = testS1ALL(newindex,:);
end

%%
%
%
%
%%%

%% FAST SPIKING CELLS AND THEIR FIRING
%
%
%
%%
FSX = X(find(allvolsocSTRwidths<475),:);
FSidxSTR = idxSTR(allvolsocSTRwidths<475);
figure;subplot(3,1,1);
plot(FSX(FSidxSTR==1,1),FSX(FSidxSTR==1,2),'k.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==2,1),FSX(FSidxSTR==2,2),'r.','MarkerSize',12)
hold on; plot(FSX(FSidxSTR==3,1),FSX(FSidxSTR==3,2),'b.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==4,1),FSX(FSidxSTR==4,2),'c.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==5,1),FSX(FSidxSTR==5,2),'g.','MarkerSize',12)




FSALLSTRVOLSOCZ = ALLSTRVOLSOCZ(find(allvolsocSTRwidths<475),:);
subplot(3,1,2); gscatter(FSX(:,1),FSX(:,2));

subplot(3,1,3); shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRVOLSOCZ(find(FSidxSTR==1),:)),nanstd(FSALLSTRVOLSOCZ(find(FSidxSTR==1),:))/(sqrt(size(FSALLSTRVOLSOCZ(find(FSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRVOLSOCZ(find(FSidxSTR==2),:)),nanstd(FSALLSTRVOLSOCZ(find(FSidxSTR==2),:))/(sqrt(size(FSALLSTRVOLSOCZ(find(FSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRVOLSOCZ(find(FSidxSTR==3),:)),nanstd(FSALLSTRVOLSOCZ(find(FSidxSTR==3),:))/(sqrt(size(FSALLSTRVOLSOCZ(find(FSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRVOLSOCZ(find(FSidxSTR==4),:)),nanstd(FSALLSTRVOLSOCZ(find(FSidxSTR==4),:))/(sqrt(size(FSALLSTRVOLSOCZ(find(FSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRVOLSOCZ(find(FSidxSTR==5),:)),nanstd(FSALLSTRVOLSOCZ(find(FSidxSTR==5),:))/(sqrt(size(FSALLSTRVOLSOCZ(find(FSidxSTR==5),:),1))),'lineprops', 'c'); 


%% S1
FSY = Y(find(allvolsocS1widths< 400),:);
%[idx,c] = kmeans(FSY,5);

FSidxS1 = idxS1(find(allvolsocS1widths<400));
figure; 

%subplot(3,1,1);
plot(FSY(FSidxS1==1,1),FSY(FSidxS1==1,2),'k.','MarkerSize',12)
hold on
plot(FSY(FSidxS1==2,1),FSY(FSidxS1==2,2),'r.','MarkerSize',12)
hold on; plot(FSY(FSidxS1==3,1),FSY(FSidxS1==3,2),'b.','MarkerSize',12)
hold on
plot(FSY(FSidxS1==4,1),FSY(FSidxS1==4,2),'c.','MarkerSize',12)
hold on
plot(FSY(FSidxS1==5,1),FSY(FSidxS1==5,2),'g.','MarkerSize',12)

FSALLS1VOLSOCZ = ALLS1VOLSOCZ(find(allvolsocS1widths<400),:);

mouseS1 = [newmouseS1WT, newmouseS1KO];
FSmouseS1 = mouseS1(find(allvolsocS1widths<400));


[badS1INFr,badS1INFc] = find(ismember(FSALLS1VOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1VOLSOCZ = FSALLS1VOLSOCZ;
FSnewALLS1VOLSOCZ(badS1INF, :) = [];
newidx = FSidxS1;
newidx(badS1INF, :) = [];
newFSmouseS1 = FSmouseS1;
newFSmouseS1(badS1INF) = [];

subplot(3,1,2); gscatter(FSY(:,1),FSY(:,2));
figure; gscatter(FSY(:,1),FSY(:,2), FSmouseS1');

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==1),:)),nanstd(ALLS1VOLSOCZ(find(idx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==2),:)),nanstd(ALLS1VOLSOCZ(find(idx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==3),:)),nanstd(ALLS1VOLSOCZ(find(idx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==4),:)),nanstd(ALLS1VOLSOCZ(find(idx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(idx==5),:)),nanstd(ALLS1VOLSOCZ(find(idx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1VOLSOCZ(find(newidx==1),:)),nanstd(FSnewALLS1VOLSOCZ(find(newidx==1),:))/(sqrt(size(FSnewALLS1VOLSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1VOLSOCZ(find(newidx==2),:)),nanstd(FSnewALLS1VOLSOCZ(find(newidx==2),:))/(sqrt(size(FSnewALLS1VOLSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1VOLSOCZ(find(newidx==3),:)),nanstd(FSnewALLS1VOLSOCZ(find(newidx==3),:))/(sqrt(size(FSnewALLS1VOLSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1VOLSOCZ(find(newidx==4),:)),nanstd(FSnewALLS1VOLSOCZ(find(newidx==4),:))/(sqrt(size(FSnewALLS1VOLSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1VOLSOCZ(find(newidx==5),:)),nanstd(FSnewALLS1VOLSOCZ(find(newidx==5),:))/(sqrt(size(FSnewALLS1VOLSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); 

%% BLA

FSZ = Z;
FSidxBLA = idxBLA;
figure;subplot(3,1,1);
plot(FSZ(FSidxBLA==1,1),FSZ(FSidxBLA==1,2),'k.','MarkerSize',12)
hold on
plot(FSZ(FSidxBLA==2,1),FSZ(FSidxBLA==2,2),'r.','MarkerSize',12)
hold on; plot(FSZ(FSidxBLA==3,1),FSZ(FSidxBLA==3,2),'b.','MarkerSize',12)
hold on
plot(FSZ(FSidxBLA==4,1),FSZ(FSidxBLA==4,2),'c.','MarkerSize',12)
hold on
plot(FSZ(FSidxBLA==5,1),FSZ(FSidxBLA==5,2),'g.','MarkerSize',12)


FSALLBLAVOLSOCZ = ALLBLAVOLSOCZ;
subplot(3,1,2); gscatter(FSZ(:,1),FSZ(:,2));


subplot(3,1,3); shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAVOLSOCZ(find(FSidxBLA==1),:)),nanstd(FSALLBLAVOLSOCZ(find(FSidxBLA==1),:))/(sqrt(size(FSALLBLAVOLSOCZ(find(FSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAVOLSOCZ(find(FSidxBLA==2),:)),nanstd(FSALLBLAVOLSOCZ(find(FSidxBLA==2),:))/(sqrt(size(FSALLBLAVOLSOCZ(find(FSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAVOLSOCZ(find(FSidxBLA==3),:)),nanstd(FSALLBLAVOLSOCZ(find(FSidxBLA==3),:))/(sqrt(size(FSALLBLAVOLSOCZ(find(FSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAVOLSOCZ(find(FSidxBLA==4),:)),nanstd(FSALLBLAVOLSOCZ(find(FSidxBLA==4),:))/(sqrt(size(FSALLBLAVOLSOCZ(find(FSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAVOLSOCZ(find(FSidxBLA==5),:)),nanstd(FSALLBLAVOLSOCZ(find(FSidxBLA==5),:))/(sqrt(size(FSALLBLAVOLSOCZ(find(FSidxBLA==5),:),1))),'lineprops', 'g'); hold on;



%%
%
%
%
%
%% ISOLATE BY GENOTYPE


FSS1cellssoc = find(allvolsocS1widths< 400);

WTS1cellssoc = find(groupS1volALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allvolsocS1widths< 400 & groupS1volALL == "WT");

WTS1socidx = idxS1(FSWTS1cellssoc);


FSYWT = Y(FSWTS1cellssoc,:);
figure;
plot(FSYWT(WTS1socidx==1,1),FSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==2,1),FSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYWT(WTS1socidx==3,1),FSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==4,1),FSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYWT(WTS1socidx==5,1),FSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)

FSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(FSWTS1cellssoc,:);

newmouseS1 = [newmouseS1WT, newmouseS1KO];

newmouseS1FSWT = newmouseS1WT(FSWTS1cellssoc);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTVOLSOCZ = FSALLS1WTVOLSOCZ;
FSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
newmouseS1FSWTnoinf = newmouseS1FSWT;
newmouseS1FSWTnoinf(badS1INF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(10); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTVOLSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);

%%

FSS1cellssoc = find(allvolsocS1widths< 400);

KOS1cellssoc = find(groupS1volALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allvolsocS1widths< 400 & groupS1volALL == "KO");

KOS1socidx = idxS1(FSKOS1cellssoc);


FSYKO = Y(FSKOS1cellssoc,:);
figure;
plot(FSYKO(KOS1socidx==1,1),FSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==2,1),FSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSYKO(KOS1socidx==3,1),FSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==4,1),FSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSYKO(KOS1socidx==5,1),FSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)

FSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(FSKOS1cellssoc,:);

newmouseS1 = [newmouseS1KO, newmouseS1KO];

newmouseS1FSKO = newmouseS1(FSKOS1cellssoc);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOVOLSOCZ = FSALLS1KOVOLSOCZ;
FSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
newmouseS1FSKOnoinf = newmouseS1FSKO;
newmouseS1FSKOnoinf(badS1INF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(10); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOVOLSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


%
%
%
%
%%
%
%
%
%
%% BLA

WTBLAcellssoc = find(groupBLAvolsoc == "WT");


WTBLAsocidx = idxBLA(WTBLAcellssoc);


FSZWT = FSZ(WTBLAcellssoc,:);
figure;
plot(FSZWT(WTBLAsocidx==1,1),FSZWT(WTBLAsocidx==1,2),'k.','MarkerSize',12)
hold on
plot(FSZWT(WTBLAsocidx==2,1),FSZWT(WTBLAsocidx==2,2),'r.','MarkerSize',12)
hold on; plot(FSZWT(WTBLAsocidx==3,1),FSZWT(WTBLAsocidx==3,2),'b.','MarkerSize',12)
hold on
plot(FSZWT(WTBLAsocidx==4,1),FSZWT(WTBLAsocidx==4,2),'g.','MarkerSize',12)
hold on
plot(FSZWT(WTBLAsocidx==5,1),FSZWT(WTBLAsocidx==5,2),'c.','MarkerSize',12)


FSALLBLAWTVOLSOCZ = FSALLBLAVOLSOCZ(WTBLAcellssoc,:);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTVOLSOCZ = FSALLBLAWTVOLSOCZ;
FSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:)),nanstd(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:)),nanstd(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:)),nanstd(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:)),nanstd(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==5),:)),nanstd(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==5),:))/(sqrt(size(FSnewALLBLAWTVOLSOCZ(find(newWTBLAsocidx==5),:),1)))); xlim([-2 6.95]);hold on;


%%


KOBLAcellssoc = find(groupBLAvolsoc == "KO");

% FSKOBLAcellssoc = find(ismember(FSBLAcellssoc,KOBLAcellssoc)==1);

KOBLAsocidx = idxBLA(KOBLAcellssoc);


FSZKO = FSZ(KOBLAcellssoc,:);
figure;
plot(FSZKO(KOBLAsocidx==1,1),FSZKO(KOBLAsocidx==1,2),'k.','MarkerSize',12)
hold on
plot(FSZKO(KOBLAsocidx==2,1),FSZKO(KOBLAsocidx==2,2),'r.','MarkerSize',12)
hold on; plot(FSZKO(KOBLAsocidx==3,1),FSZKO(KOBLAsocidx==3,2),'b.','MarkerSize',12)
hold on
plot(FSZKO(KOBLAsocidx==4,1),FSZKO(KOBLAsocidx==4,2),'g.','MarkerSize',12)
hold on
plot(FSZKO(KOBLAsocidx==5,1),FSZKO(KOBLAsocidx==5,2),'c.','MarkerSize',12)


FSALLBLAKOVOLSOCZ = FSALLBLAVOLSOCZ(KOBLAcellssoc,:);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOVOLSOCZ = FSALLBLAKOVOLSOCZ;
FSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:)),nanstd(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on; title('cluster 1'); legend('WT','KO');
subplot(5,2,3); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:)),nanstd(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 2'); legend('WT','KO');
subplot(5,2,5); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:)),nanstd(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 3'); legend('WT','KO');
subplot(5,2,7); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:)),nanstd(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 4'); legend('WT','KO');
subplot(5,2,9); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==5),:)),nanstd(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==5),:))/(sqrt(size(FSnewALLBLAKOVOLSOCZ(find(newKOBLAsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 5'); legend('WT','KO');

%


%% ISOLATE BY GENOTYPE


FSSTRcellssoc = find(allvolobjSTRwidths<475);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%FSWTSTRcellssoc = find(ismember(WTSTRcellssoc,FSSTRcellssoc)==1);

FSWTSTRcellssoc = find(allvolobjSTRwidths<475 & groupSTRvolALL == "WT");

WTSTRsocidx = idxSTR(FSWTSTRcellssoc);


FSXWT = X(FSWTSTRcellssoc,:);
figure;
plot(FSXWT(WTSTRsocidx==1,1),FSXWT(WTSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRsocidx==2,1),FSXWT(WTSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSXWT(WTSTRsocidx==3,1),FSXWT(WTSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRsocidx==4,1),FSXWT(WTSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRsocidx==5,1),FSXWT(WTSTRsocidx==5,2),'c.','MarkerSize',12)

FSALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(FSWTSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellssoc);
WTFSSTRsocialMODInd = allvolsocialSTRMODInd(FSWTSTRcellssoc);

WTFSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(FSWTSTRcellssoc);

WTFSSTRvolAUCSTIM = allvolSTRAUCSTIM(FSWTSTRcellssoc);
WTFSSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRvolAUCPLAT = allvolSTRAUCPLAT(FSWTSTRcellssoc);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTVOLSOCZ = FSALLSTRWTVOLSOCZ;
FSnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];

newWTFSSTRsocialMODIndNEW = WTFSSTRsocialMODInd;
newWTFSSTRsocialMODIndNEW(badSTRINF) = [];

newWTFSSTRsocialMODIndSTIMNEW = WTFSSTRsocialMODIndSTIM;
newWTFSSTRsocialMODIndSTIMNEW(badSTRINF) = [];

newWTFSSTRsocialMODIndSHORTSTIMNEW = WTFSSTRsocialMODIndSHORTSTIM;
newWTFSSTRsocialMODIndSHORTSTIMNEW(badSTRINF) = [];

newWTFSSTRsocialMODIndPLATNEW = WTFSSTRsocialMODIndPLAT;
newWTFSSTRsocialMODIndPLATNEW(badSTRINF) = [];


newWTFSSTRvolAUCSTIMNEW = WTFSSTRvolAUCSTIM;
newWTFSSTRvolAUCSTIMNEW(badSTRINF) = [];

newWTFSSTRvolAUCSHORTSTIMNEW = WTFSSTRvolAUCSHORTSTIM;
newWTFSSTRvolAUCSHORTSTIMNEW(badSTRINF) = [];

newWTFSSTRvolAUCPLATNEW = WTFSSTRvolAUCPLAT;
newWTFSSTRvolAUCPLATNEW(badSTRINF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:)),nanstd(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRWTVOLSOCZ(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


FSSTRcellsobj = find(allvolobjSTRwidths<475);

WTSTRcellsobj = find(groupSTRvolALL == "WT");

%FSWTSTRcellsobj = find(ismember(WTSTRcellsobj,FSSTRcellsobj)==1);

FSWTSTRcellsobj = find(allvolobjSTRwidths<475 & groupSTRvolALL == "WT");

WTSTRobjidx = idxSTR(FSWTSTRcellsobj);



FSXWT = X(FSWTSTRcellsobj,:);
figure;
plot(FSXWT(WTSTRobjidx==1,1),FSXWT(WTSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRobjidx==2,1),FSXWT(WTSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSXWT(WTSTRobjidx==3,1),FSXWT(WTSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRobjidx==4,1),FSXWT(WTSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRobjidx==5,1),FSXWT(WTSTRobjidx==5,2),'c.','MarkerSize',12)
hold on
plot(FSXWT(WTSTRobjidx==6,1),FSXWT(WTSTRobjidx==6,2),'c.','MarkerSize',12)

FSALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(FSWTSTRcellsobj,:);

% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellsobj);
WTFSSTRobjMODInd = allvolobjSTRMODInd(FSWTSTRcellsobj);
WTFSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(FSWTSTRcellsobj);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTVOLOBJZ = FSALLSTRWTVOLOBJZ;
FSnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSWTnoinf = newmouseSTRFSWT;
% newmouseSTRFSWTnoinf(badSTRINF) = [];

newWTFSSTRobjMODIndNEW = WTFSSTRobjMODInd;
newWTFSSTRobjMODIndNEW(badSTRINF) = [];

newWTFSSTRobjMODIndSTIMNEW = WTFSSTRobjMODIndSTIM;
newWTFSSTRobjMODIndSTIMNEW(badSTRINF) = [];

newWTFSSTRobjMODIndSHORTSTIMNEW = WTFSSTRobjMODIndSHORTSTIM;
newWTFSSTRobjMODIndSHORTSTIMNEW(badSTRINF) = [];

newWTFSSTRobjMODIndPLATNEW = WTFSSTRobjMODIndPLAT;
newWTFSSTRobjMODIndPLATNEW(badSTRINF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:)),nanstd(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRWTVOLOBJZ(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

FSSTRcellssoc = find(allvolobjSTRwidths<475);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%FSKOSTRcellssoc = find(ismember(KOSTRcellssoc,FSSTRcellssoc)==1);

FSKOSTRcellssoc = find(allvolobjSTRwidths<475 & groupSTRvolALL == "KO");

KOSTRsocidx = idxSTRKO(FSKOSTRcellssoc-266);


FSXKO = X(FSKOSTRcellssoc,:);
figure;
plot(FSXKO(KOSTRsocidx==1,1),FSXKO(KOSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRsocidx==2,1),FSXKO(KOSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSXKO(KOSTRsocidx==3,1),FSXKO(KOSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRsocidx==4,1),FSXKO(KOSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRsocidx==5,1),FSXKO(KOSTRsocidx==5,2),'c.','MarkerSize',12)

FSALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(FSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTR(FSKOSTRcellssoc);
KOFSSTRsocialMODInd = allvolsocialSTRMODInd(FSKOSTRcellssoc);

KOFSSTRsocialMODIndSTIM = allvolsocialSTRMODIndSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndSHORTSTIM = allvolsocialSTRMODIndSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndPLAT = allvolsocialSTRMODIndPLAT(FSKOSTRcellssoc);

KOFSSTRvolAUCSTIM = allvolSTRAUCSTIM(FSKOSTRcellssoc);
KOFSSTRvolAUCSHORTSTIM = allvolSTRAUCSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRvolAUCPLAT = allvolSTRAUCPLAT(FSKOSTRcellssoc);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOVOLSOCZ = FSALLSTRKOVOLSOCZ;
FSnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];

newKOFSSTRsocialMODIndNEW = KOFSSTRsocialMODInd;
newKOFSSTRsocialMODIndNEW(badSTRINF) = [];

newKOFSSTRsocialMODIndSTIMNEW = KOFSSTRsocialMODIndSTIM;
newKOFSSTRsocialMODIndSTIMNEW(badSTRINF) = [];

newKOFSSTRsocialMODIndSHORTSTIMNEW = KOFSSTRsocialMODIndSHORTSTIM;
newKOFSSTRsocialMODIndSHORTSTIMNEW(badSTRINF) = [];

newKOFSSTRsocialMODIndPLATNEW = KOFSSTRsocialMODIndPLAT;
newKOFSSTRsocialMODIndPLATNEW(badSTRINF) = [];


newKOFSSTRvolAUCSTIMNEW = KOFSSTRvolAUCSTIM;
newKOFSSTRvolAUCSTIMNEW(badSTRINF) = [];

newKOFSSTRvolAUCSHORTSTIMNEW = KOFSSTRvolAUCSHORTSTIM;
newKOFSSTRvolAUCSHORTSTIMNEW(badSTRINF) = [];

newKOFSSTRvolAUCPLATNEW = KOFSSTRvolAUCPLAT;
newKOFSSTRvolAUCPLATNEW(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:)),nanstd(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRKOVOLSOCZ(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


FSSTRcellsobj = find(allvolobjSTRwidths<475);

KOSTRcellsobj = find(groupSTRvolALL == "KO");

%FSKOSTRcellsobj = find(ismember(KOSTRcellsobj,FSSTRcellsobj)==1);

FSKOSTRcellsobj = find(allvolobjSTRwidths<475 & groupSTRvolALL == "KO");

KOSTRobjidx = idxSTRKO(FSKOSTRcellsobj-266);


FSXKO = X(FSKOSTRcellsobj,:);
figure;
plot(FSXKO(KOSTRobjidx==1,1),FSXKO(KOSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRobjidx==2,1),FSXKO(KOSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(FSXKO(KOSTRobjidx==3,1),FSXKO(KOSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRobjidx==4,1),FSXKO(KOSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(FSXKO(KOSTRobjidx==5,1),FSXKO(KOSTRobjidx==5,2),'c.','MarkerSize',12)

FSALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(FSKOSTRcellsobj,:);

KOFSSTRobjMODInd = allvolobjSTRMODInd(FSKOSTRcellsobj);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTR(FSKOSTRcellsobj);
KOFSSTRobjMODIndSTIM = allvolobjSTRMODIndSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndSHORTSTIM = allvolobjSTRMODIndSHORTSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndPLAT = allvolobjSTRMODIndPLAT(FSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOVOLOBJZ = FSALLSTRKOVOLOBJZ;
FSnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRFSKOnoinf = newmouseSTRFSKO;
% newmouseSTRFSKOnoinf(badSTRINF) = [];

newKOFSSTRobjMODIndNEW = KOFSSTRobjMODInd;
newKOFSSTRobjMODIndNEW(badSTRINF) = [];

newKOFSSTRobjMODIndSTIMNEW = KOFSSTRobjMODIndSTIM;
newKOFSSTRobjMODIndSTIMNEW(badSTRINF) = [];

newKOFSSTRobjMODIndSHORTSTIMNEW = KOFSSTRobjMODIndSHORTSTIM;
newKOFSSTRobjMODIndSHORTSTIMNEW(badSTRINF) = [];

newKOFSSTRobjMODIndPLATNEW = KOFSSTRobjMODIndPLAT;
newKOFSSTRobjMODIndPLATNEW(badSTRINF) = [];




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:)),nanstd(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRKOVOLOBJZ(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);



%%
%
%
%
%
%% Smoothened RS Cells Firing

RSS1cellssoc = find(allvolsocS1widths>=400);

WTS1cellssoc = find(groupS1volALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allvolsocS1widths>=400 & groupS1volALL == "WT");

% RSWTS1cellssoc = find(groupS1volALL == "WT");


WTS1socidx = idxS1(RSWTS1cellssoc);


RSYWT = Y(RSWTS1cellssoc,:);
figure;
plot(RSYWT(WTS1socidx==1,1),RSYWT(WTS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==2,1),RSYWT(WTS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTS1socidx==3,1),RSYWT(WTS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==4,1),RSYWT(WTS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYWT(WTS1socidx==5,1),RSYWT(WTS1socidx==5,2),'c.','MarkerSize',12)
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellssoc);

RSALLS1WTVOLSOCZ = ALLS1VOLSOCZ(RSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLSOCZ = RSALLS1WTVOLSOCZ;
RSnewALLS1WTVOLSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1WTVOLSOCZ,1)
    RSnewALLS1WTVOLSOCZSM(a,:) = smoothdata(RSnewALLS1WTVOLSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTVOLSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);


RSS1cellsobj = find(allvolobjS1widths>=400);

WTS1cellsobj = find(groupS1volALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allvolobjS1widths>=400 & groupS1volALL == "WT");

% RSWTS1cellsobj = find(groupS1volALL == "WT");


WTS1objidx = idxS1(RSWTS1cellsobj);


RSYWT = Y(RSWTS1cellsobj,:);
figure;
plot(RSYWT(WTS1objidx==1,1),RSYWT(WTS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==2,1),RSYWT(WTS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTS1objidx==3,1),RSYWT(WTS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==4,1),RSYWT(WTS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYWT(WTS1objidx==5,1),RSYWT(WTS1objidx==5,2),'c.','MarkerSize',12)

RSALLS1WTVOLOBJZ = ALLS1VOLOBJZ(RSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTVOLOBJZ = RSALLS1WTVOLOBJZ;
RSnewALLS1WTVOLOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1WTVOLOBJZ,1)
    RSnewALLS1WTVOLOBJZSM(a,:) = smoothdata(RSnewALLS1WTVOLOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTVOLOBJZSM(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

RSS1cellssoc = find(allvolsocS1widths>=400);

KOS1cellssoc = find(groupS1volALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allvolsocS1widths>=400 & groupS1volALL == "KO");

% RSKOS1cellssoc = find(groupS1volALL == "KO");


KOS1socidx = idxS1(RSKOS1cellssoc);


RSYKO = Y(RSKOS1cellssoc,:);
figure;
plot(RSYKO(KOS1socidx==1,1),RSYKO(KOS1socidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==2,1),RSYKO(KOS1socidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOS1socidx==3,1),RSYKO(KOS1socidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==4,1),RSYKO(KOS1socidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYKO(KOS1socidx==5,1),RSYKO(KOS1socidx==5,2),'c.','MarkerSize',12)

RSALLS1KOVOLSOCZ = ALLS1VOLSOCZ(RSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellssoc);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLSOCZ = RSALLS1KOVOLSOCZ;
RSnewALLS1KOVOLSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOVOLSOCZ,1)
    RSnewALLS1KOVOLSOCZSM(a,:) = smoothdata(RSnewALLS1KOVOLSOCZ(a,:),'movmean',4);
end




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1VOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1VOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOVOLSOCZSM(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSS1cellsobj = find(allvolobjS1widths>= 400);

KOS1cellsobj = find(groupS1volALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allvolobjS1widths>= 400 & groupS1volALL == "KO");

% RSKOS1cellsobj = find(groupS1volALL == "KO");


KOS1objidx = idxS1(RSKOS1cellsobj);


RSYKO = Y(RSKOS1cellsobj,:);
figure;
plot(RSYKO(KOS1objidx==1,1),RSYKO(KOS1objidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==2,1),RSYKO(KOS1objidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOS1objidx==3,1),RSYKO(KOS1objidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==4,1),RSYKO(KOS1objidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSYKO(KOS1objidx==5,1),RSYKO(KOS1objidx==5,2),'c.','MarkerSize',12)

RSALLS1KOVOLOBJZ = ALLS1VOLOBJZ(RSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOVOLOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOVOLOBJZ = RSALLS1KOVOLOBJZ;
RSnewALLS1KOVOLOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOVOLOBJZ,1)
    RSnewALLS1KOVOLOBJZSM(a,:) = smoothdata(RSnewALLS1KOVOLOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1VOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1VOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1VOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOVOLOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRvolALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

RSWTSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250 & groupSTRvolALL == "WT");

% RSWTSTRcellssoc = find(groupSTRvolALL == "WT");


WTSTRsocidx = idxSTR(RSWTSTRcellssoc);


RSXWT = X(RSWTSTRcellssoc,:);
figure;
plot(RSXWT(WTSTRsocidx==1,1),RSXWT(WTSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==2,1),RSXWT(WTSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(WTSTRsocidx==3,1),RSXWT(WTSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==4,1),RSXWT(WTSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==5,1),RSXWT(WTSTRsocidx==5,2),'c.','MarkerSize',12)
% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellssoc);

RSALLSTRWTVOLSOCZ = ALLSTRVOLSOCZ(RSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLSOCZ = RSALLSTRWTVOLSOCZ;
RSnewALLSTRWTVOLSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRWTVOLSOCZ,1)
    RSnewALLSTRWTVOLSOCZSM(a,:) = smoothdata(RSnewALLSTRWTVOLSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRvolALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250 & groupSTRvolALL == "WT");

% RSWTSTRcellsobj = find(groupSTRvolALL == "WT");


WTSTRobjidx = idxSTR(RSWTSTRcellsobj);


RSXWT = X(RSWTSTRcellsobj,:);
figure;
plot(RSXWT(WTSTRobjidx==1,1),RSXWT(WTSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==2,1),RSXWT(WTSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(WTSTRobjidx==3,1),RSXWT(WTSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==4,1),RSXWT(WTSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRobjidx==5,1),RSXWT(WTSTRobjidx==5,2),'c.','MarkerSize',12)

RSALLSTRWTVOLOBJZ = ALLSTRVOLOBJZ(RSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTVOLOBJZ = RSALLSTRWTVOLOBJZ;
RSnewALLSTRWTVOLOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRWTVOLOBJZ,1)
    RSnewALLSTRWTVOLOBJZSM(a,:) = smoothdata(RSnewALLSTRWTVOLOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTVOLOBJZSM(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250);

KOSTRcellssoc = find(groupSTRvolALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(allvolsocSTRwidths>550 & allvolsocSTRwidths<1250 & groupSTRvolALL == "KO");

% RSKOSTRcellssoc = find(groupSTRvolALL == "KO");


KOSTRsocidx = idxSTR(RSKOSTRcellssoc);


RSXKO = X(RSKOSTRcellssoc,:);
figure;
plot(RSXKO(KOSTRsocidx==1,1),RSXKO(KOSTRsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==2,1),RSXKO(KOSTRsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXKO(KOSTRsocidx==3,1),RSXKO(KOSTRsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==4,1),RSXKO(KOSTRsocidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRsocidx==5,1),RSXKO(KOSTRsocidx==5,2),'c.','MarkerSize',12)

RSALLSTRKOVOLSOCZ = ALLSTRVOLSOCZ(RSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellssoc);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLSOCZ = RSALLSTRKOVOLSOCZ;
RSnewALLSTRKOVOLSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOVOLSOCZ,1)
    RSnewALLSTRKOVOLSOCZSM(a,:) = smoothdata(RSnewALLSTRKOVOLSOCZ(a,:),'movmean',4);
end




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLSOCZSM(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRvolALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(allvolobjSTRwidths>550 & allvolobjSTRwidths<1250 & groupSTRvolALL == "KO");

% RSKOSTRcellsobj = find(groupSTRvolALL == "KO");


KOSTRobjidx = idxSTR(RSKOSTRcellsobj);


RSXKO = X(RSKOSTRcellsobj,:);
figure;
plot(RSXKO(KOSTRobjidx==1,1),RSXKO(KOSTRobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==2,1),RSXKO(KOSTRobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSXKO(KOSTRobjidx==3,1),RSXKO(KOSTRobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==4,1),RSXKO(KOSTRobjidx==4,2),'k.','MarkerSize',12)
hold on
plot(RSXKO(KOSTRobjidx==5,1),RSXKO(KOSTRobjidx==5,2),'c.','MarkerSize',12)

RSALLSTRKOVOLOBJZ = ALLSTRVOLOBJZ(RSKOSTRcellsobj,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOVOLOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOVOLOBJZ = RSALLSTRKOVOLOBJZ;
RSnewALLSTRKOVOLOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOVOLOBJZ,1)
    RSnewALLSTRKOVOLOBJZSM(a,:) = smoothdata(RSnewALLSTRKOVOLOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOVOLOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%
%% BLA



WTBLAcellssoc = find(groupBLAvolALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAvolALL == "WT");

WTBLAsocidx = idxBLA(RSWTBLAcellssoc);


RSYWT = Y(RSWTBLAcellssoc,:);
figure;
plot(RSYWT(WTBLAsocidx==1,1),RSYWT(WTBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==2,1),RSYWT(WTBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAsocidx==3,1),RSYWT(WTBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==4,1),RSYWT(WTBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAWTVOLSOCZ = ALLBLAVOLSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLSOCZ = RSALLBLAWTVOLSOCZ;
RSnewALLBLAWTVOLSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTVOLSOCZ,1)
    RSnewALLBLAWTVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAWTVOLSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;



WTBLAcellsobj = find(groupBLAvolALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAvolALL == "WT");

WTBLAobjidx = idxBLA(RSWTBLAcellsobj);


RSYWT = Y(RSWTBLAcellsobj,:);
figure;
plot(RSYWT(WTBLAobjidx==1,1),RSYWT(WTBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==2,1),RSYWT(WTBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAobjidx==3,1),RSYWT(WTBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==4,1),RSYWT(WTBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAWTVOLOBJZ = ALLBLAVOLOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTVOLOBJZ = RSALLBLAWTVOLOBJZ;
RSnewALLBLAWTVOLOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAWTVOLOBJZ,1)
    RSnewALLBLAWTVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAWTVOLOBJZ(a,:),'movmean',4);
end

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTVOLOBJZSM(find(newWTBLAobjidx==4),:),1)))); xlim([-2 6.95]);hold on;

%%


KOBLAcellssoc = find(groupBLAvolALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAvolALL == "KO");

KOBLAsocidx = idxBLA(RSKOBLAcellssoc);


RSYKO = Y(RSKOBLAcellssoc,:);
figure;
plot(RSYKO(KOBLAsocidx==1,1),RSYKO(KOBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==2,1),RSYKO(KOBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAsocidx==3,1),RSYKO(KOBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==4,1),RSYKO(KOBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAKOVOLSOCZ = ALLBLAVOLSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellssoc);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLSOCZ = RSALLBLAKOVOLSOCZ;
RSnewALLBLAKOVOLSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOVOLSOCZ,1)
    RSnewALLBLAKOVOLSOCZSM(a,:) = smoothdata(RSnewALLBLAKOVOLSOCZ(a,:),'movmean',4);
end

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAVOLSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAVOLSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLSOCZSM(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;



KOBLAcellsobj = find(groupBLAvolALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAvolALL == "KO");

KOBLAobjidx = idxBLA(RSKOBLAcellsobj);


RSYKO = Y(RSKOBLAcellsobj,:);
figure;
plot(RSYKO(KOBLAobjidx==1,1),RSYKO(KOBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==2,1),RSYKO(KOBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAobjidx==3,1),RSYKO(KOBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==4,1),RSYKO(KOBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAKOVOLOBJZ = ALLBLAVOLOBJZ(RSKOBLAcellsobj,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOVOLOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOVOLOBJZ = RSALLBLAKOVOLOBJZ;
RSnewALLBLAKOVOLOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOVOLOBJZ,1)
    RSnewALLBLAKOVOLOBJZSM(a,:) = smoothdata(RSnewALLBLAKOVOLOBJZ(a,:),'movmean',4);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAVOLOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAVOLOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAVOLOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOVOLOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOVOLOBJZ(find(newKOBLAobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;

