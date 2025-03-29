%% load the data




%%



%% Create nonsorted cells


WTS1cellsFORCALLNONSORT = [];

WTSTRcellsFORCALLNONSORT = [];

WTBLAcellsFORCALLNONSORT = [];

KOS1cellsFORCALLNONSORT = [];

KOSTRcellsFORCALLNONSORT = [];

KOBLAcellsFORCALLNONSORT = [];

%
%% FORCED SOCIAL AND OBJECT TOUCH

%% load the data


%% Make variables for all FIRING (no cell splits)

%%
allforcALLS1WTALL = [];
allforcALLS1WTZALL =[];


allforcALLSTRWTALL = [];
allforcALLSTRWTZALL =[];


allforcALLBLAWTALL = [];
allforcALLBLAWTZALL =[];

%%
allforcsocialS1WTALL = [];
allforcsocialS1WTZALL =[];


allforcsocialSTRWTALL = [];
allforcsocialSTRWTZALL =[];


allforcsocialBLAWTALL = [];
allforcsocialBLAWTZALL =[];

allforcobjS1WTALL = [];
allforcobjS1WTZALL =[];


allforcobjSTRWTALL = [];
allforcobjSTRWTZALL =[];


allforcobjBLAWTALL = [];
allforcobjBLAWTZALL =[];


%%
allforcALLS1KOALL = [];
allforcALLS1KOZALL =[];


allforcALLSTRKOALL = [];
allforcALLSTRKOZALL =[];


allforcALLBLAKOALL = [];
allforcALLBLAKOZALL =[];

%%

allforcsocialS1KOALL = [];
allforcsocialS1KOZALL =[];


allforcsocialSTRKOALL = [];
allforcsocialSTRKOZALL =[];


allforcsocialBLAKOALL = [];
allforcsocialBLAKOZALL =[];

allforcobjS1KOALL = [];
allforcobjS1KOZALL =[];


allforcobjSTRKOALL = [];
allforcobjSTRKOZALL =[];


allforcobjBLAKOALL = [];
allforcobjBLAKOZALL =[];


%%

allforcsocialS1KOMODInd = [];

allforcsocialSTRKOMODInd = [];

allforcsocialBLAKOMODInd = [];

allforcobjS1KOMODInd = [];

allforcobjSTRKOMODInd = [];

allforcobjBLAKOMODInd = [];


allforcsocialS1WTMODInd = [];

allforcsocialSTRWTMODInd = [];

allforcsocialBLAWTMODInd = [];

allforcobjS1WTMODInd = [];

allforcobjSTRWTMODInd = [];

allforcobjBLAWTMODInd = [];

%% NEW MOD INDEX 

allforcsocialS1KOMODIndSTIM = [];

allforcsocialSTRKOMODIndSTIM = [];

allforcsocialBLAKOMODIndSTIM = [];

allforcobjS1KOMODIndSTIM = [];

allforcobjSTRKOMODIndSTIM = [];

allforcobjBLAKOMODIndSTIM = [];


allforcsocialS1WTMODIndSTIM = [];

allforcsocialSTRWTMODIndSTIM = [];

allforcsocialBLAWTMODIndSTIM = [];

allforcobjS1WTMODIndSTIM = [];

allforcobjSTRWTMODIndSTIM = [];

allforcobjBLAWTMODIndSTIM = [];


allforcsocialS1KOMODIndSHORTSTIM = [];

allforcsocialSTRKOMODIndSHORTSTIM = [];

allforcsocialBLAKOMODIndSHORTSTIM = [];

allforcobjS1KOMODIndSHORTSTIM = [];

allforcobjSTRKOMODIndSHORTSTIM = [];

allforcobjBLAKOMODIndSHORTSTIM = [];


allforcsocialS1WTMODIndSHORTSTIM = [];

allforcsocialSTRWTMODIndSHORTSTIM = [];

allforcsocialBLAWTMODIndSHORTSTIM = [];

allforcobjS1WTMODIndSHORTSTIM = [];

allforcobjSTRWTMODIndSHORTSTIM = [];

allforcobjBLAWTMODIndSHORTSTIM = [];

