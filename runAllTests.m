function runAllTests()
clc;
commandWindowLine()
% [ap.thisFile] = fileparts(mfilename('fullpath'));
% cd(ap.thisFile);
% addpath(genpath(ap.thisFile));

results = runtests(pwd,'IncludeSubfolders',true,'UseParallel',true);
rt = table(results);
sortrows(rt, 'Duration')
commandWindowLine()

    function commandWindowLine()
        disp(['======================== ' mfilename ' ========================']);
    end
end
