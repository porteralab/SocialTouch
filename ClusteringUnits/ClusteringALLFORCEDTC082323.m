%% Create the groups for genotype

badS1WTFORCALL = find(all(isnan(WTS1cellsFORCALLNONSORT),2));

WTS1cellsFORCALLNONSORT(badS1WTFORCALL,:) = [];

badS1KOFORCALL = find(all(isnan(KOS1cellsFORCALLNONSORT),2));

KOS1cellsFORCALLNONSORT(badS1KOFORCALL,:) = [];

%%

allforcsocialS1WTALL(badS1WTFORCALL,:) = [];
allforcsocialS1KOALL(badS1KOFORCALL,:) = [];

allforcsocialS1WTZALL(badS1WTFORCALL,:) = [];
allforcsocialS1KOZALL(badS1KOFORCALL,:) = [];

allforcobjS1WTALL(badS1WTFORCALL,:) = [];
allforcobjS1KOALL(badS1KOFORCALL,:) = [];

allforcobjS1WTZALL(badS1WTFORCALL,:) = [];
allforcobjS1KOZALL(badS1KOFORCALL,:) = [];

%%

allforcsocialS1WTMODInd(badS1WTFORCALL) = [];
allforcsocialS1KOMODInd(badS1KOFORCALL) = [];
allforcobjS1WTMODInd(badS1WTFORCALL) = [];
allforcobjS1KOMODInd(badS1KOFORCALL) = [];

%% edit the other mod indices and AUC values

