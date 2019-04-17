%TODO term((zero, nil)).
term((true, nil)).
term((false, nil)).
%TODO term((pred, Term1)) :- term((Term1, _)).
%TODO term((succ, Term1)) :- term((Term1, _)).
%TODO term((iszero, Term1)) :- term((Term1, _)).
term((ifthenelse, (Term1, Term2, Term3))) :- term((Term1, _)), term((Term2, _)), term((Term3, _)).

eval(Term, Result) :- term(Term),
                      Term = (ifthenelse, (false, _, Result)).
eval(Term, Result) :- term(Term),
                      Term = (ifthenelse, (true, Result, _)).
eval(Term, Result) :- term(Term),
                      Term = (ifthenelse, (Term1, Term2, Term3)),
	              eval(Term1', Term1),
		      eval(ifthenelse, (Term1', Term2, Term3), Result'),
		      eval(Result', Result).

example1(Result) :- eval((ifthenelse, (true, true, false)), Result).
#show example1/1.
example2(Result) :- eval((ifthenelse, (X1, true, false)), Result),
                    eval((ifthenelse, (X2, true, false)), X1),
                    eval((ifthenelse, (false, true, false)), X2).
#show example2/1.
