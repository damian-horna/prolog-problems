split([X|T],0,[],[X|T]).
split([H|T],N,[H|T1], L2) :- N1 is N-1, split(T,N1,T1,L2),!.

rotate(L,N,Lw) :- N>0, split(L,N,L1,L2),append(L2,L1,Lw),!.
rotate(L,N,Lw) :- N<0, length(L,X), N1 is X+N, split(L,N1,L1,L2),append(L2,L1,Lw),!.
