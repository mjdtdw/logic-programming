n(1..2).
elem(a;b).
{ pair(N, X) : n(N) } = 1 :- elem(X).
{ pair(N, X) : elem(X) } = 1 :- n(N).
#show pair/2.
