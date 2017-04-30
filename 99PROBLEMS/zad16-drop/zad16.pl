split([X|T],0,[],[X|T]).
split([H|T],N,[H|T1], L2) :- N1 is N-1, split(T,N1,T1,L2),!.

drop(L1,N,L1) :- length(L1,X),X<N.
drop(Li,N,X) :- N1 is N-1, split(Li,N1,A,[_|T1]), drop(T1,N,X1), append(A,X1,X),!.
