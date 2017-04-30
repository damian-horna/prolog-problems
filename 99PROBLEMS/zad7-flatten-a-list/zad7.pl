my_flatten(X,[X]) :- not(is_list(X)).
my_flatten([],[]).
my_flatten([H|T],L) :- my_flatten(H,X),my_flatten(T,Z),append(X,Z,L).