allforcsocialS1WTMODIndSTIM(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndSTIM(badS1KOFORCALL) = [];

allforcobjS1WTMODIndSTIM(badS1WTFORCALL) = [];
allforcobjS1KOMODIndSTIM(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndSHORTSTIM(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndSHORTSTIM(badS1KOFORCALL) = [];

allforcobjS1WTMODIndSHORTSTIM(badS1WTFORCALL) = [];
allforcobjS1KOMODIndSHORTSTIM(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndPLAT(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndPLAT(badS1KOFORCALL) = [];

allforcobjS1WTMODIndPLAT(badS1WTFORCALL) = [];
allforcobjS1KOMODIndPLAT(badS1KOFORCALL) = [];

allforcS1WTAUCSTIM(badS1WTFORCALL) = [];
allforcS1KOAUCSTIM(badS1KOFORCALL) = [];

allforcS1WTAUCSHORTSTIM(badS1WTFORCALL) = [];
allforcS1KOAUCSHORTSTIM(badS1KOFORCALL) = [];

allforcS1WTAUCPLAT(badS1WTFORCALL) = [];
allforcS1KOAUCPLAT(badS1KOFORCALL) = [];


%% additional mod indices & latency

allforcsocialS1WTMODIndFIRST10(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndFIRST10(badS1KOFORCALL) = [];

allforcobjS1WTMODIndFIRST10(badS1WTFORCALL) = [];
allforcobjS1KOMODIndFIRST10(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndPLATFIRST10(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndPLATFIRST10(badS1KOFORCALL) = [];

allforcobjS1WTMODIndPLATFIRST10(badS1WTFORCALL) = [];
allforcobjS1KOMODIndPLATFIRST10(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndSHORTSTIMFIRST10(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndSHORTSTIMFIRST10(badS1KOFORCALL) = [];

allforcobjS1WTMODIndSHORTSTIMFIRST10(badS1WTFORCALL) = [];
allforcobjS1KOMODIndSHORTSTIMFIRST10(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndFIRST5(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndFIRST5(badS1KOFORCALL) = [];

allforcobjS1WTMODIndFIRST5(badS1WTFORCALL) = [];
allforcobjS1KOMODIndFIRST5(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndPLATFIRST5(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndPLATFIRST5(badS1KOFORCALL) = [];

allforcobjS1WTMODIndPLATFIRST5(badS1WTFORCALL) = [];
allforcobjS1KOMODIndPLATFIRST5(badS1KOFORCALL) = [];

allforcsocialS1WTMODIndSHORTSTIMFIRST5(badS1WTFORCALL) = [];
allforcsocialS1KOMODIndSHORTSTIMFIRST5(badS1KOFORCALL) = [];

allforcobjS1WTMODIndSHORTSTIMFIRST5(badS1WTFORCALL) = [];
allforcobjS1KOMODIndSHORTSTIMFIRST5(badS1KOFORCALL) = [];


allforcsocialS1WTLATENCYONSET(badS1WTFORCALL) = [];
allforcsocialS1KOLATENCYONSET(badS1KOFORCALL) = [];

allforcobjS1WTLATENCYONSET(badS1WTFORCALL) = [];
allforcobjS1KOLATENCYONSET(badS1KOFORCALL) = [];

allforcsocialS1WTLATENCYEND(badS1WTFORCALL) = [];
allforcsocialS1KOLATENCYEND(badS1KOFORCALL) = [];

allforcobjS1WTLATENCYEND(badS1WTFORCALL) = [];
allforcobjS1KOLATENCYEND(badS1KOFORCALL) = [];

%% spont activity
allforcS1WTSPONT(badS1WTFORCALL,:) = [];
allforcS1KOSPONT(badS1KOFORCALL,:) = [];
%% layers

allS1WTunitlayers(badS1WTFORCALL) = [];
allS1KOunitlayers(badS1KOFORCALL) = [];

%%
allforcsocialS1WTTRIALS(badS1WTFORCALL,:) = [];
allforcsocialS1KOTRIALS(badS1KOFORCALL,:) = [];

allforcobjS1WTTRIALS(badS1WTFORCALL,:) = [];
allforcobjS1KOTRIALS(badS1KOFORCALL,:) = [];

%%

allforcsocialS1WTTRIALSSpks(badS1WTFORCALL,:) = [];
allforcsocialS1KOTRIALSSpks(badS1KOFORCALL,:) = [];

allforcobjS1WTTRIALSSpks(badS1WTFORCALL,:) = [];
allforcobjS1KOTRIALSSpks(badS1KOFORCALL,:) = [];

%%

S1mouseIDWT(badS1WTFORCALL) = [];
S1mouseIDKO(badS1KOFORCALL) = [];


%%

groupS1forcALL(1:size(WTS1cellsFORCALLNONSORT,1)) = "WT";
groupS1forcALL(1+size(WTS1cellsFORCALLNONSORT,1):size(WTS1cellsFORCALLNONSORT,1)+size(KOS1cellsFORCALLNONSORT,1)) = "KO";

S1forcALL = [WTS1cellsFORCALLNONSORT;KOS1cellsFORCALLNONSORT];

ALLS1FORCSOCZ = [allforcsocialS1WTZALL;allforcsocialS1KOZALL];

ALLS1FORCSOC = [allforcsocialS1WTALL;allforcsocialS1KOALL];

ALLS1FORCOBJZ = [allforcobjS1WTZALL;allforcobjS1KOZALL];

ALLS1FORCOBJ = [allforcobjS1WTALL;allforcobjS1KOALL];

%%

allforcsocialS1MODInd = [allforcsocialS1WTMODInd, allforcsocialS1KOMODInd];
allforcobjS1MODInd = [allforcobjS1WTMODInd, allforcobjS1KOMODInd];


%% Combine new mod indices and AUC

allforcsocialS1MODIndSTIM = [allforcsocialS1WTMODIndSTIM, allforcsocialS1KOMODIndSTIM];
allforcobjS1MODIndSTIM = [allforcobjS1WTMODIndSTIM, allforcobjS1KOMODIndSTIM];

allforcsocialS1MODIndSHORTSTIM = [allforcsocialS1WTMODIndSHORTSTIM, allforcsocialS1KOMODIndSHORTSTIM];
allforcobjS1MODIndSHORTSTIM = [allforcobjS1WTMODIndSHORTSTIM, allforcobjS1KOMODIndSHORTSTIM];

allforcsocialS1MODIndPLAT = [allforcsocialS1WTMODIndPLAT, allforcsocialS1KOMODIndPLAT];
allforcobjS1MODIndPLAT = [allforcobjS1WTMODIndPLAT, allforcobjS1KOMODIndPLAT];

%%
allforcsocialS1MODIndFIRST10 = [allforcsocialS1WTMODIndFIRST10, allforcsocialS1KOMODIndFIRST10];
allforcobjS1MODIndFIRST10 = [allforcobjS1WTMODIndFIRST10, allforcobjS1KOMODIndFIRST10];

allforcsocialS1MODIndPLATFIRST10 = [allforcsocialS1WTMODIndPLATFIRST10, allforcsocialS1KOMODIndPLATFIRST10];
allforcobjS1MODIndPLATFIRST10 = [allforcobjS1WTMODIndPLATFIRST10, allforcobjS1KOMODIndPLATFIRST10];

allforcsocialS1MODIndSHORTSTIMFIRST10 = [allforcsocialS1WTMODIndSHORTSTIMFIRST10, allforcsocialS1KOMODIndSHORTSTIMFIRST10];
allforcobjS1MODIndSHORTSTIMFIRST10 = [allforcobjS1WTMODIndSHORTSTIMFIRST10, allforcobjS1KOMODIndSHORTSTIMFIRST10];

allforcsocialS1MODIndFIRST5 = [allforcsocialS1WTMODIndFIRST5, allforcsocialS1KOMODIndFIRST5];
allforcobjS1MODIndFIRST5 = [allforcobjS1WTMODIndFIRST5, allforcobjS1KOMODIndFIRST5];

allforcsocialS1MODIndPLATFIRST5 = [allforcsocialS1WTMODIndPLATFIRST5, allforcsocialS1KOMODIndPLATFIRST5];
allforcobjS1MODIndPLATFIRST5 = [allforcobjS1WTMODIndPLATFIRST5, allforcobjS1KOMODIndPLATFIRST5];

allforcsocialS1MODIndSHORTSTIMFIRST5 = [allforcsocialS1WTMODIndSHORTSTIMFIRST5, allforcsocialS1KOMODIndSHORTSTIMFIRST5];
allforcobjS1MODIndSHORTSTIMFIRST5 = [allforcobjS1WTMODIndSHORTSTIMFIRST5, allforcobjS1KOMODIndSHORTSTIMFIRST5];

allforcsocialS1LATENCYONSET = [allforcsocialS1WTLATENCYONSET, allforcsocialS1KOLATENCYONSET];
allforcobjS1LATENCYONSET = [allforcobjS1WTLATENCYONSET, allforcobjS1KOLATENCYONSET];

allforcsocialS1LATENCYEND = [allforcsocialS1WTLATENCYEND, allforcsocialS1KOLATENCYEND];
allforcobjS1LATENCYEND = [allforcobjS1WTLATENCYEND, allforcobjS1KOLATENCYEND];

%%
allforcS1AUCSTIM = [allforcS1WTAUCSTIM, allforcS1KOAUCSTIM];

allforcS1AUCSHORTSTIM = [allforcS1WTAUCSHORTSTIM, allforcS1KOAUCSHORTSTIM];

allforcS1AUCPLAT = [allforcS1WTAUCPLAT, allforcS1KOAUCPLAT];

allforcS1AUCSTIM = [allforcS1WTAUCSTIM, allforcS1KOAUCSTIM];

allforcS1AUCSHORTSTIM = [allforcS1WTAUCSHORTSTIM, allforcS1KOAUCSHORTSTIM];

allforcS1AUCPLAT = [allforcS1WTAUCPLAT, allforcS1KOAUCPLAT];


%%


allforcS1WTTRIALS= [allforcsocialS1WTTRIALS';allforcobjS1WTTRIALS'];
allforcS1KOTRIALS= [allforcsocialS1KOTRIALS';allforcobjS1KOTRIALS'];


allforcS1WTTRIALSSpks= [allforcsocialS1WTTRIALSSpks';allforcobjS1WTTRIALSSpks'];
allforcS1KOTRIALSSpks= [allforcsocialS1KOTRIALSSpks';allforcobjS1KOTRIALSSpks'];



%
%
%

%%

badSTRWTFORCALL = find(all(isnan(WTSTRcellsFORCALLNONSORT),2));

WTSTRcellsFORCALLNONSORT(badSTRWTFORCALL,:) = [];

badSTRKOFORCALL = find(all(isnan(KOSTRcellsFORCALLNONSORT),2));

KOSTRcellsFORCALLNONSORT(badSTRKOFORCALL,:) = [];

%%
allforcsocialSTRWTALL(badSTRWTFORCALL,:) = [];
allforcsocialSTRKOALL(badSTRKOFORCALL,:) = [];

allforcsocialSTRWTZALL(badSTRWTFORCALL,:) = [];
allforcsocialSTRKOZALL(badSTRKOFORCALL,:) = [];

allforcobjSTRWTALL(badSTRWTFORCALL,:) = [];
allforcobjSTRKOALL(badSTRKOFORCALL,:) = [];

allforcobjSTRWTZALL(badSTRWTFORCALL,:) = [];
allforcobjSTRKOZALL(badSTRKOFORCALL,:) = [];

%%
allforcsocialSTRWTMODInd(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODInd(badSTRKOFORCALL) = [];
allforcobjSTRWTMODInd(badSTRWTFORCALL) = [];
allforcobjSTRKOMODInd(badSTRKOFORCALL) = [];

%% edit the other mod indices and AUC values

allforcsocialSTRWTMODIndSTIM(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndSTIM(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndSTIM(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndSTIM(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndSHORTSTIM(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndSHORTSTIM(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndSHORTSTIM(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndSHORTSTIM(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndPLAT(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndPLAT(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndPLAT(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndPLAT(badSTRKOFORCALL) = [];

allforcSTRWTAUCSTIM(badSTRWTFORCALL) = [];
allforcSTRKOAUCSTIM(badSTRKOFORCALL) = [];

allforcSTRWTAUCSHORTSTIM(badSTRWTFORCALL) = [];
allforcSTRKOAUCSHORTSTIM(badSTRKOFORCALL) = [];

allforcSTRWTAUCPLAT(badSTRWTFORCALL) = [];
allforcSTRKOAUCPLAT(badSTRKOFORCALL) = [];

%%

allforcsocialSTRWTMODIndFIRST10(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndFIRST10(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndFIRST10(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndFIRST10(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndPLATFIRST10(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndPLATFIRST10(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndPLATFIRST10(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndPLATFIRST10(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndSHORTSTIMFIRST10(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndSHORTSTIMFIRST10(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndSHORTSTIMFIRST10(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndSHORTSTIMFIRST10(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndFIRST5(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndFIRST5(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndFIRST5(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndFIRST5(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndPLATFIRST5(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndPLATFIRST5(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndPLATFIRST5(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndPLATFIRST5(badSTRKOFORCALL) = [];

allforcsocialSTRWTMODIndSHORTSTIMFIRST5(badSTRWTFORCALL) = [];
allforcsocialSTRKOMODIndSHORTSTIMFIRST5(badSTRKOFORCALL) = [];

allforcobjSTRWTMODIndSHORTSTIMFIRST5(badSTRWTFORCALL) = [];
allforcobjSTRKOMODIndSHORTSTIMFIRST5(badSTRKOFORCALL) = [];


allforcsocialSTRWTLATENCYONSET(badSTRWTFORCALL) = [];
allforcsocialSTRKOLATENCYONSET(badSTRKOFORCALL) = [];

allforcobjSTRWTLATENCYONSET(badSTRWTFORCALL) = [];
allforcobjSTRKOLATENCYONSET(badSTRKOFORCALL) = [];

allforcsocialSTRWTLATENCYEND(badSTRWTFORCALL) = [];
allforcsocialSTRKOLATENCYEND(badSTRKOFORCALL) = [];

allforcobjSTRWTLATENCYEND(badSTRWTFORCALL) = [];
allforcobjSTRKOLATENCYEND(badSTRKOFORCALL) = [];

%% spont activity
allforcSTRWTSPONT(badSTRWTFORCALL,:) = [];
allforcSTRKOSPONT(badSTRKOFORCALL,:) = [];

%%

allforcsocialSTRWTTRIALS(badSTRWTFORCALL,:) = [];
allforcsocialSTRKOTRIALS(badSTRKOFORCALL,:) = [];

allforcobjSTRWTTRIALS(badSTRWTFORCALL,:) = [];
allforcobjSTRKOTRIALS(badSTRKOFORCALL,:) = [];

%%
allforcsocialSTRWTTRIALSSpks(badSTRWTFORCALL,:) = [];
allforcsocialSTRKOTRIALSSpks(badSTRKOFORCALL,:) = [];

allforcobjSTRWTTRIALSSpks(badSTRWTFORCALL,:) = [];
allforcobjSTRKOTRIALSSpks(badSTRKOFORCALL,:) = [];

%%

STRmouseIDWT(badSTRWTFORCALL) = [];
STRmouseIDKO(badSTRKOFORCALL) = [];

%%

groupSTRforcALL(1:size(WTSTRcellsFORCALLNONSORT,1)) = "WT";
groupSTRforcALL(1+size(WTSTRcellsFORCALLNONSORT,1):size(WTSTRcellsFORCALLNONSORT,1)+size(KOSTRcellsFORCALLNONSORT,1)) = "KO";

STRforcALL = [WTSTRcellsFORCALLNONSORT;KOSTRcellsFORCALLNONSORT];

ALLSTRFORCSOCZ = [allforcsocialSTRWTZALL;allforcsocialSTRKOZALL];

ALLSTRFORCSOC = [allforcsocialSTRWTALL;allforcsocialSTRKOALL];

ALLSTRFORCOBJZ = [allforcobjSTRWTZALL;allforcobjSTRKOZALL];

ALLSTRFORCOBJ = [allforcobjSTRWTALL;allforcobjSTRKOALL];

%
%
%

%%

allforcsocialSTRMODInd = [allforcsocialSTRWTMODInd, allforcsocialSTRKOMODInd];
allforcobjSTRMODInd = [allforcobjSTRWTMODInd, allforcobjSTRKOMODInd];

%% Combine new mod indices and AUC

allforcsocialSTRMODIndSTIM = [allforcsocialSTRWTMODIndSTIM, allforcsocialSTRKOMODIndSTIM];
allforcobjSTRMODIndSTIM = [allforcobjSTRWTMODIndSTIM, allforcobjSTRKOMODIndSTIM];

allforcsocialSTRMODIndSHORTSTIM = [allforcsocialSTRWTMODIndSHORTSTIM, allforcsocialSTRKOMODIndSHORTSTIM];
allforcobjSTRMODIndSHORTSTIM = [allforcobjSTRWTMODIndSHORTSTIM, allforcobjSTRKOMODIndSHORTSTIM];

allforcsocialSTRMODIndPLAT = [allforcsocialSTRWTMODIndPLAT, allforcsocialSTRKOMODIndPLAT];
allforcobjSTRMODIndPLAT = [allforcobjSTRWTMODIndPLAT, allforcobjSTRKOMODIndPLAT];

%%
allforcsocialSTRMODIndFIRST10 = [allforcsocialSTRWTMODIndFIRST10, allforcsocialSTRKOMODIndFIRST10];
allforcobjSTRMODIndFIRST10 = [allforcobjSTRWTMODIndFIRST10, allforcobjSTRKOMODIndFIRST10];

allforcsocialSTRMODIndPLATFIRST10 = [allforcsocialSTRWTMODIndPLATFIRST10, allforcsocialSTRKOMODIndPLATFIRST10];
allforcobjSTRMODIndPLATFIRST10 = [allforcobjSTRWTMODIndPLATFIRST10, allforcobjSTRKOMODIndPLATFIRST10];

allforcsocialSTRMODIndSHORTSTIMFIRST10 = [allforcsocialSTRWTMODIndSHORTSTIMFIRST10, allforcsocialSTRKOMODIndSHORTSTIMFIRST10];
allforcobjSTRMODIndSHORTSTIMFIRST10 = [allforcobjSTRWTMODIndSHORTSTIMFIRST10, allforcobjSTRKOMODIndSHORTSTIMFIRST10];

allforcsocialSTRMODIndFIRST5 = [allforcsocialSTRWTMODIndFIRST5, allforcsocialSTRKOMODIndFIRST5];
allforcobjSTRMODIndFIRST5 = [allforcobjSTRWTMODIndFIRST5, allforcobjSTRKOMODIndFIRST5];

allforcsocialSTRMODIndPLATFIRST5 = [allforcsocialSTRWTMODIndPLATFIRST5, allforcsocialSTRKOMODIndPLATFIRST5];
allforcobjSTRMODIndPLATFIRST5 = [allforcobjSTRWTMODIndPLATFIRST5, allforcobjSTRKOMODIndPLATFIRST5];

allforcsocialSTRMODIndSHORTSTIMFIRST5 = [allforcsocialSTRWTMODIndSHORTSTIMFIRST5, allforcsocialSTRKOMODIndSHORTSTIMFIRST5];
allforcobjSTRMODIndSHORTSTIMFIRST5 = [allforcobjSTRWTMODIndSHORTSTIMFIRST5, allforcobjSTRKOMODIndSHORTSTIMFIRST5];

allforcsocialSTRLATENCYONSET = [allforcsocialSTRWTLATENCYONSET, allforcsocialSTRKOLATENCYONSET];
allforcobjSTRLATENCYONSET = [allforcobjSTRWTLATENCYONSET, allforcobjSTRKOLATENCYONSET];

allforcsocialSTRLATENCYEND = [allforcsocialSTRWTLATENCYEND, allforcsocialSTRKOLATENCYEND];
allforcobjSTRLATENCYEND = [allforcobjSTRWTLATENCYEND, allforcobjSTRKOLATENCYEND];

%%
allforcSTRAUCSTIM = [allforcSTRWTAUCSTIM, allforcSTRKOAUCSTIM];

allforcSTRAUCSHORTSTIM = [allforcSTRWTAUCSHORTSTIM, allforcSTRKOAUCSHORTSTIM];

allforcSTRAUCPLAT = [allforcSTRWTAUCPLAT, allforcSTRKOAUCPLAT];


%%

allforcSTRWTTRIALS= [allforcsocialSTRWTTRIALS';allforcobjSTRWTTRIALS'];
allforcSTRKOTRIALS= [allforcsocialSTRKOTRIALS';allforcobjSTRKOTRIALS'];


allforcSTRWTTRIALSSpks= [allforcsocialSTRWTTRIALSSpks';allforcobjSTRWTTRIALSSpks'];
allforcSTRKOTRIALSSpks= [allforcsocialSTRKOTRIALSSpks';allforcobjSTRKOTRIALSSpks'];
%
%
%

%%
badBLAWTFORCALL = find(all(isnan(WTBLAcellsFORCALLNONSORT),2));

WTBLAcellsFORCALLNONSORT(badBLAWTFORCALL,:) = [];

badBLAKOFORCALL = find(all(isnan(KOBLAcellsFORCALLNONSORT),2));

KOBLAcellsFORCALLNONSORT(badBLAKOFORCALL,:) = [];

%%

allforcsocialBLAWTALL(badBLAWTFORCALL,:) = [];
allforcsocialBLAKOALL(badBLAKOFORCALL,:) = [];

allforcsocialBLAWTZALL(badBLAWTFORCALL,:) = [];
allforcsocialBLAKOZALL(badBLAKOFORCALL,:) = [];

allforcobjBLAWTALL(badBLAWTFORCALL,:) = [];
allforcobjBLAKOALL(badBLAKOFORCALL,:) = [];

allforcobjBLAWTZALL(badBLAWTFORCALL,:) = [];
allforcobjBLAKOZALL(badBLAKOFORCALL,:) = [];

%%
allforcsocialBLAWTMODInd(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODInd(badBLAKOFORCALL) = [];
allforcobjBLAWTMODInd(badBLAWTFORCALL) = [];
allforcobjBLAKOMODInd(badBLAKOFORCALL) = [];

%% edit the other mod indices and AUC values

allforcsocialBLAWTMODIndSTIM(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndSTIM(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndSTIM(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndSTIM(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndSHORTSTIM(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndSHORTSTIM(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndSHORTSTIM(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndSHORTSTIM(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndPLAT(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndPLAT(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndPLAT(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndPLAT(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndFIRST10(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndFIRST10(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndFIRST10(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndFIRST10(badBLAKOFORCALL) = [];

allforcBLAWTAUCSTIM(badBLAWTFORCALL) = [];
allforcBLAKOAUCSTIM(badBLAKOFORCALL) = [];

allforcBLAWTAUCSHORTSTIM(badBLAWTFORCALL) = [];
allforcBLAKOAUCSHORTSTIM(badBLAKOFORCALL) = [];

allforcBLAWTAUCPLAT(badBLAWTFORCALL) = [];
allforcBLAKOAUCPLAT(badBLAKOFORCALL) = [];

%%


allforcsocialBLAWTMODIndFIRST10(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndFIRST10(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndFIRST10(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndFIRST10(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndPLATFIRST10(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndPLATFIRST10(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndPLATFIRST10(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndPLATFIRST10(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndSHORTSTIMFIRST10(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndSHORTSTIMFIRST10(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndSHORTSTIMFIRST10(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndSHORTSTIMFIRST10(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndFIRST5(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndFIRST5(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndFIRST5(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndFIRST5(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndPLATFIRST5(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndPLATFIRST5(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndPLATFIRST5(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndPLATFIRST5(badBLAKOFORCALL) = [];

allforcsocialBLAWTMODIndSHORTSTIMFIRST5(badBLAWTFORCALL) = [];
allforcsocialBLAKOMODIndSHORTSTIMFIRST5(badBLAKOFORCALL) = [];

allforcobjBLAWTMODIndSHORTSTIMFIRST5(badBLAWTFORCALL) = [];
allforcobjBLAKOMODIndSHORTSTIMFIRST5(badBLAKOFORCALL) = [];


allforcsocialBLAWTLATENCYONSET(badBLAWTFORCALL) = [];
allforcsocialBLAKOLATENCYONSET(badBLAKOFORCALL) = [];

allforcobjBLAWTLATENCYONSET(badBLAWTFORCALL) = [];
allforcobjBLAKOLATENCYONSET(badBLAKOFORCALL) = [];

allforcsocialBLAWTLATENCYEND(badBLAWTFORCALL) = [];
allforcsocialBLAKOLATENCYEND(badBLAKOFORCALL) = [];

allforcobjBLAWTLATENCYEND(badBLAWTFORCALL) = [];
allforcobjBLAKOLATENCYEND(badBLAKOFORCALL) = [];


%% spont activity
allforcBLAWTSPONT(badBLAWTFORCALL,:) = [];
allforcBLAKOSPONT(badBLAKOFORCALL,:) = [];

%%
allforcsocialBLAWTTRIALS(badBLAWTFORCALL,:) = [];
allforcsocialBLAKOTRIALS(badBLAKOFORCALL,:) = [];

allforcobjBLAWTTRIALS(badBLAWTFORCALL,:) = [];
allforcobjBLAKOTRIALS(badBLAKOFORCALL,:) = [];

%%

allforcsocialBLAWTTRIALSSpks(badBLAWTFORCALL,:) = [];
allforcsocialBLAKOTRIALSSpks(badBLAKOFORCALL,:) = [];

allforcobjBLAWTTRIALSSpks(badBLAWTFORCALL,:) = [];
allforcobjBLAKOTRIALSSpks(badBLAKOFORCALL,:) = [];


%%
BLAmouseIDWT(badBLAWTFORCALL) = [];
BLAmouseIDKO(badBLAKOFORCALL) = [];



%%

groupBLAforcALL(1:size(WTBLAcellsFORCALLNONSORT,1)) = "WT";
groupBLAforcALL(1+size(WTBLAcellsFORCALLNONSORT,1):size(WTBLAcellsFORCALLNONSORT,1)+size(KOBLAcellsFORCALLNONSORT,1)) = "KO";

BLAforcALL = [WTBLAcellsFORCALLNONSORT;KOBLAcellsFORCALLNONSORT];

ALLBLAFORCSOCZ = [allforcsocialBLAWTZALL;allforcsocialBLAKOZALL];

ALLBLAFORCSOC = [allforcsocialBLAWTALL;allforcsocialBLAKOALL];

ALLBLAFORCOBJZ = [allforcobjBLAWTZALL;allforcobjBLAKOZALL];

ALLBLAFORCOBJ = [allforcobjBLAWTALL;allforcobjBLAKOALL];



%%

allforcsocialBLAMODInd = [allforcsocialBLAWTMODInd, allforcsocialBLAKOMODInd];
allforcobjBLAMODInd = [allforcobjBLAWTMODInd, allforcobjBLAKOMODInd];

%% Combine new mod indices and AUC

allforcsocialBLAMODIndSTIM = [allforcsocialBLAWTMODIndSTIM, allforcsocialBLAKOMODIndSTIM];
allforcobjBLAMODIndSTIM = [allforcobjBLAWTMODIndSTIM, allforcobjBLAKOMODIndSTIM];

allforcsocialBLAMODIndSHORTSTIM = [allforcsocialBLAWTMODIndSHORTSTIM, allforcsocialBLAKOMODIndSHORTSTIM];
allforcobjBLAMODIndSHORTSTIM = [allforcobjBLAWTMODIndSHORTSTIM, allforcobjBLAKOMODIndSHORTSTIM];

allforcsocialBLAMODIndPLAT = [allforcsocialBLAWTMODIndPLAT, allforcsocialBLAKOMODIndPLAT];
allforcobjBLAMODIndPLAT = [allforcobjBLAWTMODIndPLAT, allforcobjBLAKOMODIndPLAT];

%%
allforcsocialBLAMODIndFIRST10 = [allforcsocialBLAWTMODIndFIRST10, allforcsocialBLAKOMODIndFIRST10];
allforcobjBLAMODIndFIRST10 = [allforcobjBLAWTMODIndFIRST10, allforcobjBLAKOMODIndFIRST10];

allforcsocialBLAMODIndPLATFIRST10 = [allforcsocialBLAWTMODIndPLATFIRST10, allforcsocialBLAKOMODIndPLATFIRST10];
allforcobjBLAMODIndPLATFIRST10 = [allforcobjBLAWTMODIndPLATFIRST10, allforcobjBLAKOMODIndPLATFIRST10];

allforcsocialBLAMODIndSHORTSTIMFIRST10 = [allforcsocialBLAWTMODIndSHORTSTIMFIRST10, allforcsocialBLAKOMODIndSHORTSTIMFIRST10];
allforcobjBLAMODIndSHORTSTIMFIRST10 = [allforcobjBLAWTMODIndSHORTSTIMFIRST10, allforcobjBLAKOMODIndSHORTSTIMFIRST10];

allforcsocialBLAMODIndFIRST5 = [allforcsocialBLAWTMODIndFIRST5, allforcsocialBLAKOMODIndFIRST5];
allforcobjBLAMODIndFIRST5 = [allforcobjBLAWTMODIndFIRST5, allforcobjBLAKOMODIndFIRST5];

allforcsocialBLAMODIndPLATFIRST5 = [allforcsocialBLAWTMODIndPLATFIRST5, allforcsocialBLAKOMODIndPLATFIRST5];
allforcobjBLAMODIndPLATFIRST5 = [allforcobjBLAWTMODIndPLATFIRST5, allforcobjBLAKOMODIndPLATFIRST5];

allforcsocialBLAMODIndSHORTSTIMFIRST5 = [allforcsocialBLAWTMODIndSHORTSTIMFIRST5, allforcsocialBLAKOMODIndSHORTSTIMFIRST5];
allforcobjBLAMODIndSHORTSTIMFIRST5 = [allforcobjBLAWTMODIndSHORTSTIMFIRST5, allforcobjBLAKOMODIndSHORTSTIMFIRST5];


allforcsocialBLALATENCYONSET = [allforcsocialBLAWTLATENCYONSET, allforcsocialBLAKOLATENCYONSET];
allforcobjBLALATENCYONSET = [allforcobjBLAWTLATENCYONSET, allforcobjBLAKOLATENCYONSET];

allforcsocialBLALATENCYEND = [allforcsocialBLAWTLATENCYEND, allforcsocialBLAKOLATENCYEND];
allforcobjBLALATENCYEND = [allforcobjBLAWTLATENCYEND, allforcobjBLAKOLATENCYEND];


%%
allforcBLAAUCSTIM = [allforcBLAWTAUCSTIM, allforcBLAKOAUCSTIM];

allforcBLAAUCSHORTSTIM = [allforcBLAWTAUCSHORTSTIM, allforcBLAKOAUCSHORTSTIM];

allforcBLAAUCPLAT = [allforcBLAWTAUCPLAT, allforcBLAKOAUCPLAT];

%%

allforcBLAWTTRIALS= [allforcsocialBLAWTTRIALS';allforcobjBLAWTTRIALS'];
allforcBLAKOTRIALS= [allforcsocialBLAKOTRIALS';allforcobjBLAKOTRIALS'];

allforcBLAWTTRIALSSpks= [allforcsocialBLAWTTRIALSSpks';allforcobjBLAWTTRIALSSpks'];
allforcBLAKOTRIALSSpks= [allforcsocialBLAKOTRIALSSpks';allforcobjBLAKOTRIALSSpks'];
%%
%
%
%

%%
load("workingfolderforclusteringhold.mat", "allS1WTwidths", "allSTRWTwidths", "allBLAWTwidths", "allS1KOwidths", "allSTRKOwidths", "allBLAKOwidths");

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

allS1WTsocwidths(badS1WTFORCALL) = [];
allS1WTobjwidths(badS1WTFORCALL) = [];


allSTRWTsocwidths(badSTRWTFORCALL) = [];
allSTRWTobjwidths(badSTRWTFORCALL) = [];

allBLAWTsocwidths(badBLAWTFORCALL) = [];
allBLAWTobjwidths(badBLAWTFORCALL) = [];

allS1KOsocwidths(badS1KOFORCALL) = [];
allS1KOobjwidths(badS1KOFORCALL) = [];


allSTRKOsocwidths(badSTRKOFORCALL) = [];
allSTRKOobjwidths(badSTRKOFORCALL) = [];

allBLAKOsocwidths(badBLAKOFORCALL) = [];
allBLAKOobjwidths(badBLAKOFORCALL) = [];

% newmouseS1WT = mouseS1WT;
% newmouseS1KO = mouseS1KO;
% newmouseS1WT(badS1WTFORCALL) = [];
% newmouseS1KO(badS1KOFORCALL) = [];




%%
allforsocS1widths = [allS1WTsocwidths,allS1KOsocwidths];
allforsocSTRwidths = [allSTRWTsocwidths,allSTRKOsocwidths];
allforsocBLAwidths = [allBLAWTsocwidths,allBLAKOsocwidths];

allforobjS1widths = [allS1WTobjwidths,allS1KOobjwidths];
allforobjSTRwidths = [allSTRWTobjwidths,allSTRKOobjwidths];
allforobjBLAwidths = [allBLAWTobjwidths,allBLAKOobjwidths];

%%
for a = 1:size(S1forcALL,1)
testS1ALL(a,:) = smoothdata(S1forcALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testS1ALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsS1ALL(i,:) = testS1ALL(newindex,:);
end


%%
for a = 1:size(STRforcALL,1)
testSTRALL(a,:) = smoothdata(STRforcALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testSTRALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsSTRALL(i,:) = testSTRALL(newindex,:);
end

%%
for a = 1:size(BLAforcALL,1)
testBLAALL(a,:) = smoothdata(BLAforcALL(a,1:180),'movmean',10);
end



[~,Indexofmax] = max(testBLAALL,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcellsBLAALL(i,:) = testBLAALL(newindex,:);
end


%%

Y = tsne(S1forcALL,'Algorithm','exact','Distance','euclidean');

figure; subplot(1,3,1), gscatter(Y(:,1),Y(:,2),groupS1forcALL',eye(3));

[idxS1,c] = kmeans(Y,5,'MaxIter',10000,'Display','final','Replicates',10);

X = tsne(STRforcALL,'Algorithm','exact','Distance','euclidean');

[idxSTR,c] = kmeans(X,6,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,2), gscatter(X(:,1),X(:,2),groupSTRforcALL',eye(3));

Z = tsne(BLAforcALL,'Algorithm','exact','Distance','euclidean');

[idxBLA,c] = kmeans(Z,4,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,3), gscatter(Z(:,1),Z(:,2),groupBLAforcALL',eye(3));

%%

Y = tsne(testS1ALL,'Algorithm','exact','Distance','euclidean');

figure; subplot(1,3,1), gscatter(Y(:,1),Y(:,2),groupS1forcALL',eye(3));

% [idxS1,c] = kmeans(Y,5,'MaxIter',10000,'Display','final','Replicates',10);

X = tsne(testSTRALL,'Algorithm','exact','Distance','euclidean');

% [idxSTR,c] = kmeans(X,6,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,2), gscatter(X(:,1),X(:,2),groupSTRforcALL',eye(3));

Z = tsne(testBLAALL,'Algorithm','exact','Distance','euclidean');

% [idxBLA,c] = kmeans(Z,4,'MaxIter',10000,'Display','final','Replicates',10);

subplot(1,3,3), gscatter(Z(:,1),Z(:,2),groupBLAforcALL',eye(3));



%%

[coeff,score,latent,tsquared,explained,mu] = pca(testSTRALL);
[idxSTR,c] = kmeans(score(:,1:15),4,'MaxIter',10000,'Display','final','Replicates',10);

% [rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testSTRALL), ...
%     'n_components', 2, 'n_neighbors', 6);
% 
% [idxSTR,c] = kmeans(rep_UMAP(:,1:2),6,'MaxIter',10000,'Display','final','Replicates',10);


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


figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==1),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==2),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==3),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==4),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==5),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==5),:),1))),'lineprops', 'c'); 
shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(idxSTR==6),:)),nanstd(ALLSTRFORCSOCZ(find(idxSTR==6),:))/(sqrt(size(ALLSTRFORCSOCZ(find(idxSTR==6),:),1))),'lineprops', 'm'); 

[badSTRINFr,badSTRINFc] = find(ismember(ALLSTRFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
newALLSTRFORCOBJZ = ALLSTRFORCOBJZ;
newALLSTRFORCOBJZ(badSTRINF, :) = [];
newidxSTR = idxSTR;
newidxSTR(badSTRINF, :) = [];

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==1),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==1),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==2),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==2),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==3),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==3),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==4),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==4),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==5),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==5),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==5),:),1))),'lineprops', 'c'); 
shadedErrorBar(-2:0.05:7,nanmean(newALLSTRFORCOBJZ(find(newidxSTR==6),:)),nanstd(newALLSTRFORCOBJZ(find(newidxSTR==6),:))/(sqrt(size(newALLSTRFORCOBJZ(find(newidxSTR==6),:),1))),'lineprops', 'm'); 



%% S1

[coeff,score,latent,tsquared,explained,mu] = pca(testS1ALL); 
[idxS1,c] = kmeans(score(:,1:15),4,'MaxIter',10000,'Display','final','Replicates',10);


% 
% [rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testS1ALL), ...
%     'n_components', 2, 'n_neighbors', 5);
% 
% [idxS1,c] = kmeans(rep_UMAP(:,1:2),5,'MaxIter',10000,'Display','final','Replicates',10);

% Y = tsne(testS1ALL,'Algorithm','exact','Distance','euclidean');
figure;
subplot(1,2,1);
plot(Y(idxS1==1,1),Y(idxS1==1,2),'m.','MarkerSize',12)
hold on
plot(Y(idxS1==2,1),Y(idxS1==2,2),'r.','MarkerSize',12)
hold on; plot(Y(idxS1==3,1),Y(idxS1==3,2),'b.','MarkerSize',12)
hold on
plot(Y(idxS1==4,1),Y(idxS1==4,2),'c.','MarkerSize',12)
hold on
plot(Y(idxS1==5,1),Y(idxS1==5,2),'g.','MarkerSize',12)
legend("1", "2", "3", "4", "5")
xlim([-58 55])
ylim([-70 70])
subplot(1,2,2);
gscatter(Y(:,1),Y(:,2), groupS1forcALL',[],[], 12);
legend("WT", "Fmr1KO")
xlim([-58 55])
ylim([-70 70])

% hold on
% plot(Y(idxS1==6,1),Y(idxS1==6,2),'m.','MarkerSize',12)
% hold on
% plot(Y(idxS1==7,1),Y(idxS1==7,2),'m.','MarkerSize',12)



[badS1INFr,badS1INFc] = find(ismember(ALLS1FORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1FORCSOCZ = ALLS1FORCSOCZ;
newALLS1FORCSOCZ(badS1INF, :) = [];
newidx = idxS1;
newidx(badS1INF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==1),:)),nanstd(ALLS1FORCSOCZ(find(idx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==2),:)),nanstd(ALLS1FORCSOCZ(find(idx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==3),:)),nanstd(ALLS1FORCSOCZ(find(idx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==4),:)),nanstd(ALLS1FORCSOCZ(find(idx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==5),:)),nanstd(ALLS1FORCSOCZ(find(idx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==1),:)),nanstd(newALLS1FORCSOCZ(find(newidx==1),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==2),:)),nanstd(newALLS1FORCSOCZ(find(newidx==2),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==3),:)),nanstd(newALLS1FORCSOCZ(find(newidx==3),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==4),:)),nanstd(newALLS1FORCSOCZ(find(newidx==4),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==5),:)),nanstd(newALLS1FORCSOCZ(find(newidx==5),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==6),:)),nanstd(newALLS1FORCSOCZ(find(newidx==6),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==6),:),1))),'lineprops', 'm'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCSOCZ(find(newidx==7),:)),nanstd(newALLS1FORCSOCZ(find(newidx==7),:))/(sqrt(size(newALLS1FORCSOCZ(find(newidx==7),:),1))),'lineprops', 'y'); hold on;

[badS1INFr,badS1INFc] = find(ismember(ALLS1FORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
newALLS1FORCOBJZ = ALLS1FORCOBJZ;
newALLS1FORCOBJZ(badS1INF, :) = [];
newidx = idxS1;
newidx(badS1INF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==1),:)),nanstd(ALLS1FORCOBJZ(find(idx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==2),:)),nanstd(ALLS1FORCOBJZ(find(idx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==3),:)),nanstd(ALLS1FORCOBJZ(find(idx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==4),:)),nanstd(ALLS1FORCOBJZ(find(idx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==5),:)),nanstd(ALLS1FORCOBJZ(find(idx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==1),:)),nanstd(newALLS1FORCOBJZ(find(newidx==1),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==2),:)),nanstd(newALLS1FORCOBJZ(find(newidx==2),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==3),:)),nanstd(newALLS1FORCOBJZ(find(newidx==3),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==4),:)),nanstd(newALLS1FORCOBJZ(find(newidx==4),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==5),:)),nanstd(newALLS1FORCOBJZ(find(newidx==5),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==5),:),1))),'lineprops', 'c'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==6),:)),nanstd(newALLS1FORCOBJZ(find(newidx==6),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==6),:),1))),'lineprops', 'm'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(newALLS1FORCOBJZ(find(newidx==7),:)),nanstd(newALLS1FORCOBJZ(find(newidx==7),:))/(sqrt(size(newALLS1FORCOBJZ(find(newidx==7),:),1))),'lineprops', 'y');
 ylim([-2 18])
%% BLA

[coeff,score,latent,tsquared,explained,mu] = pca(testBLAALL);
[idxBLA,c] = kmeans(score(:,1:19),4,'MaxIter',10000,'Display','final','Replicates',10);

[rep_UMAP, umap, clusterIdentifiers, extras]=run_umap(double(testBLAALL), ...
    'n_components', 2, 'n_neighbors', 6);

[idxBLA,c] = kmeans(rep_UMAP(:,1:2),4,'MaxIter',10000,'Display','final','Replicates',10);



figure;
plot(Z(idxBLA==1,1),Z(idxBLA==1,2),'m.','MarkerSize',12)
hold on
plot(Z(idxBLA==2,1),Z(idxBLA==2,2),'r.','MarkerSize',12)
hold on; plot(Z(idxBLA==3,1),Z(idxBLA==3,2),'b.','MarkerSize',12)
hold on
plot(Z(idxBLA==4,1),Z(idxBLA==4,2),'g.','MarkerSize',12)
% hold on
% plot(Z(idxBLA==5,1),Z(idxBLA==5,2),'c.','MarkerSize',12)

figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(idxBLA==1),:)),nanstd(ALLBLAFORCSOCZ(find(idxBLA==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(idxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(idxBLA==2),:)),nanstd(ALLBLAFORCSOCZ(find(idxBLA==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(idxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(idxBLA==3),:)),nanstd(ALLBLAFORCSOCZ(find(idxBLA==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(idxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(idxBLA==4),:)),nanstd(ALLBLAFORCSOCZ(find(idxBLA==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(idxBLA==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(idxBLA==5),:)),nanstd(ALLBLAFORCSOCZ(find(idxBLA==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(idxBLA==5),:),1))),'lineprops', 'c');



figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(idxBLA==1),:)),nanstd(ALLBLAFORCOBJZ(find(idxBLA==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(idxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(idxBLA==2),:)),nanstd(ALLBLAFORCOBJZ(find(idxBLA==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(idxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(idxBLA==3),:)),nanstd(ALLBLAFORCOBJZ(find(idxBLA==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(idxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(idxBLA==4),:)),nanstd(ALLBLAFORCOBJZ(find(idxBLA==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(idxBLA==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(idxBLA==5),:)),nanstd(ALLBLAFORCOBJZ(find(idxBLA==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(idxBLA==5),:),1))),'lineprops', 'c');


%%


%
%
%
%
%
%
% HERE WE WILL SEPARATE BY REGULAR SPIKING

%%
RSX = X(find(allforsocSTRwidths>550 & allforsocSTRwidths<1250),:);
RSidxSTR = idxSTR(allforsocSTRwidths>550 & allforsocSTRwidths<1250);
figure;subplot(4,1,1);
plot(RSX(RSidxSTR==1,1),RSX(RSidxSTR==1,2),'k.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==2,1),RSX(RSidxSTR==2,2),'r.','MarkerSize',12)
hold on; plot(RSX(RSidxSTR==3,1),RSX(RSidxSTR==3,2),'b.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==4,1),RSX(RSidxSTR==4,2),'c.','MarkerSize',12)
hold on
plot(RSX(RSidxSTR==5,1),RSX(RSidxSTR==5,2),'g.','MarkerSize',12)




RSALLSTRFORCSOCZ = ALLSTRFORCSOCZ(find(allforsocSTRwidths>550 & allforsocSTRwidths<1250),:);
RSALLSTRFORCOBJZ = ALLSTRFORCOBJZ(find(allforsocSTRwidths>550 & allforsocSTRwidths<1250),:);
subplot(4,1,2); gscatter(RSX(:,1),RSX(:,2));

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRFORCOBJZ,Inf)|isnan(RSALLSTRFORCOBJZ));
badSTRINF1 = unique(badSTRINFr);
[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRFORCSOCZ,Inf)|isnan(RSALLSTRFORCSOCZ));
badSTRINF2 = unique(badSTRINFr);
badSTRINF = union(badSTRINF1, badSTRINF2);
newRSALLSTRFORCOBJZ = RSALLSTRFORCOBJZ;
newRSALLSTRFORCOBJZ(badSTRINF, :) = [];
newRSidxSTR = RSidxSTR;
newRSidxSTR(badSTRINF, :) = [];


subplot(4,1,3); shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRFORCSOCZ(find(RSidxSTR==1),:)),nanstd(RSALLSTRFORCSOCZ(find(RSidxSTR==1),:))/(sqrt(size(RSALLSTRFORCSOCZ(find(RSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRFORCSOCZ(find(RSidxSTR==2),:)),nanstd(RSALLSTRFORCSOCZ(find(RSidxSTR==2),:))/(sqrt(size(RSALLSTRFORCSOCZ(find(RSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRFORCSOCZ(find(RSidxSTR==3),:)),nanstd(RSALLSTRFORCSOCZ(find(RSidxSTR==3),:))/(sqrt(size(RSALLSTRFORCSOCZ(find(RSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRFORCSOCZ(find(RSidxSTR==4),:)),nanstd(RSALLSTRFORCSOCZ(find(RSidxSTR==4),:))/(sqrt(size(RSALLSTRFORCSOCZ(find(RSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLSTRFORCSOCZ(find(RSidxSTR==5),:)),nanstd(RSALLSTRFORCSOCZ(find(RSidxSTR==5),:))/(sqrt(size(RSALLSTRFORCSOCZ(find(RSidxSTR==5),:),1))),'lineprops', 'c'); 



subplot(4,1,4); shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRFORCOBJZ(find(newRSidxSTR==1),:)),nanstd(newRSALLSTRFORCOBJZ(find(newRSidxSTR==1),:))/(sqrt(size(newRSALLSTRFORCOBJZ(find(newRSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRFORCOBJZ(find(newRSidxSTR==2),:)),nanstd(newRSALLSTRFORCOBJZ(find(newRSidxSTR==2),:))/(sqrt(size(newRSALLSTRFORCOBJZ(find(newRSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRFORCOBJZ(find(newRSidxSTR==3),:)),nanstd(newRSALLSTRFORCOBJZ(find(newRSidxSTR==3),:))/(sqrt(size(newRSALLSTRFORCOBJZ(find(newRSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRFORCOBJZ(find(newRSidxSTR==4),:)),nanstd(newRSALLSTRFORCOBJZ(find(newRSidxSTR==4),:))/(sqrt(size(newRSALLSTRFORCOBJZ(find(newRSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(newRSALLSTRFORCOBJZ(find(newRSidxSTR==5),:)),nanstd(newRSALLSTRFORCOBJZ(find(newRSidxSTR==5),:))/(sqrt(size(newRSALLSTRFORCOBJZ(find(newRSidxSTR==5),:),1))),'lineprops', 'c'); 



%% S1
RSY = Y(find(allforsocS1widths>= 400),:);
%[idx,c] = kmeans(RSY,5);

RSidxS1 = idxS1(find(allforsocS1widths>= 400));
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



RSALLS1FORCSOCZ = ALLS1FORCSOCZ(find(allforsocS1widths>=400),:);
RSALLS1FORCOBJZ = ALLS1FORCOBJZ(find(allforsocS1widths>=400),:);

% mouseS1 = [newmouseS1WT, newmouseS1KO];
% RSmouseS1 = mouseS1(find(allforsocS1widths>=400));


[badS1INFr,badS1INFc] = find(ismember(RSALLS1FORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1FORCSOCZ = RSALLS1FORCSOCZ;
RSnewALLS1FORCSOCZ(badS1INF, :) = [];
newidx = RSidxS1;
newidx(badS1INF, :) = [];
% newRSmouseS1 = RSmouseS1;
% newRSmouseS1(badS1INF) = [];

% subplot(3,1,2); gscatter(RSY(:,1),RSY(:,2));
% figure; gscatter(RSY(:,1),RSY(:,2), RSmouseS1');

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==1),:)),nanstd(ALLS1FORCSOCZ(find(idx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==2),:)),nanstd(ALLS1FORCSOCZ(find(idx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==3),:)),nanstd(ALLS1FORCSOCZ(find(idx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==4),:)),nanstd(ALLS1FORCSOCZ(find(idx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==5),:)),nanstd(ALLS1FORCSOCZ(find(idx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCSOCZ(find(newidx==1),:)),nanstd(RSnewALLS1FORCSOCZ(find(newidx==1),:))/(sqrt(size(RSnewALLS1FORCSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCSOCZ(find(newidx==2),:)),nanstd(RSnewALLS1FORCSOCZ(find(newidx==2),:))/(sqrt(size(RSnewALLS1FORCSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCSOCZ(find(newidx==3),:)),nanstd(RSnewALLS1FORCSOCZ(find(newidx==3),:))/(sqrt(size(RSnewALLS1FORCSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCSOCZ(find(newidx==4),:)),nanstd(RSnewALLS1FORCSOCZ(find(newidx==4),:))/(sqrt(size(RSnewALLS1FORCSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCSOCZ(find(newidx==5),:)),nanstd(RSnewALLS1FORCSOCZ(find(newidx==5),:))/(sqrt(size(RSnewALLS1FORCSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); 

[badS1INFr,badS1INFc] = find(ismember(RSALLS1FORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1FORCOBJZ = RSALLS1FORCOBJZ;
RSnewALLS1FORCOBJZ(badS1INF, :) = [];
newidx = RSidxS1;
newidx(badS1INF, :) = [];
% newRSmouseS1 = RSmouseS1;
% newRSmouseS1(badS1INF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==1),:)),nanstd(ALLS1FORCOBJZ(find(idx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==2),:)),nanstd(ALLS1FORCOBJZ(find(idx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==3),:)),nanstd(ALLS1FORCOBJZ(find(idx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==4),:)),nanstd(ALLS1FORCOBJZ(find(idx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(idx==5),:)),nanstd(ALLS1FORCOBJZ(find(idx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCOBJZ(find(newidx==1),:)),nanstd(RSnewALLS1FORCOBJZ(find(newidx==1),:))/(sqrt(size(RSnewALLS1FORCOBJZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCOBJZ(find(newidx==2),:)),nanstd(RSnewALLS1FORCOBJZ(find(newidx==2),:))/(sqrt(size(RSnewALLS1FORCOBJZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCOBJZ(find(newidx==3),:)),nanstd(RSnewALLS1FORCOBJZ(find(newidx==3),:))/(sqrt(size(RSnewALLS1FORCOBJZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCOBJZ(find(newidx==4),:)),nanstd(RSnewALLS1FORCOBJZ(find(newidx==4),:))/(sqrt(size(RSnewALLS1FORCOBJZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1FORCOBJZ(find(newidx==5),:)),nanstd(RSnewALLS1FORCOBJZ(find(newidx==5),:))/(sqrt(size(RSnewALLS1FORCOBJZ(find(newidx==5),:),1))),'lineprops', 'c'); 


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


RSALLBLAFORCSOCZ = ALLBLAFORCSOCZ;
RSALLBLAFORCOBJZ = ALLBLAFORCOBJZ;

subplot(4,1,2); gscatter(RSZ(:,1),RSZ(:,2));


subplot(4,1,3); shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCSOCZ(find(RSidxBLA==1),:)),nanstd(RSALLBLAFORCSOCZ(find(RSidxBLA==1),:))/(sqrt(size(RSALLBLAFORCSOCZ(find(RSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCSOCZ(find(RSidxBLA==2),:)),nanstd(RSALLBLAFORCSOCZ(find(RSidxBLA==2),:))/(sqrt(size(RSALLBLAFORCSOCZ(find(RSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCSOCZ(find(RSidxBLA==3),:)),nanstd(RSALLBLAFORCSOCZ(find(RSidxBLA==3),:))/(sqrt(size(RSALLBLAFORCSOCZ(find(RSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCSOCZ(find(RSidxBLA==4),:)),nanstd(RSALLBLAFORCSOCZ(find(RSidxBLA==4),:))/(sqrt(size(RSALLBLAFORCSOCZ(find(RSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCSOCZ(find(RSidxBLA==5),:)),nanstd(RSALLBLAFORCSOCZ(find(RSidxBLA==5),:))/(sqrt(size(RSALLBLAFORCSOCZ(find(RSidxBLA==5),:),1))),'lineprops', 'g'); hold on;


subplot(4,1,4); shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCOBJZ(find(RSidxBLA==1),:)),nanstd(RSALLBLAFORCOBJZ(find(RSidxBLA==1),:))/(sqrt(size(RSALLBLAFORCOBJZ(find(RSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCOBJZ(find(RSidxBLA==2),:)),nanstd(RSALLBLAFORCOBJZ(find(RSidxBLA==2),:))/(sqrt(size(RSALLBLAFORCOBJZ(find(RSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCOBJZ(find(RSidxBLA==3),:)),nanstd(RSALLBLAFORCOBJZ(find(RSidxBLA==3),:))/(sqrt(size(RSALLBLAFORCOBJZ(find(RSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCOBJZ(find(RSidxBLA==4),:)),nanstd(RSALLBLAFORCOBJZ(find(RSidxBLA==4),:))/(sqrt(size(RSALLBLAFORCOBJZ(find(RSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(RSALLBLAFORCOBJZ(find(RSidxBLA==5),:)),nanstd(RSALLBLAFORCOBJZ(find(RSidxBLA==5),:))/(sqrt(size(RSALLBLAFORCOBJZ(find(RSidxBLA==5),:),1))),'lineprops', 'g'); hold on;

%%
%
%
%
%
%% ISOLATE BY GENOTYPE


RSS1cellssoc = find(allforsocS1widths>= 400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allforsocS1widths>= 400 & groupS1forcALL == "WT");

WTS1socidx = idxS1WT(RSWTS1cellssoc);

RSS1mouseIDWT = S1mouseIDWT(RSWTS1cellssoc);



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

RSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(RSWTS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellssoc);
WTRSS1socialMODInd = allforcsocialS1MODInd(RSWTS1cellssoc);
WTRSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(RSWTS1cellssoc);
WTRSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(RSWTS1cellssoc);
WTRSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(RSWTS1cellssoc);
% WTRSS1socialMODIndFIRST10 = allforcsocialS1MODIndFIRST10(RSWTS1cellssoc);
% WTRSS1socialMODIndPLATFIRST10 = allforcsocialS1MODIndPLATFIRST10(RSWTS1cellssoc);
% WTRSS1socialMODIndSHORTSTIMFIRST10 = allforcsocialS1MODIndSHORTSTIMFIRST10(RSWTS1cellssoc);

WTRSS1socialMODIndFIRST5 = allforcsocialS1MODIndFIRST5(RSWTS1cellssoc);
WTRSS1socialMODIndPLATFIRST5 = allforcsocialS1MODIndPLATFIRST5(RSWTS1cellssoc);
WTRSS1socialMODIndSHORTSTIMFIRST5 = allforcsocialS1MODIndSHORTSTIMFIRST5(RSWTS1cellssoc);

% WTRSS1socialLATENCYONSET = allforcsocialS1LATENCYONSET(RSWTS1cellssoc);
% WTRSS1socialLATENCYEND = allforcsocialS1LATENCYEND(RSWTS1cellssoc);


WTRSS1forcAUCSTIM = allforcS1AUCSTIM(RSWTS1cellssoc);
WTRSS1forcAUCSHORTSTIM = allforcS1AUCSHORTSTIM(RSWTS1cellssoc);
WTRSS1forcAUCPLAT = allforcS1AUCPLAT(RSWTS1cellssoc);
% 
[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
% [badS1INFr,badS1INFc] = find(isnan(RSALLS1WTFORCSOCZ));
% badS1INF = [badS1INF, unique(badS1INFr)];
% badS1INF = unique(badS1INF);
badS1INF = [];
RSnewALLS1WTFORCSOCZ = RSALLS1WTFORCSOCZ;
RSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
newmouseS1RSWTnoinf = RSS1mouseIDWT;
newmouseS1RSWTnoinf(badS1INF) = [];

newWTRSS1socialMODIndNEW = WTRSS1socialMODInd;
newWTRSS1socialMODIndNEW(badS1INF) = [];

newWTRSS1socialMODIndSTIMNEW = WTRSS1socialMODIndSTIM;
newWTRSS1socialMODIndSTIMNEW(badS1INF) = [];

newWTRSS1socialMODIndSHORTSTIMNEW = WTRSS1socialMODIndSHORTSTIM;
newWTRSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newWTRSS1socialMODIndPLATNEW = WTRSS1socialMODIndPLAT;
newWTRSS1socialMODIndPLATNEW(badS1INF) = [];

% newWTRSS1socialMODIndFIRST10NEW = WTRSS1socialMODIndFIRST10;
% newWTRSS1socialMODIndFIRST10NEW(badS1INF) = [];
% 
% newWTRSS1socialMODIndPLATFIRST10NEW = WTRSS1socialMODIndPLATFIRST10;
% newWTRSS1socialMODIndPLATFIRST10NEW(badS1INF) = [];
% 
% newWTRSS1socialMODIndSHORTSTIMFIRST10NEW = WTRSS1socialMODIndSHORTSTIMFIRST10;
% newWTRSS1socialMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];

newWTRSS1socialMODIndFIRST5NEW = WTRSS1socialMODIndFIRST5;
newWTRSS1socialMODIndFIRST5NEW(badS1INF) = [];

newWTRSS1socialMODIndPLATFIRST5NEW = WTRSS1socialMODIndPLATFIRST5;
newWTRSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newWTRSS1socialMODIndSHORTSTIMFIRST5NEW = WTRSS1socialMODIndSHORTSTIMFIRST5;
newWTRSS1socialMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];

% newWTRSS1socialLATENCYONSETNEW = WTRSS1socialLATENCYONSET;
% newWTRSS1socialLATENCYONSETNEW(badS1INF) = [];
% 
% newWTRSS1socialLATENCYENDNEW = WTRSS1socialLATENCYEND;
% newWTRSS1socialLATENCYENDNEW(badS1INF) = [];


newWTRSS1forcAUCSTIMNEW = WTRSS1forcAUCSTIM;
newWTRSS1forcAUCSTIMNEW(badS1INF) = [];

newWTRSS1forcAUCSHORTSTIMNEW = WTRSS1forcAUCSHORTSTIM;
newWTRSS1forcAUCSHORTSTIMNEW(badS1INF) = [];

newWTRSS1forcAUCPLATNEW = WTRSS1forcAUCPLAT;
newWTRSS1forcAUCPLATNEW(badS1INF) = [];

RSallforcS1WTSPONT = allforcS1WTSPONT(RSWTS1cellssoc,:);
RSallforcS1WTSPONT(badS1INF,:) = [];

RSS1mouseIDWT(badS1INF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);

%%
RSS1cellsobj = find(allforobjS1widths>= 400);

WTS1cellsobj = find(groupS1forcALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allforobjS1widths>= 400 & groupS1forcALL == "WT");

WTS1objidx = idxS1WT(RSWTS1cellsobj);

WTRSobjMODInd = allforcobjS1MODInd(RSWTS1cellsobj);




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

RSALLS1WTFORCOBJZ = ALLS1FORCOBJZ(RSWTS1cellsobj,:);

% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellsobj);
WTRSS1objMODInd = allforcobjS1MODInd(RSWTS1cellsobj);
WTRSS1objMODIndSTIM = allforcobjS1MODIndSTIM(RSWTS1cellsobj);
WTRSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(RSWTS1cellsobj);
WTRSS1objMODIndPLAT = allforcobjS1MODIndPLAT(RSWTS1cellsobj);
% WTRSS1objMODIndFIRST10 = allforcobjS1MODIndFIRST10(RSWTS1cellsobj);
% WTRSS1objMODIndPLATFIRST10 = allforcobjS1MODIndPLATFIRST10(RSWTS1cellsobj);
% WTRSS1objMODIndSHORTSTIMFIRST10 = allforcobjS1MODIndSHORTSTIMFIRST10(RSWTS1cellsobj);

WTRSS1objMODIndFIRST5 = allforcobjS1MODIndFIRST5(RSWTS1cellsobj);
WTRSS1objMODIndPLATFIRST5 = allforcobjS1MODIndPLATFIRST5(RSWTS1cellsobj);
WTRSS1objMODIndSHORTSTIMFIRST5 = allforcobjS1MODIndSHORTSTIMFIRST5(RSWTS1cellsobj);
% 
% WTRSS1objLATENCYONSET = allforcobjS1LATENCYONSET(RSWTS1cellsobj);
% WTRSS1objLATENCYEND = allforcobjS1LATENCYEND(RSWTS1cellsobj);


% [badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCOBJZ,Inf));
% badS1INF = unique(badS1INFr);
% [badS1INFr,badS1INFc] = find(isnan(RSALLS1WTFORCOBJZ));
% badS1INF = unique(badS1INFr)
RSnewALLS1WTFORCOBJZ = RSALLS1WTFORCOBJZ;
RSnewALLS1WTFORCOBJZ(badS1INF, :) = [];
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

newWTRSS1objMODIndFIRST5NEW = WTRSS1objMODIndFIRST5;
newWTRSS1objMODIndFIRST5NEW(badS1INF) = [];

newWTRSS1objMODIndPLATFIRST5NEW = WTRSS1objMODIndPLATFIRST5;
newWTRSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newWTRSS1objMODIndSHORTSTIMFIRST5NEW = WTRSS1objMODIndSHORTSTIMFIRST5;
newWTRSS1objMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];

% 
% newWTRSS1objMODIndFIRST10NEW = WTRSS1objMODIndFIRST10;
% newWTRSS1objMODIndFIRST10NEW(badS1INF) = [];
% 
% newWTRSS1objMODIndPLATFIRST10NEW = WTRSS1objMODIndPLATFIRST10;
% newWTRSS1objMODIndPLATFIRST10NEW(badS1INF) = [];
% 
% newWTRSS1objMODIndSHORTSTIMFIRST10NEW = WTRSS1objMODIndSHORTSTIMFIRST10;
% newWTRSS1objMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];
% 
% newWTRSS1objLATENCYONSETNEW = WTRSS1objLATENCYONSET;
% newWTRSS1objLATENCYONSETNEW(badS1INF) = [];
% 
% newWTRSS1objLATENCYENDNEW = WTRSS1objLATENCYEND;
% newWTRSS1objLATENCYENDNEW(badS1INF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

RSS1cellssoc = find(allforsocS1widths>= 400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allforsocS1widths>= 400 & groupS1forcALL == "KO");

KOS1socidx = idxS1KO(RSKOS1cellssoc-525);

RSS1mouseIDKO = S1mouseIDKO(RSKOS1cellssoc-525);



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

RSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(RSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellssoc);

KORSS1socialMODInd = allforcsocialS1MODInd(RSKOS1cellssoc);

KORSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(RSKOS1cellssoc);
KORSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(RSKOS1cellssoc);
KORSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(RSKOS1cellssoc);

KORSS1forcAUCSTIM = allforcS1AUCSTIM(RSKOS1cellssoc);
KORSS1forcAUCSHORTSTIM = allforcS1AUCSHORTSTIM(RSKOS1cellssoc);
KORSS1forcAUCPLAT = allforcS1AUCPLAT(RSKOS1cellssoc);

% KORSS1socialMODIndFIRST10 = allforcsocialS1MODIndFIRST10(RSKOS1cellssoc);
% KORSS1socialMODIndPLATFIRST10 = allforcsocialS1MODIndPLATFIRST10(RSKOS1cellssoc);
% KORSS1socialMODIndSHORTSTIMFIRST10 = allforcsocialS1MODIndSHORTSTIMFIRST10(RSKOS1cellssoc);
% 
% KORSS1socialLATENCYONSET = allforcsocialS1LATENCYONSET(RSKOS1cellssoc);
% KORSS1socialLATENCYEND = allforcsocialS1LATENCYEND(RSKOS1cellssoc);

KORSS1socialMODIndFIRST5 = allforcsocialS1MODIndFIRST5(RSKOS1cellssoc);
KORSS1socialMODIndPLATFIRST5 = allforcsocialS1MODIndPLATFIRST5(RSKOS1cellssoc);
KORSS1socialMODIndSHORTSTIMFIRST5 = allforcsocialS1MODIndSHORTSTIMFIRST5(RSKOS1cellssoc);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(RSALLS1KOFORCSOCZ));
badS1INF = unique(badS1INFr);
% [badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCSOCZ,Inf));
% badS1INF = [badS1INF; unique(badS1INFr)];
RSnewALLS1KOFORCSOCZ = RSALLS1KOFORCSOCZ;
RSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
newmouseS1RSKOnoinf = RSS1mouseIDKO;
newmouseS1RSKOnoinf(badS1INF) = [];

newKORSS1socialMODIndNEW = KORSS1socialMODInd;
newKORSS1socialMODIndNEW(badS1INF) = [];

newKORSS1socialMODIndSTIMNEW = KORSS1socialMODIndSTIM;
newKORSS1socialMODIndSTIMNEW(badS1INF) = [];

newKORSS1socialMODIndSHORTSTIMNEW = KORSS1socialMODIndSHORTSTIM;
newKORSS1socialMODIndSHORTSTIMNEW(badS1INF) = [];

newKORSS1socialMODIndPLATNEW = KORSS1socialMODIndPLAT;
newKORSS1socialMODIndPLATNEW(badS1INF) = [];

newKORSS1forcAUCSTIMNEW = KORSS1forcAUCSTIM;
newKORSS1forcAUCSTIMNEW(badS1INF) = [];

newKORSS1forcAUCSHORTSTIMNEW = KORSS1forcAUCSHORTSTIM;
newKORSS1forcAUCSHORTSTIMNEW(badS1INF) = [];

newKORSS1forcAUCPLATNEW = KORSS1forcAUCPLAT;
newKORSS1forcAUCPLATNEW(badS1INF) = [];

% newKORSS1socialMODIndFIRST10NEW = KORSS1socialMODIndFIRST10;
% newKORSS1socialMODIndFIRST10NEW(badS1INF) = [];
% 
% newKORSS1socialMODIndPLATFIRST10NEW = KORSS1socialMODIndPLATFIRST10;
% newKORSS1socialMODIndPLATFIRST10NEW(badS1INF) = [];
% 
% newKORSS1socialMODIndSHORTSTIMFIRST10NEW = KORSS1socialMODIndSHORTSTIMFIRST10;
% newKORSS1socialMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];
% 
% newKORSS1socialLATENCYONSETNEW = KORSS1socialLATENCYONSET;
% newKORSS1socialLATENCYONSETNEW(badS1INF) = [];
% 
% newKORSS1socialLATENCYENDNEW = KORSS1socialLATENCYEND;
% newKORSS1socialLATENCYENDNEW(badS1INF) = [];

newKORSS1socialMODIndFIRST5NEW = KORSS1socialMODIndFIRST5;
newKORSS1socialMODIndFIRST5NEW(badS1INF) = [];

newKORSS1socialMODIndPLATFIRST5NEW = KORSS1socialMODIndPLATFIRST5;
newKORSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newKORSS1socialMODIndSHORTSTIMFIRST5NEW = KORSS1socialMODIndSHORTSTIMFIRST5;
newKORSS1socialMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%
RSS1cellsobj = find(allforobjS1widths>= 400);

KOS1cellsobj = find(groupS1forcALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allforobjS1widths>= 400 & groupS1forcALL == "KO");

KOS1objidx = idxS1KO(RSKOS1cellsobj-525);


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

RSALLS1KOFORCOBJZ = ALLS1FORCOBJZ(RSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellsobj);

KORSS1objMODInd = allforcobjS1MODInd(RSKOS1cellsobj);
KORSS1objMODIndSTIM = allforcobjS1MODIndSTIM(RSKOS1cellsobj);
KORSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(RSKOS1cellsobj);
KORSS1objMODIndPLAT = allforcobjS1MODIndPLAT(RSKOS1cellsobj);

% KORSS1objMODIndFIRST10 = allforcobjS1MODIndFIRST10(RSKOS1cellsobj);
% KORSS1objMODIndPLATFIRST10 = allforcobjS1MODIndPLATFIRST10(RSKOS1cellsobj);
% KORSS1objMODIndSHORTSTIMFIRST10 = allforcobjS1MODIndSHORTSTIMFIRST10(RSKOS1cellsobj);
% 
% KORSS1objLATENCYONSET = allforcobjS1LATENCYONSET(RSKOS1cellsobj);
% KORSS1objLATENCYEND = allforcobjS1LATENCYEND(RSKOS1cellsobj);

KORSS1objMODIndFIRST5 = allforcobjS1MODIndFIRST5(RSKOS1cellsobj);
KORSS1objMODIndPLATFIRST5 = allforcobjS1MODIndPLATFIRST5(RSKOS1cellsobj);
KORSS1objMODIndSHORTSTIMFIRST5 = allforcobjS1MODIndSHORTSTIMFIRST5(RSKOS1cellsobj);

% [badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCOBJZ,Inf));
% % [badS1INFr,badS1INFc] = find(isnan(RSALLS1KOFORCOBJZ));
% badS1INF = unique(badS1INFr);
[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCOBJZ,Inf));
badS1INF = [badS1INF, unique(badS1INFr)];
RSnewALLS1KOFORCOBJZ = RSALLS1KOFORCOBJZ;
RSnewALLS1KOFORCOBJZ(badS1INF, :) = [];
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

% newKORSS1objMODIndFIRST10NEW = KORSS1objMODIndFIRST10;
% newKORSS1objMODIndFIRST10NEW(badS1INF) = [];
% 
% newKORSS1objMODIndPLATFIRST10NEW = KORSS1objMODIndPLATFIRST10;
% newKORSS1objMODIndPLATFIRST10NEW(badS1INF) = [];
% 
% newKORSS1objMODIndSHORTSTIMFIRST10NEW = KORSS1objMODIndSHORTSTIMFIRST10;
% newKORSS1objMODIndSHORTSTIMFIRST10NEW(badS1INF) = [];
% 
% newKORSS1objLATENCYONSETNEW = KORSS1objLATENCYONSET;
% newKORSS1objLATENCYONSETNEW(badS1INF) = [];
% 
% newKORSS1objLATENCYENDNEW = KORSS1objLATENCYEND;
% newKORSS1objLATENCYENDNEW(badS1INF) = [];

newKORSS1objMODIndFIRST5NEW = KORSS1objMODIndFIRST5;
newKORSS1objMODIndFIRST5NEW(badS1INF) = [];

newKORSS1objMODIndPLATFIRST5NEW = KORSS1objMODIndPLATFIRST5;
newKORSS1objMODIndPLATFIRST5NEW(badS1INF) = [];

newKORSS1objMODIndSHORTSTIMFIRST5NEW = KORSS1objMODIndSHORTSTIMFIRST5;
newKORSS1objMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


%
%
%
%
%%
FSS1cellssoc = find(allforsocS1widths< 400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allforsocS1widths< 400 & groupS1forcALL == "WT");

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



FSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(FSWTS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellssoc);
WTFSS1socialMODInd = allforcsocialS1MODInd(FSWTS1cellssoc);
WTFSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(FSWTS1cellssoc);
WTFSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(FSWTS1cellssoc);

WTFSS1socialMODIndFIRST5 = allforcsocialS1MODIndFIRST5(FSWTS1cellssoc);
WTFSS1socialMODIndPLATFIRST5 = allforcsocialS1MODIndPLATFIRST5(FSWTS1cellssoc);
WTFSS1socialMODIndSHORTSTIMFIRST5 = allforcsocialS1MODIndSHORTSTIMFIRST5(FSWTS1cellssoc);

WTFSS1forcAUCSTIM = allforcS1AUCSTIM(FSWTS1cellssoc);
WTFSS1forcAUCSHORTSTIM = allforcS1AUCSHORTSTIM(FSWTS1cellssoc);
WTFSS1forcAUCPLAT = allforcS1AUCPLAT(FSWTS1cellssoc);

% [badS1INFr,badS1INFc] = find(ismember(FSALLS1WTFORCSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1WTFORCSOCZ));
badS1INF = unique(badS1INFr);
FSnewALLS1WTFORCSOCZ = FSALLS1WTFORCSOCZ;
FSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
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


newWTFSS1forcAUCSTIMNEW = WTFSS1forcAUCSTIM;
newWTFSS1forcAUCSTIMNEW(badS1INF) = [];

newWTFSS1forcAUCSHORTSTIMNEW = WTFSS1forcAUCSHORTSTIM;
newWTFSS1forcAUCSHORTSTIMNEW(badS1INF) = [];

newWTFSS1forcAUCPLATNEW = WTFSS1forcAUCPLAT;
newWTFSS1forcAUCPLATNEW(badS1INF) = [];

newWTFSS1socialMODIndFIRST5NEW = WTFSS1socialMODIndFIRST5;
newWTFSS1socialMODIndFIRST5NEW(badS1INF) = [];

newWTFSS1socialMODIndPLATFIRST5NEW = WTFSS1socialMODIndPLATFIRST5;
newWTFSS1socialMODIndPLATFIRST5NEW(badS1INF) = [];

newWTFSS1socialMODIndSHORTSTIMFIRST5NEW = WTFSS1socialMODIndSHORTSTIMFIRST5;
newWTFSS1socialMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);


FSS1cellsobj = find(allforobjS1widths< 400);

WTS1cellsobj = find(groupS1forcALL == "WT");

%FSWTS1cellsobj = find(ismember(WTS1cellsobj,FSS1cellsobj)==1);

FSWTS1cellsobj = find(allforobjS1widths< 400 & groupS1forcALL == "WT");

WTS1objidx = idxS1WT(FSWTS1cellsobj);

WTFSobjMODInd = allforcobjS1MODInd(FSWTS1cellsobj);




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

FSALLS1WTFORCOBJZ = ALLS1FORCOBJZ(FSWTS1cellsobj,:);

% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1FSWT = newmouseS1WT(FSWTS1cellsobj);
WTFSS1objMODInd = allforcobjS1MODInd(FSWTS1cellsobj);
WTFSS1objMODIndSTIM = allforcobjS1MODIndSTIM(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(FSWTS1cellsobj);
WTFSS1objMODIndPLAT = allforcobjS1MODIndPLAT(FSWTS1cellsobj);

WTFSS1objMODIndFIRST5 = allforcobjS1MODIndFIRST5(FSWTS1cellsobj);
WTFSS1objMODIndPLATFIRST5 = allforcobjS1MODIndPLATFIRST5(FSWTS1cellsobj);
WTFSS1objMODIndSHORTSTIMFIRST5 = allforcobjS1MODIndSHORTSTIMFIRST5(FSWTS1cellsobj);


% [badS1INFr,badS1INFc] = find(ismember(FSALLS1WTFORCOBJZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1WTFORCOBJZ));
badS1INF = unique(badS1INFr);
FSnewALLS1WTFORCOBJZ = FSALLS1WTFORCOBJZ;
FSnewALLS1WTFORCOBJZ(badS1INF, :) = [];
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
newWTFSS1objMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:)),nanstd(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:))/(sqrt(size(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:)),nanstd(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:))/(sqrt(size(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:)),nanstd(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:))/(sqrt(size(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:)),nanstd(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:))/(sqrt(size(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:)),nanstd(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:))/(sqrt(size(FSnewALLS1WTFORCOBJZ(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

FSS1cellssoc = find(allforsocS1widths< 400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allforsocS1widths< 400 & groupS1forcALL == "KO");

KOS1socidx = idxS1KO(FSKOS1cellssoc-525);




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

FSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(FSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1(FSKOS1cellssoc);

KOFSS1socialMODInd = allforcsocialS1MODInd(FSKOS1cellssoc);

KOFSS1socialMODIndSTIM = allforcsocialS1MODIndSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIM = allforcsocialS1MODIndSHORTSTIM(FSKOS1cellssoc);
KOFSS1socialMODIndPLAT = allforcsocialS1MODIndPLAT(FSKOS1cellssoc);

% KOFSS1forcAUCSTIM = allforcS1AUCSTIM(FSKOS1cellssoc);
% KOFSS1forcAUCSHORTSTIM = allforcS1AUCSHORTSTIM(FSKOS1cellssoc);
% KOFSS1forcAUCPLAT = allforcS1AUCPLAT(FSKOS1cellssoc);

KOFSS1socialMODIndFIRST5 = allforcsocialS1MODIndFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndPLATFIRST5 = allforcsocialS1MODIndPLATFIRST5(FSKOS1cellssoc);
KOFSS1socialMODIndSHORTSTIMFIRST5 = allforcsocialS1MODIndSHORTSTIMFIRST5(FSKOS1cellssoc);


% [badS1INFr,badS1INFc] = find(ismember(FSALLS1KOFORCSOCZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1KOFORCSOCZ));
badS1INF = unique(badS1INFr);
FSnewALLS1KOFORCSOCZ = FSALLS1KOFORCSOCZ;
FSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
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
newKOFSS1socialMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];

% 
% newKOFSS1forcAUCSTIMNEW = KOFSS1forcAUCSTIM;
% newKOFSS1forcAUCSTIMNEW(badS1INF) = [];
% 
% newKOFSS1forcAUCSHORTSTIMNEW = KOFSS1forcAUCSHORTSTIM;
% newKOFSS1forcAUCSHORTSTIMNEW(badS1INF) = [];
% 
% newKOFSS1forcAUCPLATNEW = KOFSS1forcAUCPLAT;
% newKOFSS1forcAUCPLATNEW(badS1INF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

FSS1cellsobj = find(allforobjS1widths< 400);

KOS1cellsobj = find(groupS1forcALL == "KO");

%FSKOS1cellsobj = find(ismember(KOS1cellsobj,FSS1cellsobj)==1);

FSKOS1cellsobj = find(allforobjS1widths< 400 & groupS1forcALL == "KO");

KOS1objidx = idxS1KO(FSKOS1cellsobj-525);

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

FSALLS1KOFORCOBJZ = ALLS1FORCOBJZ(FSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1FSKO = newmouseS1(FSKOS1cellsobj);

KOFSS1objMODInd = allforcobjS1MODInd(FSKOS1cellsobj);
KOFSS1objMODIndSTIM = allforcobjS1MODIndSTIM(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIM = allforcobjS1MODIndSHORTSTIM(FSKOS1cellsobj);
KOFSS1objMODIndPLAT = allforcobjS1MODIndPLAT(FSKOS1cellsobj);

KOFSS1objMODIndFIRST5 = allforcobjS1MODIndFIRST5(FSKOS1cellsobj);
KOFSS1objMODIndPLATFIRST5 = allforcobjS1MODIndPLATFIRST5(FSKOS1cellsobj);
KOFSS1objMODIndSHORTSTIMFIRST5 = allforcobjS1MODIndSHORTSTIMFIRST5(FSKOS1cellsobj);

% [badS1INFr,badS1INFc] = find(ismember(FSALLS1KOFORCOBJZ,Inf));
[badS1INFr,badS1INFc] = find(isnan(FSALLS1KOFORCOBJZ));
badS1INF = unique(badS1INFr);
FSnewALLS1KOFORCOBJZ = FSALLS1KOFORCOBJZ;
FSnewALLS1KOFORCOBJZ(badS1INF, :) = [];
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
newKOFSS1objMODIndSHORTSTIMFIRST5NEW(badS1INF) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(11); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:)),nanstd(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:))/(sqrt(size(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:)),nanstd(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:))/(sqrt(size(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:)),nanstd(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:))/(sqrt(size(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:)),nanstd(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:))/(sqrt(size(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:)),nanstd(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:))/(sqrt(size(FSnewALLS1KOFORCOBJZ(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


%
%
%
%
%% BLA



WTBLAcellssoc = find(groupBLAforcALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAforcALL == "WT");

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

RSALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);
WTRSBLAsocialMODInd = allforcsocialBLAMODInd(RSWTBLAcellssoc);

WTRSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(RSWTBLAcellssoc);
% WTRSBLAsocialMODIndFIRST10 = allforcsocialBLAMODIndFIRST10(RSWTBLAcellssoc);
% WTRSBLAsocialMODIndPLATFIRST10 = allforcsocialBLAMODIndPLATFIRST10(RSWTBLAcellssoc);
% WTRSBLAsocialMODIndSHORTSTIMFIRST10 = allforcsocialBLAMODIndSHORTSTIMFIRST10(RSWTBLAcellssoc);
% 
% WTRSBLAsocialLATENCYONSET = allforcsocialBLALATENCYONSET(RSWTBLAcellssoc);
% WTRSBLAsocialLATENCYEND = allforcsocialBLALATENCYEND(RSWTBLAcellssoc);

WTRSBLAsocialMODIndFIRST5 = allforcsocialBLAMODIndFIRST5(RSWTBLAcellssoc);
WTRSBLAsocialMODIndPLATFIRST5 = allforcsocialBLAMODIndPLATFIRST5(RSWTBLAcellssoc);
WTRSBLAsocialMODIndSHORTSTIMFIRST5 = allforcsocialBLAMODIndSHORTSTIMFIRST5(RSWTBLAcellssoc);

WTRSBLAforcAUCSTIM = allforcBLAAUCSTIM(RSWTBLAcellssoc);
WTRSBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(RSWTBLAcellssoc);
WTRSBLAforcAUCPLAT = allforcBLAAUCPLAT(RSWTBLAcellssoc);

% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCSOCZ,Inf));
[badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAWTFORCSOCZ));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCSOCZ = RSALLBLAWTFORCSOCZ;
RSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
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

newWTRSBLAsocialMODIndFIRST5NEW = WTRSBLAsocialMODIndFIRST5;
newWTRSBLAsocialMODIndFIRST5NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndPLATFIRST5NEW = WTRSBLAsocialMODIndPLATFIRST5;
newWTRSBLAsocialMODIndPLATFIRST5NEW(badBLAINF) = [];

newWTRSBLAsocialMODIndSHORTSTIMFIRST5NEW = WTRSBLAsocialMODIndSHORTSTIMFIRST5;
newWTRSBLAsocialMODIndSHORTSTIMFIRST5NEW(badBLAINF) = [];


% newWTRSBLAsocialMODIndFIRST10NEW = WTRSBLAsocialMODIndFIRST10;
% newWTRSBLAsocialMODIndFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAsocialMODIndPLATFIRST10NEW = WTRSBLAsocialMODIndPLATFIRST10;
% newWTRSBLAsocialMODIndPLATFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAsocialMODIndSHORTSTIMFIRST10NEW = WTRSBLAsocialMODIndSHORTSTIMFIRST10;
% newWTRSBLAsocialMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAsocialLATENCYONSETNEW = WTRSBLAsocialLATENCYONSET;
% newWTRSBLAsocialLATENCYONSETNEW(badBLAINF) = [];
% 
% newWTRSBLAsocialLATENCYENDNEW = WTRSBLAsocialLATENCYEND;
% newWTRSBLAsocialLATENCYENDNEW(badBLAINF) = [];


newWTRSBLAforcAUCSTIMNEW = WTRSBLAforcAUCSTIM;
newWTRSBLAforcAUCSTIMNEW(badBLAINF) = [];

newWTRSBLAforcAUCSHORTSTIMNEW = WTRSBLAforcAUCSHORTSTIM;
newWTRSBLAforcAUCSHORTSTIMNEW(badBLAINF) = [];

newWTRSBLAforcAUCPLATNEW = WTRSBLAforcAUCPLAT;
newWTRSBLAforcAUCPLATNEW(badBLAINF) = [];

RSBLAmouseIDWT(badBLAINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;



WTBLAcellsobj = find(groupBLAforcALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAforcALL == "WT");

WTBLAobjidx = idxBLAWT(RSWTBLAcellsobj);


RSYWT = Y(RSWTBLAcellsobj,:);
figure;
plot(RSYWT(WTBLAobjidx==1,1),RSYWT(WTBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==2,1),RSYWT(WTBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAobjidx==3,1),RSYWT(WTBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==4,1),RSYWT(WTBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAWTFORCOBJZ = ALLBLAFORCOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);
WTRSBLAobjMODInd = allforcobjBLAMODInd(RSWTBLAcellsobj);

WTRSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(RSWTBLAcellsobj);
% WTRSBLAobjMODIndFIRST10 = allforcobjBLAMODIndFIRST10(RSWTBLAcellssoc);
% WTRSBLAobjMODIndPLATFIRST10 = allforcobjBLAMODIndPLATFIRST10(RSWTBLAcellssoc);
% WTRSBLAobjMODIndSHORTSTIMFIRST10 = allforcobjBLAMODIndSHORTSTIMFIRST10(RSWTBLAcellssoc);
% 
% WTRSBLAobjLATENCYONSET = allforcobjBLALATENCYONSET(RSWTBLAcellssoc);
% WTRSBLAobjLATENCYEND = allforcobjBLALATENCYEND(RSWTBLAcellssoc);
% 
% 
WTRSBLAobjMODIndFIRST5 = allforcobjBLAMODIndFIRST5(RSWTBLAcellsobj);
WTRSBLAobjMODIndPLATFIRST5 = allforcobjBLAMODIndPLATFIRST5(RSWTBLAcellsobj);
WTRSBLAobjMODIndSHORTSTIMFIRST5 = allforcobjBLAMODIndSHORTSTIMFIRST5(RSWTBLAcellsobj);


% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCOBJZ,Inf));
[badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAWTFORCOBJZ));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCOBJZ = RSALLBLAWTFORCOBJZ;
RSnewALLBLAWTFORCOBJZ(badBLAINF, :) = [];
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

newWTRSBLAobjMODIndFIRST5NEW = WTRSBLAobjMODIndFIRST5;
newWTRSBLAobjMODIndFIRST5NEW(badBLAINF) = [];

newWTRSBLAobjMODIndPLATFIRST5NEW = WTRSBLAobjMODIndPLATFIRST5;
newWTRSBLAobjMODIndPLATFIRST5NEW(badBLAINF) = [];

newWTRSBLAobjMODIndSHORTSTIMFIRST5NEW = WTRSBLAobjMODIndSHORTSTIMFIRST5;
newWTRSBLAobjMODIndSHORTSTIMFIRST5NEW(badBLAINF) = [];


% newWTRSBLAobjMODIndFIRST10NEW = WTRSBLAobjMODIndFIRST10;
% newWTRSBLAobjMODIndFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAobjMODIndPLATFIRST10NEW = WTRSBLAobjMODIndPLATFIRST10;
% newWTRSBLAobjMODIndPLATFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAobjMODIndSHORTSTIMFIRST10NEW = WTRSBLAobjMODIndSHORTSTIMFIRST10;
% newWTRSBLAobjMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];
% 
% newWTRSBLAobjLATENCYONSETNEW = WTRSBLAobjLATENCYONSET;
% newWTRSBLAobjLATENCYONSETNEW(badBLAINF) = [];
% 
% newWTRSBLAobjLATENCYENDNEW = WTRSBLAobjLATENCYEND;
% newWTRSBLAobjLATENCYENDNEW(badBLAINF) = [];
% 
% RSallforcBLAWTSPONT = allforcBLAWTSPONT(RSWTBLAcellssoc,:);
% RSallforcBLAWTSPONT(badBLAINF,:) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZ(find(newWTBLAobjidx==4),:),1)))); xlim([-2 6.95]);hold on;

%%


KOBLAcellssoc = find(groupBLAforcALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAforcALL == "KO");

KOBLAsocidx = idxBLAKO(RSKOBLAcellssoc-240);


RSYKO = Y(RSKOBLAcellssoc,:);
figure;
plot(RSYKO(KOBLAsocidx==1,1),RSYKO(KOBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==2,1),RSYKO(KOBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAsocidx==3,1),RSYKO(KOBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==4,1),RSYKO(KOBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellssoc);
KORSBLAsocialMODInd = allforcsocialBLAMODInd(RSKOBLAcellssoc);

KORSBLAsocialMODIndSTIM = allforcsocialBLAMODIndSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIM = allforcsocialBLAMODIndSHORTSTIM(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLAT = allforcsocialBLAMODIndPLAT(RSKOBLAcellssoc);
% 
% KORSBLAsocialMODIndFIRST10 = allforcsocialBLAMODIndFIRST10(RSKOBLAcellssoc);
% KORSBLAsocialMODIndPLATFIRST10 = allforcsocialBLAMODIndPLATFIRST10(RSKOBLAcellssoc);
% KORSBLAsocialMODIndSHORTSTIMFIRST10 = allforcsocialBLAMODIndSHORTSTIMFIRST10(RSKOBLAcellssoc);

% KORSBLAsocialLATENCYONSET = allforcsocialBLALATENCYONSET(RSKOBLAcellssoc);
% KORSBLAsocialLATENCYEND = allforcsocialBLALATENCYEND(RSKOBLAcellssoc);
% 
% KORSBLAforcAUCSTIM = allforcBLAAUCSTIM(RSKOBLAcellssoc);
% KORSBLAforcAUCSHORTSTIM = allforcBLAAUCSHORTSTIM(RSKOBLAcellssoc);
% KORSBLAforcAUCPLAT = allforcBLAAUCPLAT(RSKOBLAcellssoc);

KORSBLAsocialMODIndFIRST5 = allforcsocialBLAMODIndFIRST5(RSKOBLAcellssoc);
KORSBLAsocialMODIndPLATFIRST5 = allforcsocialBLAMODIndPLATFIRST5(RSKOBLAcellssoc);
KORSBLAsocialMODIndSHORTSTIMFIRST5 = allforcsocialBLAMODIndSHORTSTIMFIRST5(RSKOBLAcellssoc);

[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCSOCZ,Inf));
% [badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAKOFORCSOCZ));
% badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCSOCZ = RSALLBLAKOFORCSOCZ;
RSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
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
% 
% newKORSBLAsocialMODIndFIRST10NEW = KORSBLAsocialMODIndFIRST10;
% newKORSBLAsocialMODIndFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAsocialMODIndPLATFIRST10NEW = KORSBLAsocialMODIndPLATFIRST10;
% newKORSBLAsocialMODIndPLATFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAsocialMODIndSHORTSTIMFIRST10NEW = KORSBLAsocialMODIndSHORTSTIMFIRST10;
% newKORSBLAsocialMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAsocialLATENCYONSETNEW = KORSBLAsocialLATENCYONSET;
% newKORSBLAsocialLATENCYONSETNEW(badBLAINF) = [];
% 
% newKORSBLAsocialLATENCYENDNEW = KORSBLAsocialLATENCYEND;
% newKORSBLAsocialLATENCYENDNEW(badBLAINF) = [];

newKORSBLAsocialMODIndFIRST5NEW = KORSBLAsocialMODIndFIRST5;
newKORSBLAsocialMODIndFIRST5NEW(badBLAINF) = [];

newKORSBLAsocialMODIndPLATFIRST5NEW = KORSBLAsocialMODIndPLATFIRST5;
newKORSBLAsocialMODIndPLATFIRST5NEW(badBLAINF) = [];

newKORSBLAsocialMODIndSHORTSTIMFIRST5NEW = KORSBLAsocialMODIndSHORTSTIMFIRST5;
newKORSBLAsocialMODIndSHORTSTIMFIRST5NEW(badBLAINF) = [];



newKORSBLAforcAUCSTIMNEW = KORSBLAforcAUCSTIM;
newKORSBLAforcAUCSTIMNEW(badBLAINF) = [];

newKORSBLAforcAUCSHORTSTIMNEW = KORSBLAforcAUCSHORTSTIM;
newKORSBLAforcAUCSHORTSTIMNEW(badBLAINF) = [];

newKORSBLAforcAUCPLATNEW = KORSBLAforcAUCPLAT;
newKORSBLAforcAUCPLATNEW(badBLAINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;

%%

KOBLAcellsobj = find(groupBLAforcALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAforcALL == "KO");

KOBLAobjidx = idxBLAKO(RSKOBLAcellsobj-240);


RSYKO = Y(RSKOBLAcellsobj,:);
figure;
plot(RSYKO(KOBLAobjidx==1,1),RSYKO(KOBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==2,1),RSYKO(KOBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAobjidx==3,1),RSYKO(KOBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==4,1),RSYKO(KOBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAKOFORCOBJZ = ALLBLAFORCOBJZ(RSKOBLAcellsobj,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellsobj);

KORSBLAobjMODInd = allforcobjBLAMODInd(RSKOBLAcellsobj);

KORSBLAobjMODIndSTIM = allforcobjBLAMODIndSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIM = allforcobjBLAMODIndSHORTSTIM(RSKOBLAcellsobj);
KORSBLAobjMODIndPLAT = allforcobjBLAMODIndPLAT(RSKOBLAcellsobj);

% KORSBLAobjMODIndFIRST10 = allforcobjBLAMODIndFIRST10(RSKOBLAcellssoc);
% KORSBLAobjMODIndPLATFIRST10 = allforcobjBLAMODIndPLATFIRST10(RSKOBLAcellssoc);
% KORSBLAobjMODIndSHORTSTIMFIRST10 = allforcobjBLAMODIndSHORTSTIMFIRST10(RSKOBLAcellssoc);
% 
% KORSBLAobjLATENCYONSET = allforcobjBLALATENCYONSET(RSKOBLAcellssoc);
% KORSBLAobjLATENCYEND = allforcobjBLALATENCYEND(RSKOBLAcellssoc);

KORSBLAobjMODIndFIRST5 = allforcobjBLAMODIndFIRST5(RSKOBLAcellsobj);
KORSBLAobjMODIndPLATFIRST5 = allforcobjBLAMODIndPLATFIRST5(RSKOBLAcellsobj);
KORSBLAobjMODIndSHORTSTIMFIRST5 = allforcobjBLAMODIndSHORTSTIMFIRST5(RSKOBLAcellsobj);


% [badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCOBJZ,Inf));
% [badBLAINFr,badBLAINFc] = find(isnan(RSALLBLAKOFORCOBJZ));
% badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCOBJZ = RSALLBLAKOFORCOBJZ;
RSnewALLBLAKOFORCOBJZ(badBLAINF, :) = [];
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

% newKORSBLAobjMODIndFIRST10NEW = KORSBLAobjMODIndFIRST10;
% newKORSBLAobjMODIndFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAobjMODIndPLATFIRST10NEW = KORSBLAobjMODIndPLATFIRST10;
% newKORSBLAobjMODIndPLATFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAobjMODIndSHORTSTIMFIRST10NEW = KORSBLAobjMODIndSHORTSTIMFIRST10;
% newKORSBLAobjMODIndSHORTSTIMFIRST10NEW(badBLAINF) = [];
% 
% newKORSBLAobjLATENCYONSETNEW = KORSBLAobjLATENCYONSET;
% newKORSBLAobjLATENCYONSETNEW(badBLAINF) = [];
% 
% newKORSBLAobjLATENCYENDNEW = KORSBLAobjLATENCYEND;
% newKORSBLAobjLATENCYENDNEW(badBLAINF) = [];

newKORSBLAobjMODIndFIRST5NEW = KORSBLAobjMODIndFIRST5;
newKORSBLAobjMODIndFIRST5NEW(badBLAINF) = [];

newKORSBLAobjMODIndPLATFIRST5NEW = KORSBLAobjMODIndPLATFIRST5;
newKORSBLAobjMODIndPLATFIRST5NEW(badBLAINF) = [];

newKORSBLAobjMODIndSHORTSTIMFIRST5NEW = KORSBLAobjMODIndSHORTSTIMFIRST5;
newKORSBLAobjMODIndSHORTSTIMFIRST5NEW(badBLAINF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;




%% ISOLATE BY GENOTYPE


RSSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

% RSWTSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250 & groupSTRforcALL == "WT");
RSWTSTRcellssoc = find(groupSTRforcALL == "WT");

WTSTRsocidx = idxSTRWT(RSWTSTRcellssoc);
RSSTRmouseIDWT = STRmouseIDWT(RSWTSTRcellssoc);


RSXWT = X(RSWTSTRcellssoc,:);
figure;
plot(RSXWT(WTSTRsocidx==4,1),RSXWT(WTSTRsocidx==4,2),'r.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==1,1),RSXWT(WTSTRsocidx==1,2),'b.','MarkerSize',12)
hold on; plot(RSXWT(WTSTRsocidx==2,1),RSXWT(WTSTRsocidx==2,2),'g.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==3,1),RSXWT(WTSTRsocidx==3,2),'k.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==5,1),RSXWT(WTSTRsocidx==5,2),'c.','MarkerSize',12)
hold on
plot(RSXWT(WTSTRsocidx==6,1),RSXWT(WTSTRsocidx==6,2),'m.','MarkerSize',12)


RSALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(RSWTSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellssoc);
WTRSSTRsocialMODInd = allforcsocialSTRMODInd(RSWTSTRcellssoc);

WTRSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(RSWTSTRcellssoc);
% WTRSSTRsocialMODIndFIRST10 = allforcsocialSTRMODIndFIRST10(RSWTSTRcellssoc);
% WTRSSTRsocialMODIndPLATFIRST10 = allforcsocialSTRMODIndPLATFIRST10(RSWTSTRcellssoc);
% WTRSSTRsocialMODIndSHORTSTIMFIRST10 = allforcsocialSTRMODIndSHORTSTIMFIRST10(RSWTSTRcellssoc);
% 
% WTRSSTRsocialLATENCYONSET = allforcsocialSTRLATENCYONSET(RSWTSTRcellssoc);
% WTRSSTRsocialLATENCYEND = allforcsocialSTRLATENCYEND(RSWTSTRcellssoc);

WTRSSTRsocialMODIndFIRST5 = allforcsocialSTRMODIndFIRST5(RSWTSTRcellssoc);
WTRSSTRsocialMODIndPLATFIRST5 = allforcsocialSTRMODIndPLATFIRST5(RSWTSTRcellssoc);
WTRSSTRsocialMODIndSHORTSTIMFIRST5 = allforcsocialSTRMODIndSHORTSTIMFIRST5(RSWTSTRcellssoc);

WTRSSTRforcAUCSTIM = allforcSTRAUCSTIM(RSWTSTRcellssoc);
WTRSSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(RSWTSTRcellssoc);
WTRSSTRforcAUCPLAT = allforcSTRAUCPLAT(RSWTSTRcellssoc);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCSOCZ = RSALLSTRWTFORCSOCZ;
RSnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
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
% 
% newWTRSSTRsocialMODIndFIRST10NEW = WTRSSTRsocialMODIndFIRST10;
% newWTRSSTRsocialMODIndFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRsocialMODIndPLATFIRST10NEW = WTRSSTRsocialMODIndPLATFIRST10;
% newWTRSSTRsocialMODIndPLATFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRsocialMODIndSHORTSTIMFIRST10NEW = WTRSSTRsocialMODIndSHORTSTIMFIRST10;
% newWTRSSTRsocialMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRsocialLATENCYONSETNEW = WTRSSTRsocialLATENCYONSET;
% newWTRSSTRsocialLATENCYONSETNEW(badSTRINF) = [];
% 
% newWTRSSTRsocialLATENCYENDNEW = WTRSSTRsocialLATENCYEND;
% newWTRSSTRsocialLATENCYENDNEW(badSTRINF) = [];

newWTRSSTRsocialMODIndFIRST5NEW = WTRSSTRsocialMODIndFIRST5;
newWTRSSTRsocialMODIndFIRST5NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndPLATFIRST5NEW = WTRSSTRsocialMODIndPLATFIRST5;
newWTRSSTRsocialMODIndPLATFIRST5NEW(badSTRINF) = [];

newWTRSSTRsocialMODIndSHORTSTIMFIRST5NEW = WTRSSTRsocialMODIndSHORTSTIMFIRST5;
newWTRSSTRsocialMODIndSHORTSTIMFIRST5NEW(badSTRINF) = [];



newWTRSSTRforcAUCSTIMNEW = WTRSSTRforcAUCSTIM;
newWTRSSTRforcAUCSTIMNEW(badSTRINF) = [];

newWTRSSTRforcAUCSHORTSTIMNEW = WTRSSTRforcAUCSHORTSTIM;
newWTRSSTRforcAUCSHORTSTIMNEW(badSTRINF) = [];

newWTRSSTRforcAUCPLATNEW = WTRSSTRforcAUCPLAT;
newWTRSSTRforcAUCPLATNEW(badSTRINF) = [];

RSallforcSTRWTSPONT = allforcSTRWTSPONT(RSWTSTRcellssoc,:);
RSallforcSTRWTSPONT(badSTRINF,:) = [];

RSSTRmouseIDWT(badSTRINF) = [];
% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRforcALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(groupSTRforcALL == "WT");

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

RSALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(RSWTSTRcellsobj,:);

% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);
WTRSSTRobjMODInd = allforcobjSTRMODInd(RSWTSTRcellsobj);
WTRSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(RSWTSTRcellsobj);
WTRSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(RSWTSTRcellsobj);
WTRSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(RSWTSTRcellsobj);
% WTRSSTRobjMODIndFIRST10 = allforcobjSTRMODIndFIRST10(RSWTSTRcellssoc);
% WTRSSTRobjMODIndPLATFIRST10 = allforcobjSTRMODIndPLATFIRST10(RSWTSTRcellssoc);
% WTRSSTRobjMODIndSHORTSTIMFIRST10 = allforcobjSTRMODIndSHORTSTIMFIRST10(RSWTSTRcellssoc);
% 
% WTRSSTRobjLATENCYONSET = allforcobjSTRLATENCYONSET(RSWTSTRcellssoc);
% WTRSSTRobjLATENCYEND = allforcobjSTRLATENCYEND(RSWTSTRcellssoc);
% 

WTRSSTRobjMODIndFIRST5 = allforcobjSTRMODIndFIRST5(RSWTSTRcellsobj);
WTRSSTRobjMODIndPLATFIRST5 = allforcobjSTRMODIndPLATFIRST5(RSWTSTRcellsobj);
WTRSSTRobjMODIndSHORTSTIMFIRST5 = allforcobjSTRMODIndSHORTSTIMFIRST5(RSWTSTRcellsobj);

% [badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCOBJZ,Inf));
% badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCOBJZ = RSALLSTRWTFORCOBJZ;
RSnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
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


newWTRSSTRobjMODIndFIRST5NEW = WTRSSTRobjMODIndFIRST5;
newWTRSSTRobjMODIndFIRST5NEW(badSTRINF) = [];

newWTRSSTRobjMODIndPLATFIRST5NEW = WTRSSTRobjMODIndPLATFIRST5;
newWTRSSTRobjMODIndPLATFIRST5NEW(badSTRINF) = [];

newWTRSSTRobjMODIndSHORTSTIMFIRST5NEW = WTRSSTRobjMODIndSHORTSTIMFIRST5;
newWTRSSTRobjMODIndSHORTSTIMFIRST5NEW(badSTRINF) = [];
% 
% newWTRSSTRobjMODIndFIRST10NEW = WTRSSTRobjMODIndFIRST10;
% newWTRSSTRobjMODIndFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRobjMODIndPLATFIRST10NEW = WTRSSTRobjMODIndPLATFIRST10;
% newWTRSSTRobjMODIndPLATFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRobjMODIndSHORTSTIMFIRST10NEW = WTRSSTRobjMODIndSHORTSTIMFIRST10;
% newWTRSSTRobjMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];
% 
% newWTRSSTRobjLATENCYONSETNEW = WTRSSTRobjLATENCYONSET;
% newWTRSSTRobjLATENCYONSETNEW(badSTRINF) = [];
% 
% newWTRSSTRobjLATENCYENDNEW = WTRSSTRobjLATENCYEND;
% newWTRSSTRobjLATENCYENDNEW(badSTRINF) = [];
% 
% 

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(groupSTRforcALL == "KO");

KOSTRsocidx = idxSTRKO(RSKOSTRcellssoc-265);


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

RSALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(RSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellssoc);
KORSSTRsocialMODInd = allforcsocialSTRMODInd(RSKOSTRcellssoc);

KORSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(RSKOSTRcellssoc);

% KORSSTRsocialMODIndFIRST10 = allforcsocialSTRMODIndFIRST10(RSKOSTRcellssoc);
% KORSSTRsocialMODIndPLATFIRST10 = allforcsocialSTRMODIndPLATFIRST10(RSKOSTRcellssoc);
% KORSSTRsocialMODIndSHORTSTIMFIRST10 = allforcsocialSTRMODIndSHORTSTIMFIRST10(RSKOSTRcellssoc);

KORSSTRsocialMODIndFIRST5 = allforcsocialSTRMODIndFIRST5(RSKOSTRcellssoc);
KORSSTRsocialMODIndPLATFIRST5 = allforcsocialSTRMODIndPLATFIRST5(RSKOSTRcellssoc);
KORSSTRsocialMODIndSHORTSTIMFIRST5 = allforcsocialSTRMODIndSHORTSTIMFIRST5(RSKOSTRcellssoc);

% KORSSTRsocialLATENCYONSET = allforcsocialSTRLATENCYONSET(RSKOSTRcellssoc);
% KORSSTRsocialLATENCYEND = allforcsocialSTRLATENCYEND(RSKOSTRcellssoc);
KORSSTRforcAUCSTIM = allforcSTRAUCSTIM(RSKOSTRcellssoc);
KORSSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(RSKOSTRcellssoc);
KORSSTRforcAUCPLAT = allforcSTRAUCPLAT(RSKOSTRcellssoc);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCSOCZ = RSALLSTRKOFORCSOCZ;
RSnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
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
% 
% newKORSSTRsocialMODIndFIRST10NEW = KORSSTRsocialMODIndFIRST10;
% newKORSSTRsocialMODIndFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRsocialMODIndPLATFIRST10NEW = KORSSTRsocialMODIndPLATFIRST10;
% newKORSSTRsocialMODIndPLATFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRsocialMODIndSHORTSTIMFIRST10NEW = KORSSTRsocialMODIndSHORTSTIMFIRST10;
% newKORSSTRsocialMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRsocialLATENCYONSETNEW = KORSSTRsocialLATENCYONSET;
% newKORSSTRsocialLATENCYONSETNEW(badSTRINF) = [];
% 
% newKORSSTRsocialLATENCYENDNEW = KORSSTRsocialLATENCYEND;
% newKORSSTRsocialLATENCYENDNEW(badSTRINF) = [];

newKORSSTRsocialMODIndFIRST5NEW = KORSSTRsocialMODIndFIRST5;
newKORSSTRsocialMODIndFIRST5NEW(badSTRINF) = [];

newKORSSTRsocialMODIndPLATFIRST5NEW = KORSSTRsocialMODIndPLATFIRST5;
newKORSSTRsocialMODIndPLATFIRST5NEW(badSTRINF) = [];

newKORSSTRsocialMODIndSHORTSTIMFIRST5NEW = KORSSTRsocialMODIndSHORTSTIMFIRST5;
newKORSSTRsocialMODIndSHORTSTIMFIRST5NEW(badSTRINF) = [];



newKORSSTRforcAUCSTIMNEW = KORSSTRforcAUCSTIM;
newKORSSTRforcAUCSTIMNEW(badSTRINF) = [];

newKORSSTRforcAUCSHORTSTIMNEW = KORSSTRforcAUCSHORTSTIM;
newKORSSTRforcAUCSHORTSTIMNEW(badSTRINF) = [];

newKORSSTRforcAUCPLATNEW = KORSSTRforcAUCPLAT;
newKORSSTRforcAUCPLATNEW(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRforcALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(groupSTRforcALL == "KO");

KOSTRobjidx = idxSTRKO(RSKOSTRcellsobj-265);


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

RSALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(RSKOSTRcellsobj,:);

KORSSTRobjMODInd = allforcobjSTRMODInd(RSKOSTRcellsobj);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellsobj);
KORSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(RSKOSTRcellsobj);
KORSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(RSKOSTRcellsobj);
KORSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(RSKOSTRcellsobj);
% KORSSTRobjMODIndFIRST10 = allforcobjSTRMODIndFIRST10(RSKOSTRcellssoc);
% KORSSTRobjMODIndPLATFIRST10 = allforcobjSTRMODIndPLATFIRST10(RSKOSTRcellssoc);
% KORSSTRobjMODIndSHORTSTIMFIRST10 = allforcobjSTRMODIndSHORTSTIMFIRST10(RSKOSTRcellssoc);
% 
% KORSSTRobjLATENCYONSET = allforcobjSTRLATENCYONSET(RSKOSTRcellssoc);
% KORSSTRobjLATENCYEND = allforcobjSTRLATENCYEND(RSKOSTRcellssoc);
KORSSTRobjMODIndFIRST5 = allforcobjSTRMODIndFIRST5(RSKOSTRcellsobj);
KORSSTRobjMODIndPLATFIRST5 = allforcobjSTRMODIndPLATFIRST5(RSKOSTRcellsobj);
KORSSTRobjMODIndSHORTSTIMFIRST5 = allforcobjSTRMODIndSHORTSTIMFIRST5(RSKOSTRcellsobj);


% [badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCOBJZ,Inf));
% badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCOBJZ = RSALLSTRKOFORCOBJZ;
RSnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
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

% newKORSSTRobjMODIndFIRST10NEW = KORSSTRobjMODIndFIRST10;
% newKORSSTRobjMODIndFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRobjMODIndPLATFIRST10NEW = KORSSTRobjMODIndPLATFIRST10;
% newKORSSTRobjMODIndPLATFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRobjMODIndSHORTSTIMFIRST10NEW = KORSSTRobjMODIndSHORTSTIMFIRST10;
% newKORSSTRobjMODIndSHORTSTIMFIRST10NEW(badSTRINF) = [];
% 
% newKORSSTRobjLATENCYONSETNEW = KORSSTRobjLATENCYONSET;
% newKORSSTRobjLATENCYONSETNEW(badSTRINF) = [];
% 
% newKORSSTRobjLATENCYENDNEW = KORSSTRobjLATENCYEND;
% newKORSSTRobjLATENCYENDNEW(badSTRINF) = [];

newKORSSTRobjMODIndFIRST5NEW = KORSSTRobjMODIndFIRST5;
newKORSSTRobjMODIndFIRST5NEW(badSTRINF) = [];

newKORSSTRobjMODIndPLATFIRST5NEW = KORSSTRobjMODIndPLATFIRST5;
newKORSSTRobjMODIndPLATFIRST5NEW(badSTRINF) = [];

newKORSSTRobjMODIndSHORTSTIMFIRST5NEW = KORSSTRobjMODIndSHORTSTIMFIRST5;
newKORSSTRobjMODIndSHORTSTIMFIRST5NEW(badSTRINF) = [];




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(14); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


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
FSX = X(find(allforsocSTRwidths<475),:);
FSidxSTR = idxSTR(allforsocSTRwidths<475);
figure;subplot(3,1,1);
plot(FSX(FSidxSTR==1,1),FSX(FSidxSTR==1,2),'k.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==2,1),FSX(FSidxSTR==2,2),'r.','MarkerSize',12)
hold on; plot(FSX(FSidxSTR==3,1),FSX(FSidxSTR==3,2),'b.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==4,1),FSX(FSidxSTR==4,2),'c.','MarkerSize',12)
hold on
plot(FSX(FSidxSTR==5,1),FSX(FSidxSTR==5,2),'g.','MarkerSize',12)




FSALLSTRFORCSOCZ = ALLSTRFORCSOCZ(find(allforsocSTRwidths<475),:);
subplot(3,1,2); gscatter(FSX(:,1),FSX(:,2));

subplot(3,1,3); shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRFORCSOCZ(find(FSidxSTR==1),:)),nanstd(FSALLSTRFORCSOCZ(find(FSidxSTR==1),:))/(sqrt(size(FSALLSTRFORCSOCZ(find(FSidxSTR==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRFORCSOCZ(find(FSidxSTR==2),:)),nanstd(FSALLSTRFORCSOCZ(find(FSidxSTR==2),:))/(sqrt(size(FSALLSTRFORCSOCZ(find(FSidxSTR==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRFORCSOCZ(find(FSidxSTR==3),:)),nanstd(FSALLSTRFORCSOCZ(find(FSidxSTR==3),:))/(sqrt(size(FSALLSTRFORCSOCZ(find(FSidxSTR==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRFORCSOCZ(find(FSidxSTR==4),:)),nanstd(FSALLSTRFORCSOCZ(find(FSidxSTR==4),:))/(sqrt(size(FSALLSTRFORCSOCZ(find(FSidxSTR==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLSTRFORCSOCZ(find(FSidxSTR==5),:)),nanstd(FSALLSTRFORCSOCZ(find(FSidxSTR==5),:))/(sqrt(size(FSALLSTRFORCSOCZ(find(FSidxSTR==5),:),1))),'lineprops', 'c'); 


%% S1
FSY = Y(find(allforsocS1widths< 400),:);
%[idx,c] = kmeans(FSY,5);

FSidxS1 = idxS1(find(allforsocS1widths<400));
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

FSALLS1FORCSOCZ = ALLS1FORCSOCZ(find(allforsocS1widths<400),:);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1FORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1FORCSOCZ = FSALLS1FORCSOCZ;
FSnewALLS1FORCSOCZ(badS1INF, :) = [];
newidx = FSidxS1;
newidx(badS1INF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==1),:)),nanstd(ALLS1FORCSOCZ(find(idx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==2),:)),nanstd(ALLS1FORCSOCZ(find(idx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==3),:)),nanstd(ALLS1FORCSOCZ(find(idx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==4),:)),nanstd(ALLS1FORCSOCZ(find(idx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(idx==5),:)),nanstd(ALLS1FORCSOCZ(find(idx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(idx==5),:),1))),'lineprops', 'c'); 

figure; shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1FORCSOCZ(find(newidx==1),:)),nanstd(FSnewALLS1FORCSOCZ(find(newidx==1),:))/(sqrt(size(FSnewALLS1FORCSOCZ(find(newidx==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1FORCSOCZ(find(newidx==2),:)),nanstd(FSnewALLS1FORCSOCZ(find(newidx==2),:))/(sqrt(size(FSnewALLS1FORCSOCZ(find(newidx==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1FORCSOCZ(find(newidx==3),:)),nanstd(FSnewALLS1FORCSOCZ(find(newidx==3),:))/(sqrt(size(FSnewALLS1FORCSOCZ(find(newidx==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1FORCSOCZ(find(newidx==4),:)),nanstd(FSnewALLS1FORCSOCZ(find(newidx==4),:))/(sqrt(size(FSnewALLS1FORCSOCZ(find(newidx==4),:),1))),'lineprops', 'g'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1FORCSOCZ(find(newidx==5),:)),nanstd(FSnewALLS1FORCSOCZ(find(newidx==5),:))/(sqrt(size(FSnewALLS1FORCSOCZ(find(newidx==5),:),1))),'lineprops', 'c'); 

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


FSALLBLAFORCSOCZ = ALLBLAFORCSOCZ;
subplot(3,1,2); gscatter(FSZ(:,1),FSZ(:,2));


subplot(3,1,3); shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAFORCSOCZ(find(FSidxBLA==1),:)),nanstd(FSALLBLAFORCSOCZ(find(FSidxBLA==1),:))/(sqrt(size(FSALLBLAFORCSOCZ(find(FSidxBLA==1),:),1)))); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAFORCSOCZ(find(FSidxBLA==2),:)),nanstd(FSALLBLAFORCSOCZ(find(FSidxBLA==2),:))/(sqrt(size(FSALLBLAFORCSOCZ(find(FSidxBLA==2),:),1))), 'lineprops', 'r'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAFORCSOCZ(find(FSidxBLA==3),:)),nanstd(FSALLBLAFORCSOCZ(find(FSidxBLA==3),:))/(sqrt(size(FSALLBLAFORCSOCZ(find(FSidxBLA==3),:),1))),'lineprops', 'b'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAFORCSOCZ(find(FSidxBLA==4),:)),nanstd(FSALLBLAFORCSOCZ(find(FSidxBLA==4),:))/(sqrt(size(FSALLBLAFORCSOCZ(find(FSidxBLA==4),:),1))),'lineprops', 'c'); hold on;
shadedErrorBar(-2:0.05:7,nanmean(FSALLBLAFORCSOCZ(find(FSidxBLA==5),:)),nanstd(FSALLBLAFORCSOCZ(find(FSidxBLA==5),:))/(sqrt(size(FSALLBLAFORCSOCZ(find(FSidxBLA==5),:),1))),'lineprops', 'g'); hold on;



%%
%
%
%
%
%% ISOLATE BY GENOTYPE


FSS1cellssoc = find(allforsocS1widths< 400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%FSWTS1cellssoc = find(ismember(WTS1cellssoc,FSS1cellssoc)==1);

FSWTS1cellssoc = find(allforsocS1widths< 400 & groupS1forcALL == "WT");

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

FSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(FSWTS1cellssoc,:);




[badS1INFr,badS1INFc] = find(ismember(FSALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1WTFORCSOCZ = FSALLS1WTFORCSOCZ;
FSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(10); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:)),nanstd(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:))/(sqrt(size(FSnewALLS1WTFORCSOCZ(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);

%%

FSS1cellssoc = find(allforsocS1widths< 400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%FSKOS1cellssoc = find(ismember(KOS1cellssoc,FSS1cellssoc)==1);

FSKOS1cellssoc = find(allforsocS1widths< 400 & groupS1forcALL == "KO");

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

FSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(FSKOS1cellssoc,:);


[badS1INFr,badS1INFc] = find(ismember(FSALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
FSnewALLS1KOFORCSOCZ = FSALLS1KOFORCSOCZ;
FSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(10); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:)),nanstd(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:))/(sqrt(size(FSnewALLS1KOFORCSOCZ(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


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

WTBLAcellssoc = find(groupBLAforcALL == "WT");


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


FSALLBLAWTFORCSOCZ = FSALLBLAFORCSOCZ(WTBLAcellssoc,:);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAWTFORCSOCZ = FSALLBLAWTFORCSOCZ;
FSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:)),nanstd(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:)),nanstd(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:)),nanstd(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:)),nanstd(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==5),:)),nanstd(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==5),:))/(sqrt(size(FSnewALLBLAWTFORCSOCZ(find(newWTBLAsocidx==5),:),1)))); xlim([-2 6.95]);hold on;


%%


KOBLAcellssoc = find(groupBLAforcsoc == "KO");

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


FSALLBLAKOFORCSOCZ = FSALLBLAFORCSOCZ(KOBLAcellssoc,:);


[badBLAINFr,badBLAINFc] = find(ismember(FSALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
FSnewALLBLAKOFORCSOCZ = FSALLBLAKOFORCSOCZ;
FSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:)),nanstd(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on; title('cluster 1'); legend('WT','KO');
subplot(5,2,3); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:)),nanstd(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 2'); legend('WT','KO');
subplot(5,2,5); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:)),nanstd(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 3'); legend('WT','KO');
subplot(5,2,7); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:)),nanstd(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 4'); legend('WT','KO');
subplot(5,2,9); shadedErrorBar(-2:0.05:7,nanmean(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==5),:)),nanstd(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==5),:))/(sqrt(size(FSnewALLBLAKOFORCSOCZ(find(newKOBLAsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on; title('cluster 5'); legend('WT','KO');

%


%% ISOLATE BY GENOTYPE


FSSTRcellssoc = find(allforobjSTRwidths<475);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%FSWTSTRcellssoc = find(ismember(WTSTRcellssoc,FSSTRcellssoc)==1);

FSWTSTRcellssoc = find(allforobjSTRwidths<475 & groupSTRforcALL == "WT");

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

FSALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(FSWTSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellssoc);
WTFSSTRsocialMODInd = allforcsocialSTRMODInd(FSWTSTRcellssoc);

WTFSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(FSWTSTRcellssoc);

WTFSSTRforcAUCSTIM = allforcSTRAUCSTIM(FSWTSTRcellssoc);
WTFSSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(FSWTSTRcellssoc);
WTFSSTRforcAUCPLAT = allforcSTRAUCPLAT(FSWTSTRcellssoc);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTFORCSOCZ = FSALLSTRWTFORCSOCZ;
FSnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
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


newWTFSSTRforcAUCSTIMNEW = WTFSSTRforcAUCSTIM;
newWTFSSTRforcAUCSTIMNEW(badSTRINF) = [];

newWTFSSTRforcAUCSHORTSTIMNEW = WTFSSTRforcAUCSHORTSTIM;
newWTFSSTRforcAUCSHORTSTIMNEW(badSTRINF) = [];

newWTFSSTRforcAUCPLATNEW = WTFSSTRforcAUCPLAT;
newWTFSSTRforcAUCPLATNEW(badSTRINF) = [];


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:)),nanstd(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRWTFORCSOCZ(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


FSSTRcellsobj = find(allforobjSTRwidths<475);

WTSTRcellsobj = find(groupSTRforcALL == "WT");

%FSWTSTRcellsobj = find(ismember(WTSTRcellsobj,FSSTRcellsobj)==1);

FSWTSTRcellsobj = find(allforobjSTRwidths<475 & groupSTRforcALL == "WT");

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

FSALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(FSWTSTRcellsobj,:);

% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRFSWT = newmouseSTRWT(FSWTSTRcellsobj);
WTFSSTRobjMODInd = allforcobjSTRMODInd(FSWTSTRcellsobj);
WTFSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(FSWTSTRcellsobj);
WTFSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(FSWTSTRcellsobj);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRWTFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRWTFORCOBJZ = FSALLSTRWTFORCOBJZ;
FSnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
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



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:)),nanstd(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRWTFORCOBJZ(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

FSSTRcellssoc = find(allforobjSTRwidths<475);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%FSKOSTRcellssoc = find(ismember(KOSTRcellssoc,FSSTRcellssoc)==1);

FSKOSTRcellssoc = find(allforobjSTRwidths<475 & groupSTRforcALL == "KO");

KOSTRsocidx = idxSTRKO(FSKOSTRcellssoc-265);


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

FSALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(FSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTR(FSKOSTRcellssoc);
KOFSSTRsocialMODInd = allforcsocialSTRMODInd(FSKOSTRcellssoc);

KOFSSTRsocialMODIndSTIM = allforcsocialSTRMODIndSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndSHORTSTIM = allforcsocialSTRMODIndSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRsocialMODIndPLAT = allforcsocialSTRMODIndPLAT(FSKOSTRcellssoc);

KOFSSTRforcAUCSTIM = allforcSTRAUCSTIM(FSKOSTRcellssoc);
KOFSSTRforcAUCSHORTSTIM = allforcSTRAUCSHORTSTIM(FSKOSTRcellssoc);
KOFSSTRforcAUCPLAT = allforcSTRAUCPLAT(FSKOSTRcellssoc);

[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOFORCSOCZ = FSALLSTRKOFORCSOCZ;
FSnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
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


newKOFSSTRforcAUCSTIMNEW = KOFSSTRforcAUCSTIM;
newKOFSSTRforcAUCSTIMNEW(badSTRINF) = [];

newKOFSSTRforcAUCSHORTSTIMNEW = KOFSSTRforcAUCSHORTSTIM;
newKOFSSTRforcAUCSHORTSTIMNEW(badSTRINF) = [];

newKOFSSTRforcAUCPLATNEW = KOFSSTRforcAUCPLAT;
newKOFSSTRforcAUCPLATNEW(badSTRINF) = [];

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:)),nanstd(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:))/(sqrt(size(FSnewALLSTRKOFORCSOCZ(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


FSSTRcellsobj = find(allforobjSTRwidths<475);

KOSTRcellsobj = find(groupSTRforcALL == "KO");

%FSKOSTRcellsobj = find(ismember(KOSTRcellsobj,FSSTRcellsobj)==1);

FSKOSTRcellsobj = find(allforobjSTRwidths<475 & groupSTRforcALL == "KO");

KOSTRobjidx = idxSTRKO(FSKOSTRcellsobj-265);


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

FSALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(FSKOSTRcellsobj,:);

KOFSSTRobjMODInd = allforcobjSTRMODInd(FSKOSTRcellsobj);

% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRFSKO = newmouseSTR(FSKOSTRcellsobj);
KOFSSTRobjMODIndSTIM = allforcobjSTRMODIndSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndSHORTSTIM = allforcobjSTRMODIndSHORTSTIM(FSKOSTRcellsobj);
KOFSSTRobjMODIndPLAT = allforcobjSTRMODIndPLAT(FSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(FSALLSTRKOFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
FSnewALLSTRKOFORCOBJZ = FSALLSTRKOFORCOBJZ;
FSnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
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




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(16); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:)),nanstd(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:))/(sqrt(size(FSnewALLSTRKOFORCOBJZ(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);



%%
%
%
%
%
%% Smoothened RS Cells Firing

RSS1cellssoc = find(allforsocS1widths>=400);

WTS1cellssoc = find(groupS1forcALL == "WT");

%RSWTS1cellssoc = find(ismember(WTS1cellssoc,RSS1cellssoc)==1);

RSWTS1cellssoc = find(allforsocS1widths>=400 & groupS1forcALL == "WT");

% RSWTS1cellssoc = find(groupS1forcALL == "WT");


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

RSALLS1WTFORCSOCZ = ALLS1FORCSOCZ(RSWTS1cellssoc,:);

[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTFORCSOCZ = RSALLS1WTFORCSOCZ;
RSnewALLS1WTFORCSOCZ(badS1INF, :) = [];
newWTS1socidx = WTS1socidx;
newWTS1socidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];



for a = 1:size(RSnewALLS1WTFORCSOCZ,1)
    RSnewALLS1WTFORCSOCZSM(a,:) = smoothdata(RSnewALLS1WTFORCSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:)),nanstd(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:))/(sqrt(size(RSnewALLS1WTFORCSOCZSM(find(newWTS1socidx==5),:),1)))); xlim([-2 6.95]);


RSS1cellsobj = find(allforobjS1widths>=400);

WTS1cellsobj = find(groupS1forcALL == "WT");

%RSWTS1cellsobj = find(ismember(WTS1cellsobj,RSS1cellsobj)==1);

RSWTS1cellsobj = find(allforobjS1widths>=400 & groupS1forcALL == "WT");

% RSWTS1cellsobj = find(groupS1forcALL == "WT");


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

RSALLS1WTFORCOBJZ = ALLS1FORCOBJZ(RSWTS1cellsobj,:);



% newmouseS1 = [newmouseS1WT, newmouseS1KO];
% 
% newmouseS1RSWT = newmouseS1WT(RSWTS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1WTFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1WTFORCOBJZ = RSALLS1WTFORCOBJZ;
RSnewALLS1WTFORCOBJZ(badS1INF, :) = [];
newWTS1objidx = WTS1objidx;
newWTS1objidx(badS1INF, :) = [];
% newmouseS1RSWTnoinf = newmouseS1RSWT;
% newmouseS1RSWTnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1WTFORCOBJZ,1)
    RSnewALLS1WTFORCOBJZSM(a,:) = smoothdata(RSnewALLS1WTFORCOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:)),nanstd(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:))/(sqrt(size(RSnewALLS1WTFORCOBJZSM(find(newWTS1objidx==5),:),1)))); xlim([-2 6.95]);

%%

RSS1cellssoc = find(allforsocS1widths>=400);

KOS1cellssoc = find(groupS1forcALL == "KO");

%RSKOS1cellssoc = find(ismember(KOS1cellssoc,RSS1cellssoc)==1);

RSKOS1cellssoc = find(allforsocS1widths>=400 & groupS1forcALL == "KO");

% RSKOS1cellssoc = find(groupS1forcALL == "KO");


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

RSALLS1KOFORCSOCZ = ALLS1FORCSOCZ(RSKOS1cellssoc,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellssoc);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCSOCZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOFORCSOCZ = RSALLS1KOFORCSOCZ;
RSnewALLS1KOFORCSOCZ(badS1INF, :) = [];
newKOS1socidx = KOS1socidx;
newKOS1socidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOFORCSOCZ,1)
    RSnewALLS1KOFORCSOCZSM(a,:) = smoothdata(RSnewALLS1KOFORCSOCZ(a,:),'movmean',4);
end




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLS1FORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLS1FORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:)),nanstd(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:))/(sqrt(size(RSnewALLS1KOFORCSOCZSM(find(newKOS1socidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSS1cellsobj = find(allforobjS1widths>= 400);

KOS1cellsobj = find(groupS1forcALL == "KO");

%RSKOS1cellsobj = find(ismember(KOS1cellsobj,RSS1cellsobj)==1);

RSKOS1cellsobj = find(allforobjS1widths>= 400 & groupS1forcALL == "KO");

% RSKOS1cellsobj = find(groupS1forcALL == "KO");


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

RSALLS1KOFORCOBJZ = ALLS1FORCOBJZ(RSKOS1cellsobj,:);
% 
% newmouseS1 = [newmouseS1KO, newmouseS1KO];
% 
% newmouseS1RSKO = newmouseS1(RSKOS1cellsobj);


[badS1INFr,badS1INFc] = find(ismember(RSALLS1KOFORCOBJZ,Inf));
badS1INF = unique(badS1INFr);
RSnewALLS1KOFORCOBJZ = RSALLS1KOFORCOBJZ;
RSnewALLS1KOFORCOBJZ(badS1INF, :) = [];
newKOS1objidx = KOS1objidx;
newKOS1objidx(badS1INF, :) = [];
% newmouseS1RSKOnoinf = newmouseS1RSKO;
% newmouseS1RSKOnoinf(badS1INF) = [];


for a = 1:size(RSnewALLS1KOFORCOBJZ,1)
    RSnewALLS1KOFORCOBJZSM(a,:) = smoothdata(RSnewALLS1KOFORCOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLS1FORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLS1FORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLS1FORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(12); subplot(5,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(5,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(5,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:)),nanstd(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:))/(sqrt(size(RSnewALLS1KOFORCOBJZSM(find(newKOS1objidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250);

WTSTRcellssoc = find(groupSTRforcALL == "WT");

%RSWTSTRcellssoc = find(ismember(WTSTRcellssoc,RSSTRcellssoc)==1);

RSWTSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250 & groupSTRforcALL == "WT");

% RSWTSTRcellssoc = find(groupSTRforcALL == "WT");


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

RSALLSTRWTFORCSOCZ = ALLSTRFORCSOCZ(RSWTSTRcellssoc,:);

[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCSOCZ = RSALLSTRWTFORCSOCZ;
RSnewALLSTRWTFORCSOCZ(badSTRINF, :) = [];
newWTSTRsocidx = WTSTRsocidx;
newWTSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];



for a = 1:size(RSnewALLSTRWTFORCSOCZ,1)
    RSnewALLSTRWTFORCSOCZSM(a,:) = smoothdata(RSnewALLSTRWTFORCSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:)),nanstd(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCSOCZSM(find(newWTSTRsocidx==6),:),1)))); xlim([-2 6.95]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

WTSTRcellsobj = find(groupSTRforcALL == "WT");

%RSWTSTRcellsobj = find(ismember(WTSTRcellsobj,RSSTRcellsobj)==1);

RSWTSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250 & groupSTRforcALL == "WT");

% RSWTSTRcellsobj = find(groupSTRforcALL == "WT");


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

RSALLSTRWTFORCOBJZ = ALLSTRFORCOBJZ(RSWTSTRcellsobj,:);



% newmouseSTR = [newmouseSTRWT, newmouseSTRKO];
% 
% newmouseSTRRSWT = newmouseSTRWT(RSWTSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRWTFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRWTFORCOBJZ = RSALLSTRWTFORCOBJZ;
RSnewALLSTRWTFORCOBJZ(badSTRINF, :) = [];
newWTSTRobjidx = WTSTRobjidx;
newWTSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSWTnoinf = newmouseSTRRSWT;
% newmouseSTRRSWTnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRWTFORCOBJZ,1)
    RSnewALLSTRWTFORCOBJZSM(a,:) = smoothdata(RSnewALLSTRWTFORCOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==4),:),1)))); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==5),:),1)))); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:)),nanstd(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRWTFORCOBJZSM(find(newWTSTRobjidx==6),:),1)))); xlim([-2 6.95]);

%%

RSSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250);

KOSTRcellssoc = find(groupSTRforcALL == "KO");

%RSKOSTRcellssoc = find(ismember(KOSTRcellssoc,RSSTRcellssoc)==1);

RSKOSTRcellssoc = find(allforsocSTRwidths>550 & allforsocSTRwidths<1250 & groupSTRforcALL == "KO");

% RSKOSTRcellssoc = find(groupSTRforcALL == "KO");


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

RSALLSTRKOFORCSOCZ = ALLSTRFORCSOCZ(RSKOSTRcellssoc,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellssoc);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCSOCZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCSOCZ = RSALLSTRKOFORCSOCZ;
RSnewALLSTRKOFORCSOCZ(badSTRINF, :) = [];
newKOSTRsocidx = KOSTRsocidx;
newKOSTRsocidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOFORCSOCZ,1)
    RSnewALLSTRKOFORCSOCZSM(a,:) = smoothdata(RSnewALLSTRKOFORCSOCZ(a,:),'movmean',4);
end




% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLSTRFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLSTRFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,9);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,11);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:)),nanstd(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCSOCZSM(find(newKOSTRsocidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);


RSSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250);

KOSTRcellsobj = find(groupSTRforcALL == "KO");

%RSKOSTRcellsobj = find(ismember(KOSTRcellsobj,RSSTRcellsobj)==1);

RSKOSTRcellsobj = find(allforobjSTRwidths>550 & allforobjSTRwidths<1250 & groupSTRforcALL == "KO");

% RSKOSTRcellsobj = find(groupSTRforcALL == "KO");


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

RSALLSTRKOFORCOBJZ = ALLSTRFORCOBJZ(RSKOSTRcellsobj,:);
% 
% newmouseSTR = [newmouseSTRKO, newmouseSTRKO];
% 
% newmouseSTRRSKO = newmouseSTR(RSKOSTRcellsobj);


[badSTRINFr,badSTRINFc] = find(ismember(RSALLSTRKOFORCOBJZ,Inf));
badSTRINF = unique(badSTRINFr);
RSnewALLSTRKOFORCOBJZ = RSALLSTRKOFORCOBJZ;
RSnewALLSTRKOFORCOBJZ(badSTRINF, :) = [];
newKOSTRobjidx = KOSTRobjidx;
newKOSTRobjidx(badSTRINF, :) = [];
% newmouseSTRRSKOnoinf = newmouseSTRRSKO;
% newmouseSTRRSKOnoinf(badSTRINF) = [];


for a = 1:size(RSnewALLSTRKOFORCOBJZ,1)
    RSnewALLSTRKOFORCOBJZSM(a,:) = smoothdata(RSnewALLSTRKOFORCOBJZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLSTRFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLSTRFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLSTRFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(15); subplot(6,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(6,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(6,2,10);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==5),:),1))),'lineprops', 'r'); xlim([-2 6.95]);
subplot(6,2,12);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:)),nanstd(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:))/(sqrt(size(RSnewALLSTRKOFORCOBJZSM(find(newKOSTRobjidx==6),:),1))),'lineprops', 'r'); xlim([-2 6.95]);

%%
%% BLA



WTBLAcellssoc = find(groupBLAforcALL == "WT");

%RSWTBLAcellssoc = find(ismember(WTBLAcellssoc,RSBLAcellssoc)==1);

RSWTBLAcellssoc = find(groupBLAforcALL == "WT");

WTBLAsocidx = idxBLA(RSWTBLAcellssoc);


RSYWT = Y(RSWTBLAcellssoc,:);
figure;
plot(RSYWT(WTBLAsocidx==1,1),RSYWT(WTBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==2,1),RSYWT(WTBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAsocidx==3,1),RSYWT(WTBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAsocidx==4,1),RSYWT(WTBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAWTFORCSOCZ = ALLBLAFORCSOCZ(RSWTBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellssoc);




[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCSOCZ = RSALLBLAWTFORCSOCZ;
RSnewALLBLAWTFORCSOCZ(badBLAINF, :) = [];
newWTBLAsocidx = WTBLAsocidx;
newWTBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];


for a = 1:size(RSnewALLBLAWTFORCSOCZ,1)
    RSnewALLBLAWTFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAWTFORCSOCZ(a,:),'movmean',4);
end



% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(WTsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(WTsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(WTsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:)),nanstd(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCSOCZSM(find(newWTBLAsocidx==4),:),1)))); xlim([-2 6.95]);hold on;



WTBLAcellsobj = find(groupBLAforcALL == "WT");

%RSWTBLAcellsobj = find(ismember(WTBLAcellsobj,RSBLAcellsobj)==1);

RSWTBLAcellsobj = find(groupBLAforcALL == "WT");

WTBLAobjidx = idxBLA(RSWTBLAcellsobj);


RSYWT = Y(RSWTBLAcellsobj,:);
figure;
plot(RSYWT(WTBLAobjidx==1,1),RSYWT(WTBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==2,1),RSYWT(WTBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYWT(WTBLAobjidx==3,1),RSYWT(WTBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYWT(WTBLAobjidx==4,1),RSYWT(WTBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAWTFORCOBJZ = ALLBLAFORCOBJZ(RSWTBLAcellsobj,:);

% newmouseBLA = [newmouseBLAWT, newmouseBLAKO];
% 
% newmouseBLARSWT = newmouseBLAWT(RSWTBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAWTFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAWTFORCOBJZ = RSALLBLAWTFORCOBJZ;
RSnewALLBLAWTFORCOBJZ(badBLAINF, :) = [];
newWTBLAobjidx = WTBLAobjidx;
newWTBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSWTnoinf = newmouseBLARSWT;
% newmouseBLARSWTnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAWTFORCOBJZ,1)
    RSnewALLBLAWTFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAWTFORCOBJZ(a,:),'movmean',4);
end

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(WTobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(WTobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(WTobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==1),:),1)))); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==2),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==3),:),1)))); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:)),nanstd(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAWTFORCOBJZSM(find(newWTBLAobjidx==4),:),1)))); xlim([-2 6.95]);hold on;

%%


KOBLAcellssoc = find(groupBLAforcALL == "KO");

%RSKOBLAcellssoc = find(ismember(KOBLAcellssoc,RSBLAcellssoc)==1);

RSKOBLAcellssoc = find(groupBLAforcALL == "KO");

KOBLAsocidx = idxBLA(RSKOBLAcellssoc);


RSYKO = Y(RSKOBLAcellssoc,:);
figure;
plot(RSYKO(KOBLAsocidx==1,1),RSYKO(KOBLAsocidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==2,1),RSYKO(KOBLAsocidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAsocidx==3,1),RSYKO(KOBLAsocidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAsocidx==4,1),RSYKO(KOBLAsocidx==4,2),'k.','MarkerSize',12)

RSALLBLAKOFORCSOCZ = ALLBLAFORCSOCZ(RSKOBLAcellssoc,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellssoc);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCSOCZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCSOCZ = RSALLBLAKOFORCSOCZ;
RSnewALLBLAKOFORCSOCZ(badBLAINF, :) = [];
newKOBLAsocidx = KOBLAsocidx;
newKOBLAsocidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOFORCSOCZ,1)
    RSnewALLBLAKOFORCSOCZSM(a,:) = smoothdata(RSnewALLBLAKOFORCSOCZ(a,:),'movmean',4);
end

% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==1),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==1),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==2),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==2),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==3),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==3),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==4),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==4),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCSOCZ(find(KOsocidx==5),:)),nanstd(ALLBLAFORCSOCZ(find(KOsocidx==5),:))/(sqrt(size(ALLBLAFORCSOCZ(find(KOsocidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,1);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,3);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,5);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,7);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:)),nanstd(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCSOCZSM(find(newKOBLAsocidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;



KOBLAcellsobj = find(groupBLAforcALL == "KO");

%RSKOBLAcellsobj = find(ismember(KOBLAcellsobj,RSBLAcellsobj)==1);

RSKOBLAcellsobj = find(groupBLAforcALL == "KO");

KOBLAobjidx = idxBLA(RSKOBLAcellsobj);


RSYKO = Y(RSKOBLAcellsobj,:);
figure;
plot(RSYKO(KOBLAobjidx==1,1),RSYKO(KOBLAobjidx==1,2),'r.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==2,1),RSYKO(KOBLAobjidx==2,2),'b.','MarkerSize',12)
hold on; plot(RSYKO(KOBLAobjidx==3,1),RSYKO(KOBLAobjidx==3,2),'g.','MarkerSize',12)
hold on
plot(RSYKO(KOBLAobjidx==4,1),RSYKO(KOBLAobjidx==4,2),'k.','MarkerSize',12)


RSALLBLAKOFORCOBJZ = ALLBLAFORCOBJZ(RSKOBLAcellsobj,:);
% 
% newmouseBLA = [newmouseBLAKO, newmouseBLAKO];
% 
% newmouseBLARSKO = newmouseBLA(RSKOBLAcellsobj);


[badBLAINFr,badBLAINFc] = find(ismember(RSALLBLAKOFORCOBJZ,Inf));
badBLAINF = unique(badBLAINFr);
RSnewALLBLAKOFORCOBJZ = RSALLBLAKOFORCOBJZ;
RSnewALLBLAKOFORCOBJZ(badBLAINF, :) = [];
newKOBLAobjidx = KOBLAobjidx;
newKOBLAobjidx(badBLAINF, :) = [];
% newmouseBLARSKOnoinf = newmouseBLARSKO;
% newmouseBLARSKOnoinf(badBLAINF) = [];

for a = 1:size(RSnewALLBLAKOFORCOBJZ,1)
    RSnewALLBLAKOFORCOBJZSM(a,:) = smoothdata(RSnewALLBLAKOFORCOBJZ(a,:),'movmean',4);
end


% figure; shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==1),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==1),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==1),:),1)))); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==2),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==2),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==2),:),1))), 'lineprops', 'r'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==3),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==3),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==3),:),1))),'lineprops', 'b'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==4),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==4),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==4),:),1))),'lineprops', 'g'); hold on;
% shadedErrorBar(-2:0.05:7,nanmean(ALLBLAFORCOBJZ(find(KOobjidx==5),:)),nanstd(ALLBLAFORCOBJZ(find(KOobjidx==5),:))/(sqrt(size(ALLBLAFORCOBJZ(find(KOobjidx==5),:),1))),'lineprops', 'c'); 

figure(13); subplot(4,2,2);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==1),:),1))),'lineprops', 'r'); xlim([-2 6.95]); hold on;
subplot(4,2,4);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==2),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,6);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==3),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;
subplot(4,2,8);shadedErrorBar(-2:0.05:7,nanmean(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:)),nanstd(RSnewALLBLAKOFORCOBJZSM(find(newKOBLAobjidx==4),:))/(sqrt(size(RSnewALLBLAKOFORCOBJZ(find(newKOBLAobjidx==4),:),1))),'lineprops', 'r'); xlim([-2 6.95]);hold on;

