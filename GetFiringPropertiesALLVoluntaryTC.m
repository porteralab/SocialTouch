%% load the data




%%



%% Create nonsorted cells


WTS1cellsVOLALLNONSORT = [];

WTSTRcellsVOLALLNONSORT = [];

WTBLAcellsVOLALLNONSORT = [];

KOS1cellsVOLALLNONSORT = [];

KOSTRcellsVOLALLNONSORT = [];

KOBLAcellsVOLALLNONSORT = [];

%
%% VOLED SOCIAL AND OBJECT TOUCH

%% load the data


%% Make variables for all FIRING (no cell splits)

%%
allvolALLS1WTALL = [];
allvolALLS1WTZALL =[];


allvolALLSTRWTALL = [];
allvolALLSTRWTZALL =[];


allvolALLBLAWTALL = [];
allvolALLBLAWTZALL =[];

%%
allvolsocialS1WTALL = [];
allvolsocialS1WTZALL =[];


allvolsocialSTRWTALL = [];
allvolsocialSTRWTZALL =[];


allvolsocialBLAWTALL = [];
allvolsocialBLAWTZALL =[];

allvolobjS1WTALL = [];
allvolobjS1WTZALL =[];


allvolobjSTRWTALL = [];
allvolobjSTRWTZALL =[];


allvolobjBLAWTALL = [];
allvolobjBLAWTZALL =[];


%%
allvolALLS1KOALL = [];
allvolALLS1KOZALL =[];


allvolALLSTRKOALL = [];
allvolALLSTRKOZALL =[];


allvolALLBLAKOALL = [];
allvolALLBLAKOZALL =[];

%%

allvolsocialS1KOALL = [];
allvolsocialS1KOZALL =[];


allvolsocialSTRKOALL = [];
allvolsocialSTRKOZALL =[];


allvolsocialBLAKOALL = [];
allvolsocialBLAKOZALL =[];

allvolobjS1KOALL = [];
allvolobjS1KOZALL =[];


allvolobjSTRKOALL = [];
allvolobjSTRKOZALL =[];


allvolobjBLAKOALL = [];
allvolobjBLAKOZALL =[];


%%

allvolsocialS1KOMODInd = [];

allvolsocialSTRKOMODInd = [];

allvolsocialBLAKOMODInd = [];

allvolobjS1KOMODInd = [];

allvolobjSTRKOMODInd = [];

allvolobjBLAKOMODInd = [];


allvolsocialS1WTMODInd = [];

allvolsocialSTRWTMODInd = [];

allvolsocialBLAWTMODInd = [];

allvolobjS1WTMODInd = [];

allvolobjSTRWTMODInd = [];

allvolobjBLAWTMODInd = [];

%% NEW MOD INDEX 

allvolsocialS1KOMODIndSTIM = [];

allvolsocialSTRKOMODIndSTIM = [];

allvolsocialBLAKOMODIndSTIM = [];

allvolobjS1KOMODIndSTIM = [];

allvolobjSTRKOMODIndSTIM = [];

allvolobjBLAKOMODIndSTIM = [];


allvolsocialS1WTMODIndSTIM = [];

allvolsocialSTRWTMODIndSTIM = [];

allvolsocialBLAWTMODIndSTIM = [];

allvolobjS1WTMODIndSTIM = [];

allvolobjSTRWTMODIndSTIM = [];

allvolobjBLAWTMODIndSTIM = [];


allvolsocialS1KOMODIndSHORTSTIM = [];

allvolsocialSTRKOMODIndSHORTSTIM = [];

allvolsocialBLAKOMODIndSHORTSTIM = [];

allvolobjS1KOMODIndSHORTSTIM = [];

allvolobjSTRKOMODIndSHORTSTIM = [];

allvolobjBLAKOMODIndSHORTSTIM = [];


allvolsocialS1WTMODIndSHORTSTIM = [];

allvolsocialSTRWTMODIndSHORTSTIM = [];

