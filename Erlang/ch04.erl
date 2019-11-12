-module(ch04).
-import(timer, [send_after/3]).
-import(lists, [sum/1]).
-export([respond/0, doMath/3, startCalculator/1, calculate/1, add/1, multiply/1, subtract/1, divide/1, getResult/0, startClock/0, tic/0, tac/0, stopClock/0, sumConcurrentAux/0, sumConcurrent/1]).

% Respond to specific messages

respond() ->
    receive
        X when is_number(X) ->
            io:format("~p~n", [X + 1]),
            respond();
        _ ->
            io:format("Bye \n")
    end.

% Pid = spawn(ch04, respond, []).
% Pid ! 10.
% 11
% 10
% Pid ! a.

% Using processes to perform mathematical operations

sumNumbers() ->
    receive
        {Pid, Y, Z} ->
            Pid ! (Y + Z)
    end.

multipltyNumbers() ->
    receive
        {Pid, X, S} ->
            Pid ! (X * S)
    end.

doMath(X, Y, Z) ->
    PidS = spawn(fun sumNumbers/0),
    PidM = spawn(fun multipltyNumbers/0),
    PidS ! {self(), Y, Z},

    receive
        S ->
            PidM ! {self(), X, S}
    end,

    receive
        R ->
            R
    end.

% ch04:doMath(5,6,7).
% 65

% Calculator
calculate(X) ->
    receive
        {"+", N} ->
            calculate(X + N);
        {"-", N} ->
            calculate(X - N);
        {"*", N} ->
            calculate(X * N);
        {"/", N} ->
            calculate(X / N);
        {"f", _} ->
            io:format("The result is ~p~n", [X])
    end.

startCalculator(X) ->
    register(calculator, spawn(?MODULE, calculate, [X])).

add(X) -> calculator ! {"+", X}.

subtract(X) -> calculator ! {"-", X}.

multiply(X) -> calculator ! {"*", X}.

divide(X) -> calculator ! {"/", X}.

getResult() -> calculator ! {"f", 0}, io:format("finish \n").

% ch04:startCalculator(0).
% true
% ch04:add(5).
% {"+",5}
% ch04:multiply(2).
% {"*",2}
% ch04:subtract(4).
% {"-",4}
% ch04:divide(2).  
% {"/",2}
% ch04:getResult().
% finish
% The result is 3.0

% Tic-tac clock

startClock() ->
    register(ticid, spawn(?MODULE, tic, [])),
    register(tacid, spawn(?MODULE, tac, [])),
    ticid ! 0.

tic() ->
    receive
        1 ->
            io:format("Stopped Tic.... \n", []);
        _ ->
            io:format("Tic.... \n", []),
            send_after(1000, tacid, 0),
            tic()
    end.

tac() ->
    receive
        1 ->
            io:format("Stopped Tac.... \n", []);
        _ ->
            io:format("Tac.... \n", []),
            send_after(1000, ticid, 0),
            tac()
    end.

stopClock() ->
    ticid ! 1,
    tacid ! 1.

% ch04:startClock().
% Tic....
% 0
% Tac....
% Tic....
% Tac....
% Tic....
% Tac....               
% Tic....              
% ch04:stopClock().
% Stopped Tic....
% Stopped Tac....
% 1

% Summing the elements of a list

sumConcurrentAux() ->
    receive
        {Pid, X} ->
            Pid ! sum(X)
    end.

sumConcurrent(X) ->
    register(sumid, spawn(?MODULE, sumConcurrentAux, [])),
    sumid ! {self(), X},

    receive
        N ->
            N
    end.

% 1 + ch04:sumConcurrent([1,2,3,4]).
% 11