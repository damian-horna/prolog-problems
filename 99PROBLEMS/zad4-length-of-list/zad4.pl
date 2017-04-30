len(0,[]).
len(X,[_|T]) :- len(N,T),X is N+1.
