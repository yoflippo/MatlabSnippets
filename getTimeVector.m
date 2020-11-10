function timeVector = getTimeVector(sampleFrequency,data)
if not(exist('data','var'))
error([newline mfilename ': ' newline ...
    blanks(30) ': LOOK HERE' newline ... 
    blanks(30) 'Missing inputparameter "data"' newline]);
end
 
if sampleFrequency < 0 || isnan(sampleFrequency) || isinf(sampleFrequency)
    error([newline mfilename ': ' newline ...
    blanks(30) ': LOOK HERE' newline ... 
    blanks(30) 'inputparameter "fs" should be in a whole positive number' newline]);
end

timeVector = 0:1/sampleFrequency:(length(data)/sampleFrequency)-(1/sampleFrequency);
end