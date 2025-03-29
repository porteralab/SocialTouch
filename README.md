For behavioral analysis:

Code is available to analyze individual avoidance behaviors and AFEs as well as DeepLabCut XY coordinates. Use raw.avi or .mp4 files for video analysis and the excel files generated from DeepLabCut for DLC pose estimation analysis.

For ephys analysis:

Raw data after spike-sorting in Kilosort and manual curation (.bin and .meta files) should be first go through extracting spike times and other spike relevant info. This is done using the code in ExtractNeuralData folder. Once you have the .mat files generated, they can be formatted using the code in FormatNPData. Once that's completed, the units can be clustered using ClusteringUnits. Firing rates of units can be inputted into the SVM decoding mdoel using SVMDecoding folder. All MATLAB variables 
generated after these steps can be used to plot relevant figures using the code in PlotMATLABFigs. Use code in EncodingModel folder to generate design and neural data matrix for linear encoding model. The encoding model file is a .py file that will run the design and neural data matrix through a Ridge Regression model.
