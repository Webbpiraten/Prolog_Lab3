% ---DEBUG---
% spy(+predikat)
% nospy(+predikat)
% nodebug

% N säger hur många gånger som vi ska tillåta programmet
% att köra, detta kan användas då man backtrackar.
% Trace ger ut en tuple med (item,destination).
% state är det initiala tillståndet.
%+ = input, - = output.
%solvefgb(+state, +Dest, +N, -Trace).

% Varje sak har en fixt position: [Goose, beans, fox, boat]. 
canEat([west, east, west, east]).
canEat([east, west, east, west]).

canEat([west, west, east, east]).
canEat([east, east, west, west]).

% transfer utför själva överföringen där vi kollar vilket item som tas över samt vilket
% riktning den ska. 
transfer(goose, east, [west, X, Y, west],[east, X, Y, east]).
transfer(beans, east, [X, west, Y, west],[X, east, Y, east]).
transfer(fox,   east, [X, Y, west, west],[X, Y, east, east]).
transfer(boat,  east, [X, Y, Z, west],   [X, Y, Z, east]).

transfer(goose, west, [east, X, Y, east]  ,[ west, X,  Y, west]).
transfer(beans, west, [X, east, Y, east]  ,[X,  west,  Y, west]).
transfer(fox,   west, [X, Y, east, east],[X, Y, west, west]).
transfer(boat,  west, [X, Y, Z, east] ,[X, Y,  Z, west]).

solvefgb([east,east,east,east],_,_,_,[]).	% Är alla på east? -> stop.
solvefgb(State, Dest, N, Steg, [(Dest2,Item)|Trace]):-
	Steg1 is Steg + 1,
	transfer(Item, Dest2, State, State2),
	not(canEat(State2)),	% Kollar ifall ingenting kan ätas.
	Steg1 =< N,
	solvefgb(State2, Dest, N, Steg1, Trace).	% Anropar solvefgb med ny state.

%transfer(Items,Dest,N,Steg):- N>=Steg.
%transfer(Items,Dest,N,Steg) :-
%	Steg is Steg+1,
%	transfer(Items, Dest, N, Steg).

%canEat(fox, goose);
%canEat(goose, beans).	
	
% ------------ TEST ------------

failure_driven_countdown :-
        between(0,10,A),
        N is 10 - A,
        writeln(N),
        A = 10.

print_a_list([]).
print_a_list([H|T]):-
	write(H),
	print_a_list(T).
		
%insert(X, List, BiggerList):-
%del(X, BiggerList, List).

%del(X, [X | Tail], Tail).
%del(X, [Y | Tail], [Y | Tail1]):-
%del(X, Tail, Tail1).
	
%member(X, [X | Tail]).
%member(X, [Head | Tail]) :-
%member(X, Tail).

%parent(pam, bob).
%parent(tom,bob).
%parent(tom,liz).
%parent(bob,ann).
%parent(bob, pat).
%parent(pat, jim).

%predecessor(X,Z):-
%parent(X,Z).
%predecessor(X,Z):-
%parent(X,Y),
%predecessor(Y,Z).

%offspring(Y,X) :- parent(X,Y).
