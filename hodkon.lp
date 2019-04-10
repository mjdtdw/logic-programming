board(1..5, 1..5).
move(X, Y, X1, Y1) :- board(X, Y), board(X1, Y1), X1 = (X - 1; X + 1), Y1 = (Y - 2; Y + 2).
move(X, Y, X1, Y1) :- board(X, Y), board(X1, Y1), X1 = (X + 2; X - 2), Y1 = (Y + 1; Y - 1).
step(1, 1, 1).
{ step(X, Y, T) : move(X0, Y0, X, Y), step(X0, Y0, T - 1)} = 1 :- T = 2..25.
:- step(X, Y, T1), step(X, Y, T2), T1 != T2.
#show step/3.
