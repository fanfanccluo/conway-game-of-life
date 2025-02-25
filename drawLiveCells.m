function drawLiveCells(R, C, m, n)
%draw the live cells in black the figure
%draw_live_cells(R, C, m, n)
%   R: a vector of row numbers of the live cells
%   C: a vector of column numbers of the live cells
%   m: height of the table of cells
%   n: width of the table of cells
%   note that cell R=1 C=1 is at the lower left corner of the table of cells
%   the length of vector R and vector C must match or it would yeild an error

% first error check R and C
if length(R) ~= length(C)
    error("Vector R and vector C have different length. " + ...
        "R and C must have the same length.")
elseif any(R > m | R < 1)
    error("Invalid value in R: " + ...
        "one or more row numbers in R exceed the height of the cell table " + ...
        "or is smaller than 1.")
elseif any(C > n | C < 1)
    error("Invalid value in C: " + ...
        "one or more column numbers in C exceed the width of the cell table " + ...
        "or is smaller than 1.")
end

% generate a m+1 by n+1 matrix to represent live and dead cells
% the size is made to be m+1 by n+1 in preparation for drawing with pcolor
% 1 is placed at the positions of live cells. 
% 0 is placed at position of dead cells
mat = 0.5 * ones(m+1, n+1);
mat(1:m, 1:n) = zeros(m, n);
for ind = 1:length(R)
    mat(R(ind), C(ind)) = 1;
end

%draw the table of cells using buit-in function pcolor
colormap([1, 1, 1; 0, 0, 0]);
s = pcolor(mat);
s.EdgeColor = [0.5 0.5 0.5];
s.LineWidth = 3;
axis off;

%end of function
end
