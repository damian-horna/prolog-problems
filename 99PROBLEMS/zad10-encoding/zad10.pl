pack([X],[[X]]).
pack([X,X|T],[[X|L]|L1]) :- pack([X|T],[L|L1]).
pack([X,Y|T],[[X]|L]) :- X\=Y,pack([Y|T],L).

encodep([],[]).
encodep([A|B],[H1|T1]) :- count(A,H1),encodep(B,T1).

encode([X],[[1,X]]).
encode([H|T],[H1|T1]):- pack([H|T],[A|B]), encodep([A|B],[H1|T1]).

count([H|T],[X,H]) :- length([H|T],X).