allforcsocialS1KOMODIndPLAT = [];

allforcsocialSTRKOMODIndPLAT = [];

allforcsocialBLAKOMODIndPLAT = [];

allforcobjS1KOMODIndPLAT = [];

allforcobjSTRKOMODIndPLAT = [];

allforcobjBLAKOMODIndPLAT = [];


allforcsocialS1WTMODIndPLAT = [];

allforcsocialSTRWTMODIndPLAT = [];

allforcsocialBLAWTMODIndPLAT = [];

allforcobjS1WTMODIndPLAT = [];

allforcobjSTRWTMODIndPLAT = [];

allforcobjBLAWTMODIndPLAT = [];

%% NEW AUC VALUES

allforcS1KOAUCSTIM = [];

allforcSTRKOAUCSTIM = [];

allforcBLAKOAUCSTIM = [];



allforcS1WTAUCSTIM = [];

allforcSTRWTAUCSTIM = [];

allforcBLAWTAUCSTIM = [];



allforcS1KOAUCSHORTSTIM = [];

allforcSTRKOAUCSHORTSTIM = [];

allforcBLAKOAUCSHORTSTIM = [];


allforcS1WTAUCSHORTSTIM = [];

allforcSTRWTAUCSHORTSTIM = [];

allforcBLAWTAUCSHORTSTIM = [];



allforcS1KOAUCPLAT = [];

allforcSTRKOAUCPLAT = [];

allforcBLAKOAUCPLAT = [];



allforcS1WTAUCPLAT = [];

allforcSTRWTAUCPLAT = [];

allforcBLAWTAUCPLAT = [];


%%


%% save to mouse data and thena append
%%%%


mousedata = allFiringProperties.COMBINEDcellfiring.S1FORCALLHz;

