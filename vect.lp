%%% Example
v(test,1,a).                % a
v(test,2,b).                % a b
v(test,3,c).                % a b c
do(1 ,test,len).            % 3
do(2 ,test,replaceAt,1,a).  % a
do(3 ,test,append,c).       % a c
do(4 ,test,insertAt,2,b).   % a b c  
do(5 ,test,tail).           % b c
do(6 ,test,head).           % b
do(7 ,test,append,c).       % b c
do(8 ,test,insertAt,1,a).   % a b c
do(9 ,test,init).           % a b
do(10,test,last).           % b
do(11,test,insertAt,1,a).   % a b
do(12,test,append,c).       % a b c
do(13,test,take,2).         % a b
do(14,test,drop,1).         % b
do(15,test,append,c).       % b c
do(16,test,insertAt,1,a).   % a b c
do(17,test,reverse).        % c b a
do(18,test,reverse).        % a b c



%%% Properties

notlen(Name,V,L) :- vector(Name,V,N1,_), vector(Name,V,N2,_), N1 < N2, L = N1.
length(Name,V,L) :- vector(Name,V,L,_), not notlen(Name,V,L).

lastver(L) : vector(_,N1,_,_), vector(_,N2,_,_), N1 > N2, L = N1.
:- lastver(L), vector(_,N,_,_), L < N. 


%%% Utilites

% vector(VersionVector,IndexElement,Element)
vector(Name,1,N,Elem) :- v(Name,N,Elem).

% result
result(Name,N,Elem) :- vector(Name,L,N,Elem), lastver(L).
#show result/3.


%%% Functions

% len
vector(Name,V+1,1,L) :- do(V,Name,len), length(Name,V,L).

% head
vector(Name,V+1,1,Elem) :- do(V,Name,head), vector(Name,V,1,Elem).

% tail
vector(Name,V+1,N-1,Elem) :- do(V,Name,tail), vector(Name,V,N,Elem), N > 1.

% init
vector(Name,V+1,N,Elem) :- do(V,Name,init), vector(Name,V,N,Elem), length(Name,V,L), N < L.

% last
vector(Name,V+1,1,Elem) :- do(V,Name,last), vector(Name,V,L,Elem), length(Name,V,L).

% index
vector(Name,V+1,1,Elem) :- do(V,Name,index,I), vector(Name,V,I,Elem).

% insertAt only into vector
vector(Name,V+1,N,Elem) :- do(V,Name,insertAt,I,NewElem), vector(Name,V,N,Elem), N < I.
vector(Name,V+1,I,NewElem) :- do(V,Name,insertAt,I,NewElem), vector(Name,V,N,Elem), N = I.
vector(Name,V+1,N+1,Elem) :- do(V,Name,insertAt,I,NewElem), vector(Name,V,N,Elem), N >= I.

% append
vector(Name,V+1,N,Elem) :- do(V,Name,append,NewElem), vector(Name,V,N,Elem).
vector(Name,V+1,N+1,NewElem) :- do(V,Name,append,NewElem), length(Name,V,N).

% deleteAt
vector(Name,V+1,N,Elem) :- do(V,Name,deleteAt,I), vector(Name,V,N,Elem), N < I.
vector(Name,V+1,N-1,Elem) :- do(V,Name,deleteAt,I), vector(Name,V,N,Elem), N > I.

% replaceAt
vector(Name,V+1,N,Elem) :- do(V,Name,replaceAt,I,NewElem), vector(Name,V,N,Elem), N < I.
vector(Name,V+1,N,NewElem) :- do(V,Name,replaceAt,I,NewElem), vector(Name,V,N,Elem), N = I.
vector(Name,V+1,N,Elem) :- do(V,Name,replaceAt,I,NewElem), vector(Name,V,N,Elem), N > I.

% take
vector(Name,V+1,N,Elem) :- do(V,Name,take,I), vector(Name,V,N,Elem), N <= I.

% drop
vector(Name,V+1,N-1,Elem) :- do(V,Name,drop,I), vector(Name,V,N,Elem), N > I.

% reverse
vector(Name,V+1,N,Elem) :- do(V,Name,reverse), vector(Name,V,N1,Elem), length(Name,V,L), N = L + 1 - N1.
