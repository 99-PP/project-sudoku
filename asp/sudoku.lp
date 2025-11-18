% Please insert the names and email addresses of the group members:
%
%

subgrid_size(3).

% Define domain of coordinates and values
num(1..9).

% Each cell (X,Y) must contain only one number N
1 { sudoku(X,Y,N) : num(N) } 1 :- num(X), num(Y).

% Respect the initial configuration: fix given cells
sudoku(X,Y,N) :- initial(X,Y,N).

% Each number N appears at most once in each row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Each number N appears at most once in each column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Compute which subgrid each cell belongs to
subgrid(X,Y,S) :-
    subgrid_size(SZ),
    S = ((X-1)/SZ)*SZ + ((Y-1)/SZ),
    num(X), num(Y).

% Each number appears at most once per subgrid
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   subgrid(X1,Y1,S), subgrid(X2,Y2,S),
   (X1,Y1) != (X2,Y2).

#show sudoku/3.
