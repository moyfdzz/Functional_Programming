insertionSortAux(N, [], [N]) :- !.
insertionSortAux(N, [L | LS], [N, L | LS]) :- N =< L, !.
insertionSortAux(N, [X | L2], [X | L1]) :- insertionSortAux(N, L2, L1).

insertionSort([], []) :- !.
insertionSort([L | LS], X) :- insertionSort(LS, O), insertionSortAux(L, O, X).

travellingTime(A, B, C) :-
    A is 4,
    C is A - 1,
    B is 2 * (C + C).

fightingCell(Vegeta, Gohan, Goku) :-
    L = [0, 1, 2],
    member(Vegeta, L),
    member(Gohan, L),
    member(Goku, L),
    Vegeta > Gohan,
    Goku < Gohan, !.