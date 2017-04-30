pack([X],[[X]]).
pack([X,X|T],[[X|L]|L1]) :- pack([X|T],[L|L1]).
pack([X,Y|T],[[X]|L]) :- X\=Y,pack([Y|T],L).
