range(X,X,[X]).
range(X,Y,[X|T]) :- X1 is X+1, range(X1,Y,T).