allforcALLS1WTALL = [allforcALLS1WTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.S1FORCALLZ;

allforcALLS1WTZALL = [allforcALLS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.COMBINEDcellfiring.STRFORCALLHz;

allforcALLSTRWTALL = [allforcALLSTRWTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.STRFORCALLZ;

allforcALLSTRWTZALL = [allforcALLSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.COMBINEDcellfiring.BLAFORCALLHz;

allforcALLBLAWTALL = [allforcALLBLAWTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.BLAFORCALLZ;

allforcALLBLAWTZALL = [allforcALLBLAWTZALL; mousedata];


%%
% SOCIAL

mousedata = allFiringProperties.allcellfiring.S1FORCMOHz;

allforcsocialS1WTALL = [allforcsocialS1WTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1FORCMOZ;

allforcsocialS1WTZALL = [allforcsocialS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRFORCMOHz;

allforcsocialSTRWTALL = [allforcsocialSTRWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRFORCMOZ;

allforcsocialSTRWTZALL = [allforcsocialSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAFORCMOHz;

allforcsocialBLAWTALL = [allforcsocialBLAWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAFORCMOZ;

allforcsocialBLAWTZALL = [allforcsocialBLAWTZALL; mousedata];

% OBJECT

mousedata = allFiringProperties.allcellfiring.S1FORCOBJHz;

allforcobjS1WTALL = [allforcobjS1WTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1FORCOBJZ;

allforcobjS1WTZALL = [allforcobjS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRFORCOBJHz;

allforcobjSTRWTALL = [allforcobjSTRWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRFORCOBJZ;

allforcobjSTRWTZALL = [allforcobjSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAFORCOBJHz;

allforcobjBLAWTALL = [allforcobjBLAWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAFORCOBJZ;

allforcobjBLAWTZALL = [allforcobjBLAWTZALL; mousedata];

%%
WTS1cellsFORCALLNONSORT = [WTS1cellsFORCALLNONSORT; allFiringProperties.NONsortedcellsALL.S1cells.S1cellsFORCALL];

WTSTRcellsFORCALLNONSORT = [WTSTRcellsFORCALLNONSORT;allFiringProperties.NONsortedcellsALL.strcells.strcellsFORCALL];

WTBLAcellsFORCALLNONSORT = [WTBLAcellsFORCALLNONSORT;allFiringProperties.NONsortedcellsALL.blacells.blacellsFORCALL];

%% Get modulation indices

moddata = allFiringProperties.ModulationIndex.S1modindexFORCMO;

allforcsocialS1WTMODInd = [allforcsocialS1WTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexFORCMO;

allforcsocialSTRWTMODInd = [allforcsocialSTRWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexFORCMO;

allforcsocialBLAWTMODInd = [allforcsocialBLAWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.S1modindexFORCOBJ;

allforcobjS1WTMODInd = [allforcobjS1WTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexFORCOBJ;

allforcobjSTRWTMODInd = [allforcobjSTRWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexFORCOBJ;

allforcobjBLAWTMODInd = [allforcobjBLAWTMODInd, moddata];


%
%
%
%
%
%% All modulation indices for WT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFORCMO;

allforcsocialS1WTMODIndSTIM = [allforcsocialS1WTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFORCMO;

allforcsocialSTRWTMODIndSTIM = [allforcsocialSTRWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCMO;

allforcsocialBLAWTMODIndSTIM = [allforcsocialBLAWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFORCOBJ;

allforcobjS1WTMODIndSTIM = [allforcobjS1WTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFORCOBJ;

allforcobjSTRWTMODIndSTIM = [allforcobjSTRWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCOBJ;

allforcobjBLAWTMODIndSTIM = [allforcobjBLAWTMODIndSTIM, moddata];

%% Get modulation indices for SHORTSTIM

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCMO;

allforcsocialS1WTMODIndSHORTSTIM = [allforcsocialS1WTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCMO;

allforcsocialSTRWTMODIndSHORTSTIM = [allforcsocialSTRWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCMO;

allforcsocialBLAWTMODIndSHORTSTIM = [allforcsocialBLAWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCOBJ;

allforcobjS1WTMODIndSHORTSTIM = [allforcobjS1WTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCOBJ;

allforcobjSTRWTMODIndSHORTSTIM = [allforcobjSTRWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCOBJ;

allforcobjBLAWTMODIndSHORTSTIM = [allforcobjBLAWTMODIndSHORTSTIM, moddata];

%% Get modulation indices for PLAT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCMO;

allforcsocialS1WTMODIndPLAT = [allforcsocialS1WTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCMO;

allforcsocialSTRWTMODIndPLAT = [allforcsocialSTRWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCMO;

allforcsocialBLAWTMODIndPLAT = [allforcsocialBLAWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCOBJ;

allforcobjS1WTMODIndPLAT = [allforcobjS1WTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCOBJ;

allforcobjSTRWTMODIndPLAT = [allforcobjSTRWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCOBJ;

allforcobjBLAWTMODIndPLAT = [allforcobjBLAWTMODIndPLAT, moddata];


%% All modulation indices for STIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSTIM;

allforcS1WTAUCSTIM = [allforcS1WTAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSTIM;

allforcSTRWTAUCSTIM = [allforcSTRWTAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSTIM;

allforcBLAWTAUCSTIM = [allforcBLAWTAUCSTIM, aucdata];

%% Get modulation indices for SHORTSTIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSHORTSTIM;

allforcS1WTAUCSHORTSTIM = [allforcS1WTAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSHORTSTIM;

allforcSTRWTAUCSHORTSTIM = [allforcSTRWTAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSHORTSTIM;

allforcBLAWTAUCSHORTSTIM = [allforcBLAWTAUCSHORTSTIM, aucdata];

%% Get modulation indices for PLATFORM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcPLATFORM;

allforcS1WTAUCPLAT = [allforcS1WTAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcPLATFORM;

allforcSTRWTAUCPLAT = [allforcSTRWTAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcPLATFORM;

allforcBLAWTAUCPLAT = [allforcBLAWTAUCPLAT, aucdata];


%%
%
%
%
%


%
%%
%%
%
%%
%%

mousedata = allFiringProperties.COMBINEDcellfiring.S1FORCALLHz;

allforcALLS1KOALL = [allforcALLS1KOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.S1FORCALLZ;

allforcALLS1KOZALL = [allforcALLS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.COMBINEDcellfiring.STRFORCALLHz;

allforcALLSTRKOALL = [allforcALLSTRKOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.STRFORCALLZ;

allforcALLSTRKOZALL = [allforcALLSTRKOZALL; mousedata];


%
%
%
% BLA

mousedata = allFiringProperties.COMBINEDcellfiring.BLAFORCALLHz;

allforcALLBLAKOALL = [allforcALLBLAKOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.BLAFORCALLZ;

allforcALLBLAKOZALL = [allforcALLBLAKOZALL; mousedata];


%%

KOS1cellsFORCALLNONSORT = [KOS1cellsFORCALLNONSORT; allFiringProperties.NONsortedcellsALL.S1cells.S1cellsFORCALL];

KOSTRcellsFORCALLNONSORT = [KOSTRcellsFORCALLNONSORT;allFiringProperties.NONsortedcellsALL.strcells.strcellsFORCALL];

KOBLAcellsFORCALLNONSORT = [KOBLAcellsFORCALLNONSORT;allFiringProperties.NONsortedcellsALL.blacells.blacellsFORCALL];

%%

%%
% SOCIAL

mousedata = allFiringProperties.allcellfiring.S1FORCMOHz;

allforcsocialS1KOALL = [allforcsocialS1KOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1FORCMOZ;

allforcsocialS1KOZALL = [allforcsocialS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRFORCMOHz;

allforcsocialSTRKOALL = [allforcsocialSTRKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRFORCMOZ;

allforcsocialSTRKOZALL = [allforcsocialSTRKOZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAFORCMOHz;

allforcsocialBLAKOALL = [allforcsocialBLAKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAFORCMOZ;

allforcsocialBLAKOZALL = [allforcsocialBLAKOZALL; mousedata];

% OBJECT

mousedata = allFiringProperties.allcellfiring.S1FORCOBJHz;

allforcobjS1KOALL = [allforcobjS1KOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1FORCOBJZ;

allforcobjS1KOZALL = [allforcobjS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRFORCOBJHz;

allforcobjSTRKOALL = [allforcobjSTRKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRFORCOBJZ;

allforcobjSTRKOZALL = [allforcobjSTRKOZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAFORCOBJHz;

allforcobjBLAKOALL = [allforcobjBLAKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAFORCOBJZ;

allforcobjBLAKOZALL = [allforcobjBLAKOZALL; mousedata];

%%

%% Get modulation indices

moddata = allFiringProperties.ModulationIndex.S1modindexFORCMO;

allforcsocialS1KOMODInd = [allforcsocialS1KOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexFORCMO;

allforcsocialSTRKOMODInd = [allforcsocialSTRKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexFORCMO;

allforcsocialBLAKOMODInd = [allforcsocialBLAKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.S1modindexFORCOBJ;

allforcobjS1KOMODInd = [allforcobjS1KOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexFORCOBJ;

allforcobjSTRKOMODInd = [allforcobjSTRKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexFORCOBJ;

allforcobjBLAKOMODInd = [allforcobjBLAKOMODInd, moddata];

%
%
%
%
%
%
%%

%% All modulation indices for KO

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFORCMO;

allforcsocialS1KOMODIndSTIM = [allforcsocialS1KOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFORCMO;

allforcsocialSTRKOMODIndSTIM = [allforcsocialSTRKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCMO;

allforcsocialBLAKOMODIndSTIM = [allforcsocialBLAKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFORCOBJ;

allforcobjS1KOMODIndSTIM = [allforcobjS1KOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFORCOBJ;

allforcobjSTRKOMODIndSTIM = [allforcobjSTRKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFORCOBJ;

allforcobjBLAKOMODIndSTIM = [allforcobjBLAKOMODIndSTIM, moddata];

%% Get modulation indices for SHORTSTIM

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCMO;

allforcsocialS1KOMODIndSHORTSTIM = [allforcsocialS1KOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCMO;

allforcsocialSTRKOMODIndSHORTSTIM = [allforcsocialSTRKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCMO;

allforcsocialBLAKOMODIndSHORTSTIM = [allforcsocialBLAKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMFORCOBJ;

allforcobjS1KOMODIndSHORTSTIM = [allforcobjS1KOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMFORCOBJ;

allforcobjSTRKOMODIndSHORTSTIM = [allforcobjSTRKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMFORCOBJ;

allforcobjBLAKOMODIndSHORTSTIM = [allforcobjBLAKOMODIndSHORTSTIM, moddata];

%% Get modulation indices for PLAT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCMO;

allforcsocialS1KOMODIndPLAT = [allforcsocialS1KOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCMO;

allforcsocialSTRKOMODIndPLAT = [allforcsocialSTRKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCMO;

allforcsocialBLAKOMODIndPLAT = [allforcsocialBLAKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATFORCOBJ;

allforcobjS1KOMODIndPLAT = [allforcobjS1KOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATFORCOBJ;

allforcobjSTRKOMODIndPLAT = [allforcobjSTRKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATFORCOBJ;

allforcobjBLAKOMODIndPLAT = [allforcobjBLAKOMODIndPLAT, moddata];
%%

%% All modulation indices for STIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSTIM;

allforcS1KOAUCSTIM = [allforcS1KOAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSTIM;

allforcSTRKOAUCSTIM = [allforcSTRKOAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSTIM;

allforcBLAKOAUCSTIM = [allforcBLAKOAUCSTIM, aucdata];

%% Get modulation indices for SHORTSTIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcSHORTSTIM;

allforcS1KOAUCSHORTSTIM = [allforcS1KOAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcSHORTSTIM;

allforcSTRKOAUCSHORTSTIM = [allforcSTRKOAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcSHORTSTIM;

allforcBLAKOAUCSHORTSTIM = [allforcBLAKOAUCSHORTSTIM, aucdata];


%% Get modulation indices for PLATFORM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCForcPLATFORM;

allforcS1KOAUCPLAT = [allforcS1KOAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCForcPLATFORM;

allforcSTRKOAUCPLAT = [allforcSTRKOAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCForcPLATFORM;

allforcBLAKOAUCPLAT = [allforcBLAKOAUCPLAT, aucdata];

%%


allforcsocialS1WTMODIndFIRST10 = [];

allforcsocialSTRWTMODIndFIRST10 = [];

allforcsocialBLAWTMODIndFIRST10 = [];

allforcobjS1WTMODIndFIRST10 = [];

allforcobjSTRWTMODIndFIRST10 = [];

allforcobjBLAWTMODIndFIRST10 = [];

%%

allforcsocialS1KOMODIndFIRST10 = [];

allforcsocialSTRKOMODIndFIRST10 = [];

allforcsocialBLAKOMODIndFIRST10 = [];

allforcobjS1KOMODIndFIRST10 = [];

allforcobjSTRKOMODIndFIRST10 = [];

allforcobjBLAKOMODIndFIRST10 = [];

%%


moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCOBJ;

allforcobjS1WTMODIndFIRST10 = [allforcobjS1WTMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCOBJ;

allforcobjSTRWTMODIndFIRST10 = [allforcobjSTRWTMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCOBJ;

allforcobjBLAWTMODIndFIRST10 = [allforcobjBLAWTMODIndFIRST10, moddata];



moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCMO;

allforcsocialS1WTMODIndFIRST10 = [allforcsocialS1WTMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCMO;

allforcsocialSTRWTMODIndFIRST10 = [allforcsocialSTRWTMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCMO;

allforcsocialBLAWTMODIndFIRST10 = [allforcsocialBLAWTMODIndFIRST10, moddata];

%%

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCOBJ;

allforcobjS1KOMODIndFIRST10 = [allforcobjS1KOMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCOBJ;

allforcobjSTRKOMODIndFIRST10 = [allforcobjSTRKOMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCOBJ;

allforcobjBLAKOMODIndFIRST10 = [allforcobjBLAKOMODIndFIRST10, moddata];


moddata = allFiringProperties.ModulationIndexDIFF.S1modindexFIRST10FORCMO;

allforcsocialS1KOMODIndFIRST10 = [allforcsocialS1KOMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexFIRST10FORCMO;

allforcsocialSTRKOMODIndFIRST10 = [allforcsocialSTRKOMODIndFIRST10, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexFIRST10FORCMO;

allforcsocialBLAKOMODIndFIRST10 = [allforcsocialBLAKOMODIndFIRST10, moddata];