allvolsocialBLAWTMODIndSHORTSTIM = [];

allvolobjS1WTMODIndSHORTSTIM = [];

allvolobjSTRWTMODIndSHORTSTIM = [];

allvolobjBLAWTMODIndSHORTSTIM = [];

allvolsocialS1KOMODIndPLAT = [];

allvolsocialSTRKOMODIndPLAT = [];

allvolsocialBLAKOMODIndPLAT = [];

allvolobjS1KOMODIndPLAT = [];

allvolobjSTRKOMODIndPLAT = [];

allvolobjBLAKOMODIndPLAT = [];


allvolsocialS1WTMODIndPLAT = [];

allvolsocialSTRWTMODIndPLAT = [];

allvolsocialBLAWTMODIndPLAT = [];

allvolobjS1WTMODIndPLAT = [];

allvolobjSTRWTMODIndPLAT = [];

allvolobjBLAWTMODIndPLAT = [];

%% NEW AUC VALUES

allvolS1KOAUCSTIM = [];

allvolSTRKOAUCSTIM = [];

allvolBLAKOAUCSTIM = [];



allvolS1WTAUCSTIM = [];

allvolSTRWTAUCSTIM = [];

allvolBLAWTAUCSTIM = [];



allvolS1KOAUCSHORTSTIM = [];

allvolSTRKOAUCSHORTSTIM = [];

allvolBLAKOAUCSHORTSTIM = [];


allvolS1WTAUCSHORTSTIM = [];

allvolSTRWTAUCSHORTSTIM = [];

allvolBLAWTAUCSHORTSTIM = [];



allvolS1KOAUCPLAT = [];

allvolSTRKOAUCPLAT = [];

allvolBLAKOAUCPLAT = [];



allvolS1WTAUCPLAT = [];

allvolSTRWTAUCPLAT = [];

allvolBLAWTAUCPLAT = [];


%%


%% save to mouse data and thena append
%%%%


mousedata = allFiringProperties.COMBINEDcellfiring.S1VOLALLHz;

