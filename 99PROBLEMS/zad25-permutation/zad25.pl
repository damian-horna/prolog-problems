remove_at(H,[H|T],1,T).
remove_at(X,[H|T],N,[H|L]) :- N1 is N-1, remove_at(X,T,N1,L).

select(L,I,X) :- length(L,D),random_between(1,D,I),getel(L,I,X).

getel([H|_],1,H) :- !.
getel([_|T],N,X) :- N1 is N-1, getel(T,N1,X),!.

rnd_select(_,0,[]).
rnd_select(L,N,[H|T]) :- N1 is N-1, select(L,I,H), remove_at(_,L,I,L1),rnd_select(L1,N1,T),!.

permutation(L1,L2) :- length(L1,X),rnd_select(L1,X,L2).
