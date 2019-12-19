:- use_module(library(clpfd)).

duplicate([], []).
duplicate([L | LS], X) :- append([L], [L], O), duplicate(LS, P), append(O, P, X), !.

sum([], 0).
sum([L | LS], X) :- is_list(L), sum(LS, S), X is S, !.
sum([L | LS], X) :- sum(LS, S), X is S + L, !.

toBinaryString(0, "0").
toBinaryString(1, "1").
toBinaryString(N, X) :- 0 is mod(N, 2), D is div(N, 2), toBinaryString(D, B), atom_concat(B, "0", X), !.
toBinaryString(N, X) :- 1 is mod(N, 2), D is div(N, 2), toBinaryString(D, B), atom_concat(B, "1", X), !.

edge(e, f, 5).
edge(a, b, 4).
edge(b, d, 3).
edge(d, e, 2).
edge(b, c, 3).
edge(a, d, 1).

path(X, Y, [X | Y], C) :- edge(X, Y, C).
path(X, Y, [X | LS], C) :- edge(X, Z, C1), path(Z, Y, LS, C2), C is C1 + C2.

magicSquare([[N1, N2, N3], [N4, N5, N6], [N7, N8, N9]]) :-
    L = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(N1, L),
    member(N2, L),
    member(N3, L),
    member(N4, L),
    member(N5, L),
    member(N6, L),
    member(N7, L),
    member(N8, L),
    member(N9, L),
    all_different([N1, N2, N3, N4, N5, N6, N7, N8, N9]),
    15 is N1 + N2 + N3,
    15 is N4 + N5 + N6,
    15 is N7 + N8 + N9,
    15 is N1 + N4 + N7,
    15 is N2 + N5 + N8,
    15 is N3 + N6 + N9,
    15 is N1 + N5 + N9,
    15 is N3 + N5 + N7.    
    
right(X, Y, L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 is Y1 + 1.

next(X, Y, L) :-
    right(X, Y, L);
    right(Y, X, L).

solveEinstein(Solution) :-
    length(Solution, 5),
    member([red, _, _, _, englishman], Solution),
    member([_, dogs, _, _, sweede], Solution),
    member([_, _, tea, _, dane], Solution),
    right([green, _, _, _, _], [white, _, _, _, _], Solution),
    member([green, _, coffee, _, _], Solution),
    member([_, birds, _, pallmall, _], Solution),
    member([yellow, _, _, dunhills, _], Solution),
    Solution = [_, _, [_, _, milk, _, _], _, _],
    Solution = [[_, _, _, _, norwegian], _, _, _, _],
    next([_, cats, _, _, _], [_, _, _, blend, _], Solution),
    member([_, _, beer, bluemaesters, _], Solution),
    next([_, _, _, dunhills, _], [_, horses, _, _, _], Solution),
    member([_, _, _, prince, german], Solution),
    next([_, _, _, _, norwegian], [blue, _, _, _, _], Solution),
    next([_, _, water, _, _], [_, _, _, blend, _], Solution),
    member([_, fish, _, _, _], Solution), !.