allvolALLS1WTALL = [allvolALLS1WTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.S1VOLALLZ;

allvolALLS1WTZALL = [allvolALLS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.COMBINEDcellfiring.STRVOLALLHz;

allvolALLSTRWTALL = [allvolALLSTRWTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.STRVOLALLZ;

allvolALLSTRWTZALL = [allvolALLSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.COMBINEDcellfiring.BLAVOLALLHz;

allvolALLBLAWTALL = [allvolALLBLAWTALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.BLAVOLALLZ;

allvolALLBLAWTZALL = [allvolALLBLAWTZALL; mousedata];


%%
% SOCIAL

mousedata = allFiringProperties.allcellfiring.S1VOLMOHz;

allvolsocialS1WTALL = [allvolsocialS1WTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1VOLMOZ;

allvolsocialS1WTZALL = [allvolsocialS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRVOLMOHz;

allvolsocialSTRWTALL = [allvolsocialSTRWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRVOLMOZ;

allvolsocialSTRWTZALL = [allvolsocialSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAVOLMOHz;

allvolsocialBLAWTALL = [allvolsocialBLAWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAVOLMOZ;

allvolsocialBLAWTZALL = [allvolsocialBLAWTZALL; mousedata];

% OBJECT

mousedata = allFiringProperties.allcellfiring.S1VOLOBJHz;

allvolobjS1WTALL = [allvolobjS1WTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1VOLOBJZ;

allvolobjS1WTZALL = [allvolobjS1WTZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRVOLOBJHz;

allvolobjSTRWTALL = [allvolobjSTRWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRVOLOBJZ;

allvolobjSTRWTZALL = [allvolobjSTRWTZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAVOLOBJHz;

allvolobjBLAWTALL = [allvolobjBLAWTALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAVOLOBJZ;

allvolobjBLAWTZALL = [allvolobjBLAWTZALL; mousedata];

%%
WTS1cellsVOLALLNONSORT = [WTS1cellsVOLALLNONSORT; allFiringProperties.NONsortedcellsALL.S1cells.S1cellsVOLALL];

WTSTRcellsVOLALLNONSORT = [WTSTRcellsVOLALLNONSORT;allFiringProperties.NONsortedcellsALL.strcells.strcellsVOLALL];

WTBLAcellsVOLALLNONSORT = [WTBLAcellsVOLALLNONSORT;allFiringProperties.NONsortedcellsALL.blacells.blacellsVOLALL];

%% Get modulation indices

moddata = allFiringProperties.ModulationIndex.S1modindexVOLMO;

allvolsocialS1WTMODInd = [allvolsocialS1WTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexVOLMO;

allvolsocialSTRWTMODInd = [allvolsocialSTRWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexVOLMO;

allvolsocialBLAWTMODInd = [allvolsocialBLAWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.S1modindexVOLOBJ;

allvolobjS1WTMODInd = [allvolobjS1WTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexVOLOBJ;

allvolobjSTRWTMODInd = [allvolobjSTRWTMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexVOLOBJ;

allvolobjBLAWTMODInd = [allvolobjBLAWTMODInd, moddata];


%
%
%
%
%
%% All modulation indices for WT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexVOLMO;

allvolsocialS1WTMODIndSTIM = [allvolsocialS1WTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexVOLMO;

allvolsocialSTRWTMODIndSTIM = [allvolsocialSTRWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLMO;

allvolsocialBLAWTMODIndSTIM = [allvolsocialBLAWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexVOLOBJ;

allvolobjS1WTMODIndSTIM = [allvolobjS1WTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexVOLOBJ;

allvolobjSTRWTMODIndSTIM = [allvolobjSTRWTMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLOBJ;

allvolobjBLAWTMODIndSTIM = [allvolobjBLAWTMODIndSTIM, moddata];

%% Get modulation indices for SHORTSTIM

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLMO;

allvolsocialS1WTMODIndSHORTSTIM = [allvolsocialS1WTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLMO;

allvolsocialSTRWTMODIndSHORTSTIM = [allvolsocialSTRWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLMO;

allvolsocialBLAWTMODIndSHORTSTIM = [allvolsocialBLAWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLOBJ;

allvolobjS1WTMODIndSHORTSTIM = [allvolobjS1WTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLOBJ;

allvolobjSTRWTMODIndSHORTSTIM = [allvolobjSTRWTMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLOBJ;

allvolobjBLAWTMODIndSHORTSTIM = [allvolobjBLAWTMODIndSHORTSTIM, moddata];

%% Get modulation indices for PLAT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLMO;

allvolsocialS1WTMODIndPLAT = [allvolsocialS1WTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLMO;

allvolsocialSTRWTMODIndPLAT = [allvolsocialSTRWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLMO;

allvolsocialBLAWTMODIndPLAT = [allvolsocialBLAWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLOBJ;

allvolobjS1WTMODIndPLAT = [allvolobjS1WTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLOBJ;

allvolobjSTRWTMODIndPLAT = [allvolobjSTRWTMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLOBJ;

allvolobjBLAWTMODIndPLAT = [allvolobjBLAWTMODIndPLAT, moddata];


%% All modulation indices for STIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSTIM;

allvolS1WTAUCSTIM = [allvolS1WTAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSTIM;

allvolSTRWTAUCSTIM = [allvolSTRWTAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSTIM;

allvolBLAWTAUCSTIM = [allvolBLAWTAUCSTIM, aucdata];

%% Get modulation indices for SHORTSTIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSHORTSTIM;

allvolS1WTAUCSHORTSTIM = [allvolS1WTAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSHORTSTIM;

allvolSTRWTAUCSHORTSTIM = [allvolSTRWTAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSHORTSTIM;

allvolBLAWTAUCSHORTSTIM = [allvolBLAWTAUCSHORTSTIM, aucdata];

%% Get modulation indices for PLATFORM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolPLATFORM;

allvolS1WTAUCPLAT = [allvolS1WTAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolPLATFORM;

allvolSTRWTAUCPLAT = [allvolSTRWTAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolPLATFORM;

allvolBLAWTAUCPLAT = [allvolBLAWTAUCPLAT, aucdata];


%%
%
%
%
%
%%
%%

mousedata = allFiringProperties.COMBINEDcellfiring.S1VOLALLHz;

allvolALLS1KOALL = [allvolALLS1KOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.S1VOLALLZ;

allvolALLS1KOZALL = [allvolALLS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.COMBINEDcellfiring.STRVOLALLHz;

allvolALLSTRKOALL = [allvolALLSTRKOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.STRVOLALLZ;

allvolALLSTRKOZALL = [allvolALLSTRKOZALL; mousedata];


%
%
%
% BLA

mousedata = allFiringProperties.COMBINEDcellfiring.BLAVOLALLHz;

allvolALLBLAKOALL = [allvolALLBLAKOALL; mousedata];


mousedata = allFiringProperties.COMBINEDcellfiring.BLAVOLALLZ;

allvolALLBLAKOZALL = [allvolALLBLAKOZALL; mousedata];


%%

KOS1cellsVOLALLNONSORT = [KOS1cellsVOLALLNONSORT; allFiringProperties.NONsortedcellsALL.S1cells.S1cellsVOLALL];

KOSTRcellsVOLALLNONSORT = [KOSTRcellsVOLALLNONSORT;allFiringProperties.NONsortedcellsALL.strcells.strcellsVOLALL];

KOBLAcellsVOLALLNONSORT = [KOBLAcellsVOLALLNONSORT;allFiringProperties.NONsortedcellsALL.blacells.blacellsVOLALL];

%%

%%
% SOCIAL

mousedata = allFiringProperties.allcellfiring.S1VOLMOHz;

allvolsocialS1KOALL = [allvolsocialS1KOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1VOLMOZ;

allvolsocialS1KOZALL = [allvolsocialS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRVOLMOHz;

allvolsocialSTRKOALL = [allvolsocialSTRKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRVOLMOZ;

allvolsocialSTRKOZALL = [allvolsocialSTRKOZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAVOLMOHz;

allvolsocialBLAKOALL = [allvolsocialBLAKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAVOLMOZ;

allvolsocialBLAKOZALL = [allvolsocialBLAKOZALL; mousedata];

% OBJECT

mousedata = allFiringProperties.allcellfiring.S1VOLOBJHz;

allvolobjS1KOALL = [allvolobjS1KOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.S1VOLOBJZ;

allvolobjS1KOZALL = [allvolobjS1KOZALL; mousedata];

%
%
% Striatum

mousedata = allFiringProperties.allcellfiring.STRVOLOBJHz;

allvolobjSTRKOALL = [allvolobjSTRKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.STRVOLOBJZ;

allvolobjSTRKOZALL = [allvolobjSTRKOZALL; mousedata];

%
%
%
% BLA

mousedata = allFiringProperties.allcellfiring.BLAVOLOBJHz;

allvolobjBLAKOALL = [allvolobjBLAKOALL; mousedata];


mousedata = allFiringProperties.allcellfiring.BLAVOLOBJZ;

allvolobjBLAKOZALL = [allvolobjBLAKOZALL; mousedata];

%%

%% Get modulation indices

moddata = allFiringProperties.ModulationIndex.S1modindexVOLMO;

allvolsocialS1KOMODInd = [allvolsocialS1KOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexVOLMO;

allvolsocialSTRKOMODInd = [allvolsocialSTRKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexVOLMO;

allvolsocialBLAKOMODInd = [allvolsocialBLAKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.S1modindexVOLOBJ;

allvolobjS1KOMODInd = [allvolobjS1KOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.STRmodindexVOLOBJ;

allvolobjSTRKOMODInd = [allvolobjSTRKOMODInd, moddata];

moddata = allFiringProperties.ModulationIndex.BLAmodindexVOLOBJ;

allvolobjBLAKOMODInd = [allvolobjBLAKOMODInd, moddata];

%
%
%
%
%
%
%%

%% All modulation indices for KO

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexVOLMO;

allvolsocialS1KOMODIndSTIM = [allvolsocialS1KOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexVOLMO;

allvolsocialSTRKOMODIndSTIM = [allvolsocialSTRKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLMO;

allvolsocialBLAKOMODIndSTIM = [allvolsocialBLAKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexVOLOBJ;

allvolobjS1KOMODIndSTIM = [allvolobjS1KOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexVOLOBJ;

allvolobjSTRKOMODIndSTIM = [allvolobjSTRKOMODIndSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexVOLOBJ;

allvolobjBLAKOMODIndSTIM = [allvolobjBLAKOMODIndSTIM, moddata];

%% Get modulation indices for SHORTSTIM

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLMO;

allvolsocialS1KOMODIndSHORTSTIM = [allvolsocialS1KOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLMO;

allvolsocialSTRKOMODIndSHORTSTIM = [allvolsocialSTRKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLMO;

allvolsocialBLAKOMODIndSHORTSTIM = [allvolsocialBLAKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexSHORTSTIMVOLOBJ;

allvolobjS1KOMODIndSHORTSTIM = [allvolobjS1KOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexSHORTSTIMVOLOBJ;

allvolobjSTRKOMODIndSHORTSTIM = [allvolobjSTRKOMODIndSHORTSTIM, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexSHORTSTIMVOLOBJ;

allvolobjBLAKOMODIndSHORTSTIM = [allvolobjBLAKOMODIndSHORTSTIM, moddata];

%% Get modulation indices for PLAT

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLMO;

allvolsocialS1KOMODIndPLAT = [allvolsocialS1KOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLMO;

allvolsocialSTRKOMODIndPLAT = [allvolsocialSTRKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLMO;

allvolsocialBLAKOMODIndPLAT = [allvolsocialBLAKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.S1modindexPLATVOLOBJ;

allvolobjS1KOMODIndPLAT = [allvolobjS1KOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.STRmodindexPLATVOLOBJ;

allvolobjSTRKOMODIndPLAT = [allvolobjSTRKOMODIndPLAT, moddata];

moddata = allFiringProperties.ModulationIndexDIFF.BLAmodindexPLATVOLOBJ;

allvolobjBLAKOMODIndPLAT = [allvolobjBLAKOMODIndPLAT, moddata];
%%

%% All modulation indices for STIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSTIM;

allvolS1KOAUCSTIM = [allvolS1KOAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSTIM;

allvolSTRKOAUCSTIM = [allvolSTRKOAUCSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSTIM;

allvolBLAKOAUCSTIM = [allvolBLAKOAUCSTIM, aucdata];

%% Get modulation indices for SHORTSTIM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolSHORTSTIM;

allvolS1KOAUCSHORTSTIM = [allvolS1KOAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolSHORTSTIM;

allvolSTRKOAUCSHORTSTIM = [allvolSTRKOAUCSHORTSTIM, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolSHORTSTIM;

allvolBLAKOAUCSHORTSTIM = [allvolBLAKOAUCSHORTSTIM, aucdata];


%% Get modulation indices for PLATFORM

aucdata = allFiringProperties.AUCPrefTIME.S1AUC.S1AUCVolPLATFORM;

allvolS1KOAUCPLAT = [allvolS1KOAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.STRAUC.STRAUCVolPLATFORM;

allvolSTRKOAUCPLAT = [allvolSTRKOAUCPLAT, aucdata];

aucdata = allFiringProperties.AUCPrefTIME.BLAAUC.BLAAUCVolPLATFORM;

allvolBLAKOAUCPLAT = [allvolBLAKOAUCPLAT, aucdata];

%%