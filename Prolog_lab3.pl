% N säger hur många gånger som vi ska tillåta programmet
% att köra, detta kan användas då man backtrackar.
% Trace ger ut en tuple med (item,destination).
% state är det initiala tillståndet.

% ---DEBUG---
% spy(+predikat)
% nospy(+predikat)
% nodebug

% + = input, - = output.
% solvefgb(+state, +Dest, +N, -Trace).

solvefgb(state, Dest, N, Trace) :-
	initState(state, Dest, N).

initState([fox,beans,goose], west, N) :-
	bagof(transfer(item, east, N, 0)).
	
canEat(fox, goose).
canEat(goose, beans).

transfer(item,dest,N,Steg):- N>=Steg.
transfer(item,dest,N,Steg) :-
	insert(item, Dest1, Dest2),
	trace(dest, item),
	write('Destination: '),
	write(dest),
	write('\n'),
	write('Item: '),
	write(item),
	write('\n'),
	del(item, Dest1, Dest2),
	Steg is Steg+1,
	length(Dest2,Int), % om längden av listan är lika med 1, åk tillbaka tomhänt.
	transfer(item, dest, N, Steg).
	
trace(direc, item, List):-
	insert([direc,item], X, Y).

insert(X, List, BiggerList):-
	del(X, BiggerList, List).

del(X, [X | Tail], Tail).
del(X, [Y | Tail], [Y | Tail1]):-
del(X, Tail, Tail1).
	
member(X, [X | Tail]).
member(X, [Head | Tail]) :-
	member(X, Tail).
	
% ------------ TEST ------------

print_a_list([]).
print_a_list([H|T]):-
	write(H),
	print_a_list(T).

parent(pam, bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob, pat).
parent(pat, jim).

predecessor(X,Z):-
write('test '),
parent(X,Z).
predecessor(X,Z):-
parent(X,Y),
predecessor(Y,Z).

offspring(Y,X) :- parent(X,Y).

mother_child(trude, sally).
 
father_child(tom, sally).
father_child(tom, erica).
father_child(mike, tom).
 
sibling(X, Y)      :- parent_child(Z, X), parent_child(Z, Y).
 
parent_child(X, Y) :- father_child(X, Y).
parent_child(X, Y) :- mother_child(X, Y).

predicate1(X) :-
  predicate2(X,X).
predicate2(X,Y) :-
  X \= Y,
  predicate1(X).
