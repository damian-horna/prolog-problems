dupli([X],[X,X]).
dupli([H|T],[H|Tw]) :- dupli(T,Tw2),append([H],Tw2,Tw),!.
