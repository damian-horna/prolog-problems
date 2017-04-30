remove_at(H,[H|T],1,T).
remove_at(X,[H|T],N,[H|L]) :- N1 is N-1, remove_at(X,T,N1,L).
