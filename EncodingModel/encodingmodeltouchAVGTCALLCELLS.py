# -*- coding: utf-8 -*-
"""
Created on Sat Jan  4 10:04:46 2025

@author: Trish Chari
"""

#%%
# -*- coding: utf-8 -*-
"""
Created on Sun Nov  3 10:51:13 2024

@author: Trish Chari
"""


import numpy as np
from scipy.io import loadmat  # this is the SciPy module that loads mat-files
import matplotlib.pyplot as plt
from datetime import datetime, date, time
import pandas as pd
from os.path import dirname, join as pjoin
import scipy.io as sio


import glob
#from time import time
from os.path import splitext, join
import itertools
import sys
from sklearn.linear_model import RidgeCV
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.utils.class_weight import compute_class_weight
from sklearn.linear_model import Ridge
import pandas as pd

from sklearn.metrics import r2_score
from sklearn.linear_model import Ridge
from sklearn.model_selection import train_test_split,GridSearchCV

import statistics

def tune_ridge_parameters(X,Y, alphas = np.logspace(0, 2, 200)):
    '''This can be done on the whole dataset'''

    parameters = {'alpha':alphas}
    rr = GridSearchCV(Ridge(), parameters, scoring='r2',cv=10,n_jobs = -1)
    rr.fit(X.T,Y.T)
    return rr.best_params_['alpha']

def crossval_ridge_model(alpha,X,Y,nfolds=10,test_size = 0.2):
    weights = []
    r2_raw = []
    for f in range(nfolds):
        # is the random state ok like that?
        Xtrain, Xtest, ytrain, ytest = train_test_split(X.T, Y.T, test_size=0.2, random_state=f)
        model = Ridge(alpha = alpha)
        model = model.fit(Xtrain,ytrain)
        yhat = model.predict(Xtest)    
        weights.append(model.coef_)
        r2_raw.append(r2_score(ytest,yhat,multioutput='raw_values'))
    cv_weights = np.stack(weights).mean(axis=0)
    cv_r2_raw = np.stack(r2_raw).mean(axis=0)
    return cv_r2_raw.mean(),(cv_weights,cv_r2_raw),(weights,r2_raw)


#%%
dir_mat = "E:/Trish/Fmr1KO/405993-1_Fmr1KO_F_TouchCat/S1BLASpikes&FiringRates/AllModelDesignMatricesAVGZScore"
mat_fname = pjoin(dir_mat, 'ALLStimBehMatrixForc.mat')
mat_stim = sio.loadmat(mat_fname)

stimmat_df = pd.DataFrame((mat_stim['alldesignmatrixFORC']))


import seaborn as sns

sns.heatmap(stimmat_df)



dir_mat = "E:/Trish/Fmr1KO/405993-1_Fmr1KO_F_TouchCat/S1BLASpikes&FiringRates/AllModelDesignMatricesAVGZScore"
mat_fname = pjoin(dir_mat, 'ALLFORCCellMatrix.mat')

mat_ALLneurFORC = sio.loadmat(mat_fname)

ALLFORCmat_df = pd.DataFrame((mat_ALLneurFORC['ALLFORCCatbinned']))


import seaborn as sns

sns.heatmap(ALLFORCmat_df)


file_name = 'encoding_models_502564_partitioned_weights_20240115'
    
signal_type = 'F'
    
k_folds = 10 #For regular random cross-validation
    
    # fit_regressor_group = True #Groups refers to a set of regressors obtained from one modality, like cognitive regressors from
    # #task events, or head orientation from miniscope gyro.
    # #If set to false the model will be fit to individual regressors, excluding
    # #the intercept regressors
    
which_models = 'group' #'single_var' #'cognitive' #'group' # 'individual', 'timepoint'
    #Determines what type of models should be fitted. 'group' will lump specified regressors
    #into a group and fit models for the cvR2 and dR2 for each of the groups, 'individual'
    #will assess the explained variance for each regressor alone and 'timepoint' will
    #look at the task regressors collectively but evaluate the model performance at each
    #trial time separately
