square(1..3, 1..3).
n(1..9).

sum(S) :- cell(1,Y,N1), cell(2,Y,N2), cell(3,Y,N3), S = N1+N2+N3.
sum(S) :- cell(X,1,N1), cell(X,2,N2), cell(X,3,N3), S = N1+N2+N3.
sum(S) :- cell(3,1,N1), cell(2,2,N2), cell(1,3,N3), S = N1+N2+N3.
sum(S) :- cell(1,3,N1), cell(2,2,N2), cell(3,1,N3), S = N1+N2+N3.
:- sum(S1), sum(S2), S1 != S2.

{ cell(X,Y,N) : square(X,Y) } = 1 :- n(N).
:- cell(X,Y,N1), cell(X,Y,N2), N1 != N2.

% 6 7 2
% 1 5 9 = 15
% 8 3 4
