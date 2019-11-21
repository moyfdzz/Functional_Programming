square([], []).
square([X], [Y]) :- Y is X^2, !.
square([L | LS], [Z | W]) :- Z is L^2, square(LS, W), !.

sumN(1, 1).
sumN(N, S) :- B is N - 1, sumN(B, SB), S is N + SB, !.

xLength([], 0).
xLength([_ | LS], X) :- xLength(LS, Y), X is 1 + Y, !.

nLength([], 0).
nLength([L | LS], X) :- is_list(L), nLength(L, SS), nLength(LS, SR), X is SS + SR, !.
nLength([_ | LS], X) :- nLength(LS, Y), X is 1 + Y.

dotProduct([X], [Y], R) :- R is X * Y.
dotProduct([X | XS], [Y | YS], R) :- M is X * Y, dotProduct(XS, YS, MS), R is M + MS, !.