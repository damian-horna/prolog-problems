split([X|T],0,[],[X|T]).
split([H|T],N,[H|T1], L2) :- N1 is N-1, split(T,N1,T1,L2),!.

slice([H|T],X,Y,L) :- N is Y - X+1,X1 is X-1, split([H|T],X1,_,L2),cutFrom(L2,N,L),!.

cutFrom([_|_],0,[]).
cutFrom([H|T],N,[H|T1]):- N1 is N-1,cutFrom(T,N1,T1),!.
