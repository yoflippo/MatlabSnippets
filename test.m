%% Setup test values
testCase.<var> = '';
runTests(testCase)


%% Place tests BELOW
function simpleCallToRecheckVinayTest(testCase)
try
    <functionUT>(testCase.<var>);
catch err
   isError([nameCaller() ' ' err.message])
end
end


%% Place tests ABOVE






















function runTests(testCase)
localfunctionsVar = localfunctions;
if not(isempty(localfunctionsVar))
    for nT = 1:length(localfunctionsVar)
        currentFunction = localfunctionsVar{nT};
        currentFunctionName = functions(currentFunction).function;
        if isUnitTestMethod(currentFunctionName)
            currentFunction(testCase);
        end
    end
    disp([mfilename ' Tests runned succesfull']);
else
    disp([mfilename ' Tests NOT runned!!']);
end
end

function bl = isUnitTestMethod(currentFunctionName)
bl = contains(currentFunctionName,'test','IgnoreCase',true) && ...
not(isequal(currentFunctionName,'runTests')) && ...
not(contains(currentFunctionName,'isUnitTestMethod'));
end

function isError(infoTxt)
error([newline mfilename ': ' newline blanks(30) infoTxt ': LOOK HERE' newline]);
end

function name = nameCaller()
stack = dbstack;
name = stack(2).name;
end