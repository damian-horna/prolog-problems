compress([X],[X]).
compress([],[]).
compress([X,X|T],Lwy) :- compress([X|T],Lwy).
compress([X,Y|T],Lwy) :- X\=Y, compress([Y|T],Lwy).

