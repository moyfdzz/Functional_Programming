:- use_module(library(clpfd)).

solveAdd(T, W, O, F, U, R) :-
    L = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(T, L),
    member(W, L),
    member(O, L),
    member(F, [O, 1]),
    member(U, L),
    member(R, L),
    R is (O + O) mod 10,
    X1 is (O + O) div 10,
    U is (X1 + W + W) mod 10,
    X2 is (X1 + W + W) div 10,
    O is (X2 + T + T) mod 10,
    F is (X2 + T + T) div 10,
    all_different([T, W, O, F, U, R]), !.

solveOldest(Julio, Gloria, Pablo, Miguel, Silvia) :-
    L = [1, 2, 3, 4, 5],
    member(Julio, L),
    member(Gloria, L),
    member(Pablo, L),
    member(Miguel, L),
    member(Silvia, L),
    Julio > Gloria,
    Julio > Pablo,
    Miguel < Silvia,
    Miguel < Pablo,
    Miguel > Gloria,
    Julio < Silvia, !.

solveFarthest(Mova, Taci, Dape, Liru) :-
    L = [1, 2, 3, 4],
    member(Mova, L),
    member(Taci, L),
    member(Dape, L),
    member(Liru, L),
    Mova > Taci,
    Dape < Liru,
    Liru < Taci, !.

solveFlower(Solution) :-
    length(Solution, 3),
    member([brooke, _], Solution),
    member([virginia, vanity], Solution),
    member([tricia, goldblush], Solution),
    Solution = [_, _, [brooke, _]],
    Solution = [_, _, [_, quietness]],
    Solution = [_, [tricia, _], _].