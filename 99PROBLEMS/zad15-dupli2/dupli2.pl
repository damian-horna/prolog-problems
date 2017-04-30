dupli([],_,[]).
dupli([H1|T1],N,L) :- repeat_n_times(H1,N,X),dupli(T1,N,L1),append(X,L1,L),!.


repeat_n_times(X,1,[X]).
repeat_n_times(X,N,[X|T]) :- N1 is N-1, repeat_n_times(X,N1,T).
