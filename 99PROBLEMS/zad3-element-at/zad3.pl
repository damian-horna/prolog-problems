element_at(H,[H|_],1).
element_at(X,[_|T],N) :- element_at(X,T,N1), N is N1+1.
