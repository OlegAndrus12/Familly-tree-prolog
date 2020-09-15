% knowledge bases
% gender
male(ivan).
male(petro).
male(sem).
male(stepan).
male(ivas).
male(zenovii).
male(ihor).
male(rostyslav).
male(pedro).
male(oleh).
male(mark).
female(zlata).
female(mariia).
female(judi).
female(sally).
female(anna).
female(nadiia).
female(kseniia).
female(svitlana).
female(hanna).
female(nata).

%parentship
parent(ivan,anna).
parent(zlata,anna).
parent(petro,stepan).
parent(mariia,stepan).
parent(sem,nadiia).
parent(judi,nadiia).
parent(sally,ivas).
parent(anna,zenovii).
parent(anna,ihor).
parent(stepan,zenovii).
parent(stepan,ihor).
parent(nadiia,kseniia).
parent(ivas,kseniia).
parent(zenovii,svitlana).
parent(zenovii,rostyslav).
parent(ihor,pedro).
parent(ihor,oleh).
parent(kseniia,mark).
parent(mark,hanna).
parent(mark,nata).

% rules

% X is a child of Y
child(X,Y) :- 
    parent(Y,X).

% X is a mother of Y
mother(X, Y) :- 
    parent(X, Y), 
    female(X).

% X is a father of Y
father(X,Y) :- 
    parent(X, Y), 
    male(X).

sibling(X,Y) :-
    parent(Z, X), 
    parent(Z, Y),
	X @< Y.

% X is a sibling brother of Y
brother(X,Y) :- 
    sibling(X,Y),
    male(X).

% X is a sibling sister of Y
sister(X,Y) :- 
    sibling(X,Y),
    female(X).

% X has a child
haschild(X) :- 
    parent(X, _).

% X is a grandmother of Y
grandmother(X,Y) :- 
    mother(X,Z), 
    parent(Z,Y).

% X is a grandfather of Y
grandfather(X,Y) :- 
    father(X,Z), 
    parent(Z, Y).

% X is a wife of Y
wife(X,Y) :- 
    parent(X,Z), 
    parent(Y,Z),
    female(X), 
    male(Y).

% X is a husband of Y
husband(X,Y) :- 
    wife(Y,X).

% X is a cousin of Y
cousin(X,Y) :- 
    grandmother(Z,X), 
    grandmother(Z,Y), 
    not(sibling(X,Y)),
    X \== Y.

% X is an uncle of Y
uncle(X,Z) :- 
    brother(Y,X),
    parent(Y, Z).

% X is an aunt of Y
aunt(X,Z) :-
    sister(Y,X),
    parent(Y,Z).

% X is a first ancestor of Z
ancestor(X,Z) :- 
    parent(X,Z).

% X is an arbitrary ancestor of Z
ancestor(X,Z) :- 
    parent(X,Y), 
    ancestor(Y,Z).

% X is an arbitrary descendant of Z
descendant(X,Z) :- 
    ancestor(Z,X).
