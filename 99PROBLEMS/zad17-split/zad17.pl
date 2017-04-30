split([X|T],0,[],[X|T]).
split([H|T],N,[H|T1], L2) :- N1 is N-1, split(T,N1,T1,L2),!.
