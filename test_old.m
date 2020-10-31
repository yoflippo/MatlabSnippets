close all; clear variables; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
nm.rawData = 'DATA_RAW';
nm.testData = 'DATA_TEST';
ap.rawData = fullfile(ap.thisFile,nm.rawData);
ap.testData = fullfile(ap.thisFile,nm.testData);

try
    rmdir(nm.testData,'s');
catch end
mkdir(nm.testData);

copyfile([nm.rawData filesep '*'],nm.testData);

% nm.Zip = replace(nm.ThisFile,'_test','_data.zip')
% nm.testData = 'testData';
% unzip(nm.Zip,nm.testData);

files = dir(ap.testData);
files = files(~[files.isdir]);
files = files(contains({files.name},'.m'));

nm.Cur = replace(nm.CurrFile,'_test','');

%% Copy/Move files
copyfile([source filesep '*'],destination);
movefile([source filesep '*'],destination);

%% Do some testing
try
    assert(~isempty(dirs));
    assert(length(dirs) == 4);

    assert(~isempty(stcFilesToKeep),['Test 1 of: ' mfilename ' Failed miserably']);
    disp(['Test 1 of: ' mfilename ' succeeded']);
catch
    %% Clean up
    cd(nm.testData);
    rmpath(nm.testData);
    ff = dir();
    fclose('all');
    for n = 3:length(ff)
        if ~ff(n).isdir
            apff = fullfile(ff(n).folder,ff(n).name);
            delete(apff);
        else
            rmdir(ff(n).folder,'s');
        end
    end
    rmdir(nm.testData,'s');
end
cd(ap.thisFile);
rmdir(ap.testData,'s');


%% helper functions
function deleteAndMakeDir(dir,blKeepDir)
if exist(dir,'dir')
    rmdir(dir,'s');
end
if isequal(nargin,1)
    blKeepDir = true;
end
if blKeepDir
    mkdir(dir);
end
end