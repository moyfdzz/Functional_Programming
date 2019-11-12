-module(hw12).
-export([startAppend/0, appendNumberF/1, 
        factorial/1, receiveBounds/0, calcFac/2,
        startFoF/2, fof/1,
        bankSystem/1, createAccount/2, requestBalance/1, deposit/2, withdraw/2, checkAccounts/0, startBankSystem/0, stopBankSystem/0]).

% Moisés Fernández Zárate A01197049

% 1 Append if positive number

startAppend() -> 
    register(appendNumber, spawn(?MODULE, appendNumberF, [[]])).

appendNumberF(X) ->
    receive
        N when (is_number(N)) and (N > 0) ->
            io:format("Number ~p has been added to the list \n", [N]), appendNumberF([N|X]);
        _ ->
            io:format("The numbers registered by the process are: ~p \n", [X])
    end.

% hw12:startAppend().
% true
% appendNumber ! 5.
% Number 5 has been added to the list .
% 5
% appendNumber ! 10.
% Number 10 has been added to the list .
% 10
% appendNumber ! 14.
% Number 14 has been added to the list .
% 14
% appendNumber ! x.
% The numbers registered by the process are :[14 ,10 ,5].
% x

% 2 Factorial

calcFac(LowerB, UpperB) -> if
    LowerB == UpperB -> UpperB;
    true -> LowerB * calcFac(LowerB + 1, UpperB)
    end.

receiveBounds() ->
    receive
        {Pid, LowerB, UpperB} ->
            Pid ! calcFac(LowerB, UpperB)
    end.

factorial(X) ->
    PidUpper = spawn(?MODULE, receiveBounds, []),
    PidLower = spawn(?MODULE, receiveBounds, []),
    PidLower ! {self(), 1, X/2},

    receive
        N ->
            PidUpper ! {self(), X/2 + 1, X},

            receive 
                R ->
                    N * R
            end
    end.

% hw12:factorial(10).
% 3.6288e6

% 3 Friend or foe

fof(Color)->
    receive
    {Letter, Text} ->
        Letter ! self(),
        receive
            C -> 
                if Color == C ->
                    io:format("Received a message from a friend process ~p : ~p. \n",[whereis(Letter), Text]);
                true->io:format("Process ~p is not my friend. I will ignore its message. \n", [whereis(Letter)])
                end
        end,
        fof(Color);
     Pid -> Pid ! Color,
        fof(Color)
    end.


startFoF(N, Color) ->
    register(N, spawn(?MODULE, fof, [Color])).

% hw12 : startFoF (x , blue ).
% true
% hw12 : startFoF (y , red ).
% true
% hw12 : startFoF (z , blue ).
% true
% x ! {y , " How are you ?"}.
% Process <0.41.0 > is not my friend . I will ignore its message .
% {y ," How are you ?"}
% x ! {z , " How are you ?"}.
% Received a message from a friend process , <0.41.0 >: " How are you ?".
% {z ," How are you ?"}
% z ! {x , " Fine . Thank you "}.
% Received a message from a friend process , <0.45.0 >: " Fine . Thank you ".
% {x ," Fine . Thank you "}

% 4 Marco Polo game


% 5 Shared bank accounts
getAmount([], _) -> 0;
getAmount([{N1, X} | Xs], N2) -> if 
        N1 == N2 ->
            X;
        true ->
            getAmount(Xs, N2)
    end.

depositBank([], _, _) -> [];
depositBank([{N1, A} | Xs], N2, M) -> if
        N1 == N2 ->
            [{N1, A + M} | Xs];
        true ->
            [{N1, A} | depositBank(Xs, N2, M)]
    end.

withdrawBank([], _, _) -> [];
withdrawBank([{N1, A} | Xs], N2, M) -> if
        N1 == N2 ->
            [{N1, A - M} | Xs];
        true ->
            [{N1, A} | withdrawBank(Xs, N2, M)]
    end.

bankSystem(X) -> 
    receive
        {Option, Number, Amount} when Option == create ->
            bankSystem([{Number, Amount}|X]);
        {Option, Pid} when Option == see ->
            Pid ! X, bankSystem(X);
        {Option, Pid, Amount} when Option == requestB ->
            Pid ! getAmount(X, Amount), bankSystem(X);
        {Option, Number, Amount} when Option == deposit ->
            bankSystem(depositBank(X, Number, Amount));
        {Option, Number, Amount} when Option == withdraw ->
            bankSystem(withdrawBank(X, Number, Amount))          
    end.

createAccount(Number, Amount) -> if
        Amount < 500 ->
            io:format("The initial amount to create a bank account must be at least 500 USD. \n");
        true ->
            bid ! {create, Number, Amount},
            io:format("The bank account was created with the number ~p and the initial amount of ~p USD. \n", [Number, Amount])
    end. 

requestBalance(Number) ->
    bid ! {requestB, self(), Number},
    receive
        X ->
            io:format("The current balance on the account ~p is: ~p USD. \n", [Number, X])
    end.

deposit(Number, Amount) -> if
        Amount < 20 ->
            io:format("The deposit amount must be at least 20 USD. \n");
        true ->
            bid ! {deposit, Number, Amount},
            io:format("Deposited ~p USD into the account ~p. \n", [Amount, Number])
    end. 

withdraw(Number, Amount) -> if
        Amount < 1 ->
            io:format("The withdraw amount must be at least 1 USD. \n");
        true ->
            bid ! {withdraw, Number, Amount},
            io:format("Withdrew ~p USD from the account ~p. \n", [Amount, Number])
    end. 

checkAccounts() ->
    bid ! {see, self()},
    receive
        X ->
            io:format("The current balances of all the accounts registered in the system: ~p \n", [X])
    end.

startBankSystem() ->
    register(bid, spawn(?MODULE, bankSystem, [[]])).

stopBankSystem() ->
    unregister(bid).