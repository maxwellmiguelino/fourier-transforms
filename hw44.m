function [diam] = hw44(tree)
% Determine the maximum number of nestings of cell arrays in a given tree

if ~iscell(tree) % base case: tree is not a cell array
    diam = 0;
else % recursive case: tree is a cell array
    diam = 1;
    for i = 1:numel(tree) % iterate over all elements of the cell array
        if iscell(tree{i})
            diam_i = 1 + hw44(tree{i}); % recursive call to determine nesting depth of sub-tree
            if diam_i > diam
                diam = diam_i;
            end
        end
    end
end
end