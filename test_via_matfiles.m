close all; clear variables; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
nm.testData = 'testdata';
ap.testData = fullfile(ap.thisFile,nm.testData);

%% Clean the files that need to be test
files = dir(ap.testData);
files = files(contains({files.name},'.mat'));

%% Do some testing
try
    for nF = 1:length(files)
        currFile = fullfile(files(nF).folder,files(nF).name);
        ap.fullfile{nF} = currFile;
        
        
        
    end
catch
    
end
clear currFile nF