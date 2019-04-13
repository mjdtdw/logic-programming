%%% Example

v(1,a). v(2,b). v(3,c). % a b c

do(1,tail).              % b c
do(2,append,d).          % b c d
do(3,init).              % b c
do(4,head).              % b
do(5,append,c).          % b c
do(6,last).              % c
do(7,id).                % c

%%% Properties

notlen(V,L) :- vector(V,N1,_), vector(V,N2,_), N1 < N2, L = N1.
length(V,L) :- vector(V,L,_), not notlen(V,L).

lastver(L) : vector(N1,_,_), vector(N2,_,_), N1 > N2, L = N1.
:- lastver(L), vector(N,_,_), L < N. 


%%% Utilites

% vector(VersionVector,IndexElement,Element)
vector(1,N,Elem) :- v(N,Elem).

% result
result(N,Elem) :- vector(L,N,Elem), lastver(L).
#show result/2.


%%% Functions

% id
vector(V+1,N,Elem) :- do(V,id), vector(V,N,Elem).

% append
vector(V+1,N,Elem) :- do(V,append,NewElem), vector(V,N,Elem).
vector(V+1,N+1,NewElem) :- do(V,append,NewElem), length(V,N).

% head
vector(V+1,1,Elem) :- do(V,head), vector(V,1,Elem).

% tail
vector(V+1,N-1,Elem) :- do(V,tail), vector(V,N,Elem), N > 1.

% init
vector(V+1,N,Elem) :- do(V,init), vector(V,N,Elem), length(V,L), N < L.

% last
vector(V+1,1,Elem) :- do(V,last), vector(V,L,Elem), length(V,L).
