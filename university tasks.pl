
%excercise number one

%returns k-th element of a list
kth_element(1,[H|_],H).
kth_element(K,[_|T],X) :- K1 is K-1, kth_element(K1,T,X).

sumdiag(L,X) :- sumdiag(L,X,1).
sumdiag([],0,_).
sumdiag([H|T],X,N) :-  kth_element(N,H,Y), N1 is N+1, sumdiag(T,Z,N1), X is Y+Z.


%excercise number two

%returns true if X is a member of given list
member(H,[H|_]).
member(X,[_|T]) :- member(X,T).

%return the last element of a list
last([X],X).
last([_|T],X) :- last(T,X).

%true if a list has an even number of elements
evenlist([_,_]) :- !.
evenlist([_,_|T]) :- evenlist(T).

%true if a list has an odd number of elements
oddlist([_]) :- !.
oddlist([_,_|T]) :- oddlist(T).

% returns an element from the middle of the list if the list has an odd
% number of elements
mid([X],X).
mid([H|T],X) :- oddlist([H|T]), last([H|T],Y), append(Z,[Y],T), mid(Z,X).

%returns the mid elements of a list of lists
mids([],[]).
mids([H|T],W) :- evenlist(H),mids(T,W).
mids([H|T],W) :- mid(H,X),mids(T,L), append([X],L,W).

%adds an element at the beginning of a list
add_at_the_beginning(X,L,W) :- W=[X|L].

%makes a list unique
unique([X],[X]).
unique([H|T],W) :- not(member(H,T)), unique(T,W1), append([H],W1,W).
unique([_|T],W) :- unique(T,W).

%middle unique elements of a list of lists
miduniq(L,X) :- mids(L,Y), unique(Y,X).


%repeats X n-times and puts it on the list
xtimes(1,X,[X]).
xtimes(N,X,[X|T]) :- N1 is N-1, xtimes(N1,X,T).

%repeats each element of a list index-times and puts it on the list
stepgrow(L,O) :-  stepgrow(L,O,1).
stepgrow([],[],_).
stepgrow([H|T],L,N) :- xtimes(N,H,L1), N1 is N+1, stepgrow(T,Tw,N1), append(L1,Tw,L).

%returns the list of factors of X
factors(X,L) :- factors(X,L,[],X).
factors(_,Acc,Acc,0).
factors(X,L,Acc,N) :- X mod N =:= 0, add_at_the_beginning(N,Acc,L1), N1 is N-1, factors(X,L,L1,N1).
factors(X,L,Acc,N) :- N1 is N-1, factors(X,L,Acc,N1).

%returns true if X is prime number
isPrime(X) :- X\=1, factors(X,L),!,length(L,2).

% returns the sum of elements on a list(we presume that list consists
% only of integers)
sumList([],0).
sumList([H|T],X) :- sumList(T,X1), X is  X1 + H.

perfect(X) :- factors(X,L),!,sumList(L,Y),X =:= Y - X.

antypierwsza(1).
antypierwsza(X) :- factors(X,L),length(L,Y),!,X1 is X-1, antypierwsza(X1,Y).
antypierwsza(1,_).
antypierwsza(X,Y) :- factors(X,L),length(L,Z),!,Y>Z,X1 is X-1, antypierwsza(X1,Y).

sumtriangle(LL,X) :- sumtriangle(LL,X,1).
sumtriangle([],0,_).
sumtriangle([H|T],X,N) :- sum_n_first(H,N,Y),N1 is N+1, sumtriangle(T,Z,N1), X is Z+Y.

sum_n_first([H|_],1,H).
sum_n_first([H|T],N,X) :- N1 is N-1, sum_n_first(T,N1,Y), X is H+Y.

even(X) :- X mod 2 =:= 0.
odd(X) :- not(even(X)).


partition(X,Y,Z) :- append(Y,Z,X), length(Y,YL), length(Z,ZL), YL=ZL.
happy(X) :- integer(X), name(X,Y), length(Y,Z), Z mod 2 =:= 0, partition(Y,A,B), length(A,Length), sum_n_first(A,Length,AW), sum_n_first(B,Length,BW), AW==BW.

separate(_,[],[],[]).
separate(X,[H|T],[X|T1],L2) :- X==H, separate(X,T,T1,L2).
separate(X,[H|T],L1,[H|T2]) :- X \== H,separate(X,T,L1,T2).

deleteEveryOther([],[]).
deleteEveryOther([X],[X]).
deleteEveryOther([H,_|T1],[H|T]) :- deleteEveryOther(T1,T).


% ZADANIE 1
%
% predykat deldiff(Element,List1,List2) usuwa z listy atomów "List1" wszystkie
% elementy ró¿ne od "Element" i w efekcie powstaje lista "List2"
% UWAGA: wykorzystaæ odciêcie i niejawn¹ unifikacjê!
%

