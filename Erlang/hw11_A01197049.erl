-module(hw11_A01197049).
-export([pow/2, fibonacci/1, reverse/1, count/2]).

% Complete the following functions and submit your file to Canvas.

% ========= IMPORTANT ==========
% Change the name of the file so that it contains your student ID or name.
% Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
% Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
% Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
% If your file cannot be loaded by the Erlang compiler, your grade will be zero. Then, submit only code that works.

% Moisés Fernández Zárate A01197049

% pow (tail recursive version)
pow(N, X) -> powAux(N, X).

powAux(_, 0) -> 1;
powAux(N, 1) -> N;
powAux(N, X) -> N * powAux(N, X - 1).

% Fibonacci (tail recursive version)
fibonacci(X) -> fibonacciAux(X).

fibonacciAux(0) -> 0;
fibonacciAux(1) -> 1;
fibonacciAux(X) -> fibonacciAux(X - 1) + fibonacciAux (X - 2).

% reverse (tail recursive version)
reverse(N) -> reverseAux(N).

reverseAux([]) -> [];
reverseAux([N | Ns]) -> reverseAux(Ns) ++ [N].

% count (tail recursive version
count(N, X) -> countAux(N, X).

countAux([], _) -> 0;
countAux([N|Ns], X) -> if
    N == X -> 1 + countAux(Ns, X);
    true -> countAux(Ns, X)
    end. 

