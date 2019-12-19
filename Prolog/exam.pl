enigmaA(X , X , [X]).
enigmaA(X , Y , [ Y | L ]) :- X =< Y, Z is Y - 1 , enigmaA(X , Z , L ), !.

enigmaB([], _, []).
enigmaB(_, [], []).
enigmaB([X | Xs], [Y | Ys] , [[X, Y, Z] | W]) :- Z is X + Y,
enigmaB(Xs, Ys, W), !.

solveHorseRace(Lino, Rubi, Sam, Mac, Chato, Lulo, Curcho, Toto) :-
    L = [1, 2, 3, 4, 5, 6, 7, 8],
    member(Lino, L),
    member(Rubi, L),
    member(Sam, L),
    member(Mac, L),
    member(Chato, L),
    member(Lulo, L),
    member(Curcho, L),
    member(Toto, L),
    Lino = Rubi + 3,
    Lino > Sam,
    Mac < Chato,
    Mac > Rubi,
    Lulo = Chato - 3,
    Curcho = between(6, 8),
    Toto = Sam + 1, !.