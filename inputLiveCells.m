function [R, C] = inputLiveCells(m, n)
% prompts the user to select cells to make live, and return the a vector R 
% of row numbers and a vector C of column numbers of selected cells
%   m: height of table of cells
%   n: width of table of cells

%initialize R and C
R = [];
C = [];

% prumpt the user for 1 position
title("Click on the cells you wish to make live. Press <Enter> when done.", ...
    "FontSize", 16);
[x, y] = ginput(1);
% exit if the user presses enter, causing x and y to be []
while ~isequal(x, []) && ~isequal(y, [])
    % round down x and y and check if they are within the table of cells
    x = floor(x);
    y = floor(y);
    if y>=1 && y<=m && x>=1 && x<=n
        %check to see if the position is already in R and C
        ind = find(R == y & C == x);
        if ~isempty(ind)
            %if position already in, remove the position
            R(ind) = [];
            C(ind) = [];
        else
            %if position not in, add it to R and C
            R = [R, y];
            C = [C, x];
        end

        %display the new list of live cells
        drawLiveCells(R, C, m, n);
    end

    % prumpt the user for another position
    title("Click on the cells you wish to make live. Press <Enter> when done.", ...
        "FontSize", 16);
    [x, y] = ginput(1);
end

%remove the prumpt
title("");

