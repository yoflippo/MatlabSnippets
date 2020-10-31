files = dir(['**' filesep '*.<type>']);
files = files(~[files.isdir]); % remove directories
files(~contains({files.name},'<txt>')) = []; %remove files not containing <txt>

for nF = 1:length(files)
   nm.CurrFile = files(nF).name;
   ap.CurrFile = files(nF).folder;
   ap.CurrFullPath = fullfile(ap.CurrFile,nm.CurrFile);
   
   % Do something with every file
    
end