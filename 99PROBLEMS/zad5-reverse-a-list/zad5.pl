my_append([],L,L).
my_append([H1|T1],L2,[H1|L3]) :- my_append(T1,L2,L3).

reverse([],[]).
reverse([H|T],Lodwr) :- reverse(T,L), my_append(L,[H],Lodwr).