deldiff(_,[],[]).
deldiff(X,[X|T],[X|T1]) :- !,deldiff(X,T,T1).
deldiff(X,[_|T],L2) :- deldiff(X,T,L2).


% ZADANIE 2
%
% Predykat allafter(List1, Element, List2) podaje listê "List2" wszystkich
% elementów z listy atomów "List1", które znajduj¹ siê za atomem "Element"
% UWAGA: nie wykorzystywaæ predykatu concat/append!
%

allafter([E|T],E,T) :-!.
allafter([_|T],E,L2) :- allafter(T,E,L2).


% ZADANIE 3
%
% Predykat occur(X,L,N) jest spe³niony, gdy symbol X wystêpuje N razy na liœcie L
%

occur(_,[],0) :- !.
occur(X,[X|T],N) :- !,occur(X,T,N1), N is N1+1.
occur(X,[_|T],N) :- occur(X,T,N).

% ZADANIE 4
%
% Predykat adduplist(L,K,N) tworzy listê K z listy liczb L
% poprzez sumowanie przyrostowo kolejnych jej elementów
% np. adduplist([1,4,2,7,12],K) daje wynik K=[1,5,7,14,26]
% UWAGA: ³atwiej rozwi¹zaæ definiuj¹c pomocniczy predykat!
%


adduplist(L,K) :- adduplist(L,K,0).
adduplist([],[],_).
adduplist([H|T],[X|T1],N) :- X is H + N, N1 is X, adduplist(T,T1,N1).


% ZADANIE 5
%
% Predykat adjacent(X,Y,L) jest spe³niony, gdy elementy X i Y s¹ obok siebie na liœcie
% UWAGA: nie wykorzystywaæ predykatu concat/append!
%

adjacent(X,Y, [X,Y|_]) :- !.
adjacent(X,Y, [_,Y|T]) :- adjacent(X,Y,[Y|T]).


% ZADANIE 6
%
% Predykat sumpair(L1,L2) generuje listê liczb L2 sumuj¹c parami liczby z listy L1
% np. sumpair([1,3,2,5,8,9],Z). daje Z=[4,7,17], bo 1+3=4, 2+5=7, 8+9=17
% Jeœli L1 jest nieparzystej d³ugoœci, to L2 na koñcu powinno mieæ jej ostatni element.
% Je¿eli L1 jest pusta, to L2 te¿ jest pusta.
% UWAGA: zrobiæ to z jednym predykatem!


sumpair([],[]).
sumpair([X],[X]) :- !.
sumpair([X,Y|T],[Z|T1]) :- Z is X+Y, sumpair(T,T1).

% ZADANIE 7
%
% Generowanie listy kolejnych liczb ca³kowitych od zadanego N a¿ do wartoœci -1,
% przy czym liczby parzyste maj¹ byæ dodatnie, a nieparzyste - ujemne
% predykat altersign(L,N), gdzie L lista wynikowa, N- wartoœæ pocz¹tkowa
% % UWAGA: rozwi¹zaæ to w dwóch wariantach:
% % pierwszy, gdy lista wynikowa jest posortowana malej¹co co do wartoœci
% % bezwglêdnych np. ?-altersign(7,L). L=[-7,6,-5,4,-3,2,-1]
% % drugi, gdy lista wynikowa posortowana jest rosn¹co (nieco trudniej!)
%

altersign([-1],1) :- !.
altersign([N|T],N) :- N mod 2 =:= 0,!, N1 is N-1, altersign(T,N1).
altersign([-N|T],N) :- N1 is N-1, altersign(T,N1).

altersign2(L,N) :- altersign(L1,N),reverse(L1,L).

% ZADANIE 8
%
% Generowanie listy g³ów wszystkich list s³adowych listy wejœciowej
% predykat heads(LList,HList) gdzie LList to lista list, zaœ HList to
% lista ich g³ów
%

heads([],[]).
heads([[H|_]|T1],[H|T2]) :- heads(T1,T2).

% ZADANIE 9
%
% Predykat prepend(E,L1,L2) dodaje do ka¿dej listy sk³adowej listy L1
% element E na jej pocz¹tku, w wyniku czego otrzymujemy listê L2
% ?-prepend(a,[[b,c],[f,g,h],[i,j,k,l]],L2). L2=[[a,b,c],[a,f,g,h],[a,i,j,k,l]]
% Je¿eli L1 jest pusta, to L2 te¿ powinna byæ pusta.

prepend(_,[],[]) :- !.
prepend(E,[H|T],[[E|H]|T1]) :- prepend(E,T,T1).
