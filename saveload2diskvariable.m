
fullPath = mfilename('fullpath');
if exist(fullPath,'dir')
    mkdir(fullPath);
end

nameSaveFile = [mfilename '__' XXX '.mat']; %%% Give unique name

fullPathFileName = fullfile(fullPath,nameSaveFile);
if exist(fullPathFileName,'file')
    load(fullPathFileName);
else
    XXX = randn(r,c);
    save(fullPathFileName,'XXX');
end