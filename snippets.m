% INSERT-SNIPPET
%   Insert a piece of code in the Matlab editor.
%
% Inspired from http://blogs.mathworks.com/community/2011/05/16/matlab-editor-api-examples/
%
% 10-May-2013, Revised 10-May-2013, Revised 23-August-2013, Revised 12-November-2014
% Comments and questions to: vincent.mazet@unistra.fr.
function snippets(var1)

%% Check if this function is in Matlab path
apThisFile = fileparts(mfilename('fullpath'));
if ~contains(path,apThisFile)
    addpath(genpath(apThisFile));
    disp([mfilename ': Added snippets to Matlab path (MS2018)']);
end

%% collect snippets names
snips = dir([apThisFile filesep '*.m']);
maxstrlength = max(strlength({snips.name}'));
printfExpression = ['%' num2str(maxstrlength) '.' num2str(maxstrlength) 's\t'];
clc
disp('Choose from:')
cols = 3;

if exist('var1','var') && isnumeric(var1)
    n = var1;
    var1 = snips(n).name;
elseif exist('var1','var')
    if ~contains(var1,'.m')
        var1 = [var1 '.m'];
    end
else
    for nF = 1:cols:length({snips.name})
        txt = '';
        try
            for nC = 0:cols-1
                txt = [txt sprintf('\t %2d:',nF+nC) sprintf(printfExpression,snips(nF+nC).name)];
            end
        catch
        end
        disp(txt);
    end
    n = input('Give snippets number: ');
    var1 = snips(n).name;
end

if exist('snippet')
    snippet = struct('snippet',snippet);  % Save the variable SNIPPET, if it exists
end

% if isempty(strfind(input, '.m'))
%     snipper_file_name = [input '.m'];
snipper_file_name = var1;
% end

snippet.txt = fileread(snipper_file_name);
snippet.txt = strrep(snippet.txt, '\n', sprintf('%c',10));          % Replace '\n' by a new line
snippet.txt = strrep(snippet.txt, 'XXXX-XX-XX', char(datetime('today','Format','uuuu-MM-dd')));
try
    snippet.txt = strrep(snippet.txt, 'XXXX', num2str(year(date)));
catch
    snippet.txt = strrep(snippet.txt, 'XXXX', datestr(now,'yyyy'));
end
if verLessThan('matlab', '8.1.0')
    % Get the active document in the editor
    snippet.activeEditor = editorservices.getActive;
else
    % Get the active document in the editor
    snippet.activeEditor = matlab.desktop.editor.getActive;
end

[~,fn,~]=fileparts(snippet.activeEditor.Filename);
snippet.txt = strrep(snippet.txt, '<NAMEINCAPTIALS>', upper(fn));
snippet.txt = strrep(snippet.txt, '<functionName>', fn);

% Insert text at the current position
snippet.activeEditor.JavaEditor.insertTextAtCaret(snippet.txt);

% Delete SNIPPET (or replace it by its original value)
if isfield(snippet,'snippet')
    snippet = snippet.snippet;
else
    clear snippet
end

end