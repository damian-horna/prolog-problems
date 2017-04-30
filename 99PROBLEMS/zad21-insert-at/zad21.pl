insert_at(X,L,1,[X|L]).
insert_at(X,[H|T],N,[H|L]) :- N1 is N-1, insert_at(X,T,N1,L).
