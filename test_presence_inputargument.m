if ~exist('apFolder','var')
    apThisFile = fileparts(mfilename('fullpath'));
    cd(apThisFile);
    cd(findSubFolderPath(pwd,'MEASUREMENTS','MEASUREMENT_DATA'));
else
    if ~exist(apFolder,'dir')
        error([newline mfilename ': ' newline 'Path does not exist' newline]);
    end
    cd(apFolder);
end