add_complete_shuffles = 0 #Allows one to add models where all the regressors
    #are shuffled idependently. This can be used to generate a null distribution for
    #the beta weights of certain regressors
    
use_parallel = False #Whether to do parallel processing on the different shuffles
    
    
regressor_labels = ['stim_onset', 'avoidrun', 'eyesquint', 'whiskpro', 'whiskdlc', 'eyedlc', 'pupildlc', 'mouthdlc', 'nosedlc', 'pupilsize', 'runspeed', 'saccade', 'motionbi']
regressor_X = []
regressor_X = stimmat_df


neural_Y = ALLFORCmat_df


Ytab = ALLFORCmat_df.T
Y = Ytab.to_numpy()
    
Xtab = stimmat_df.to_numpy()
X = Xtab.T

#theta_lg = np.linalg.inv(X.T @ X) @ X.T @ y

stim = X.T[2]


clf = Ridge(alpha=1.0)
clf.fit(X, Y)
print(clf.coef_)
ALLcoef = clf.coef_
sns.heatmap(ALLcoef)

# z score after avg time points per trial
newalpha = tune_ridge_parameters(X.T,Y.T, alphas = np.logspace(0, 2, 200))
ALLcoefnew = crossval_ridge_model(newalpha,X.T,Y.T,nfolds=10,test_size = 0.1)
ALLcoefraw = ALLcoefnew[1]
ALLcoefw = ALLcoefraw[0]
ALLcoefcv = ALLcoefraw[1]


sns.heatmap(ALLcoefw)

ALLcoefcvmedian = statistics.median(ALLcoefcv)
ALLcoefcvmean = statistics.mean(ALLcoefcv)
print(ALLcoefcvmedian)
print(ALLcoefcvmean)
ALLcoefwmean = np.mean(ALLcoefw,axis=0)

df = pd.DataFrame(ALLcoefwmean)


df.to_clipboard(index=False)

print(newalpha)



#%%
ALLcoefwNORM = np.zeros(ALLcoefw.shape)
a = 0
for column in ALLcoefw:
    coefper = []
    for element in column:
        print((element/sum(column)))       
        print((element/(sum(column))))    
        coefper=np.append(coefper, (element/(sum(column))))
    ALLcoefwNORM[a,:]= coefper
    a = a+1
    
#%%

    
#%%    
first_values = ALLcoefwNORM[29,:]



S1_values = first_values[0:114]
STR_values = first_values[115:115+21]
BLA_values = first_values[137:137+9]


def reject_outliers(data):
    m = 2
    u = np.nanmean(data)
    s = np.nanstd(data)
    filtered = [e for e in data if (u - 2 * s < e < u + 2 * s)]
    newfiltered = np.array(filtered)
    indx = 0
    return newfiltered, indx

S1_valuesnew, S1_valuesfilt  = reject_outliers(S1_values)
STR_valuesnew, STR_valuesfilt = reject_outliers(STR_values)
BLA_valuesnew, BLA_valuesfilt = reject_outliers(BLA_values)


S1_mean = np.nanmean(S1_valuesnew)
print(S1_mean)
STR_mean = np.nanmean(STR_valuesnew)
print(STR_mean)
BLA_mean = np.nanmean(BLA_valuesnew)
print(BLA_mean)


#%%
df = pd.DataFrame(first_values)


df.to_clipboard(index=False)


#%%
df = pd.DataFrame(STR_values)


df.to_clipboard(index=False)



df = pd.DataFrame(BLA_values)


df.to_clipboard(index=False)

#%%
sns.heatmap(ALLcoefw, cmap='bwr', vmin=-0.25, vmax=0.25)

plt.savefig("C:/Users/Trish Chari/Documents/EncodingModels/WT502578heatmap.pdf", dpi=300) 
