decode([2,X],[X,X]):- !.
decode([N,Y],[Y|T]) :-  N1 is N-1, decode([N1,Y],T),!.
decode(X,[X]).

decodeList([],[]).
decodeList([H|T],L) :- decode(H,Ho),decodeList(T,To), append(Ho,To,L).
