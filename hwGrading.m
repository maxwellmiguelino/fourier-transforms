%% Prep for running script
varsbefore = who;
warning('off','all')  % turn off warnings
%% VARIABLES
HWNUM=4;  % homework number
NUMPROB=4;  % number of problems in the assignment
SOL = false;  % if using to test homework solutions
%% Load Tests
fhandle = sprintf('hw%ddata.mat', HWNUM);
load(fhandle)
%% total grading
perprob = ones(1, NUMPROB);
if SOL
    txt = 'sol';
else
    txt = '';
end
for i = 1:NUMPROB  % execute homework files
    eval(sprintf('[perprob(%1$d), table%1$d] = grade_problem(%1$d, inputs{%1$d}, outputs{%1$d}, @hw%2$d%1$d%3$s);', i, HWNUM, txt))
end

grade = round(mean(perprob)*100);
fprintf('GRADE for HW%d: %d \n', HWNUM, grade)

for i = 1:NUMPROB
    varsbefore{end+1} = sprintf('table%d', i);
end
%% clear variables from script
varsnew = setdiff(who, varsbefore);
clear(varsnew{:})
clear('varsnew')
%% check each test for problem
function [passedTest, funcOut] = testOutput(num, input, correctOut, func)
funcnames = functions(func);
fprintf('Test %d for function %s: ', num, funcnames.function)
try
    funcOut = cell(1,nargout(func));
    [funcOut{:}] = func(input{:});
    passedTest = isequal(correctOut, funcOut);
    if passedTest
        fprintf('Test Passed \n')
    else
        fprintf('Test Failed \n')
    end
catch ME
    fprintf(' ERROR in your code: %s \n', ME.message)
    passedTest = 0;
    funcOut = {'ERROR'};
end
end

%% check each problem + make table
function [gradeperprob, table] = grade_problem(numprob, inputs, outputs, fh)
    total = length(inputs);
    numCorrect = 0;
    funcOuts = cell(1, total);
    TestNames = cell(1, total);
    for k=1:total
        input = inputs{k};
        output = outputs{k};
        [cor, funcOut] = testOutput(k, input, output, fh);
        numCorrect = numCorrect + cor;
        funcOuts{k} = funcOut;
        TestNames{k} = sprintf('Test%d', k);
    end    
    fprintf('\n%d out of %d correct for problem %d \n\n', numCorrect, total, numprob)
    gradeperprob = numCorrect/total;
    c = [inputs; outputs; funcOuts];
    RowNames = {'Inputs', 'CorrectOutputs', 'YourOutputs'};
    table = cell2table(c, 'RowNames', RowNames, 'VariableNames', TestNames);
end
