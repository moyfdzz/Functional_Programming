-module(cw07).
-import(lists,[sum/1]).
-import(lists,[filter/2]).
-import(lists,[map/2]).
-export([removeList/2, sumElements/1, quicksort/1, transpose/1, degrees/1,averages/1]).

% 1 - Removing the first n elements from a list
removeList(_, []) -> [];
removeList(N, L) -> if
    N =< 0 -> L;
    N > 0 -> removeList(N - 1, tl(L));
    true -> io:format("Sum")
    end.

% 2 - Summing all the elements in a list
sumElements([]) -> [];
sumElements([X]) -> X;
sumElements([Elem | Rest]) -> Elem + sumElements(Rest). 

% 3 - Calculating the transpose of a matrix
transpose([[]|_]) -> [];
transpose(M) -> [ (map (fun([X|_]) -> X end, M)) | transpose(map (fun([_|X]) -> X end, M)) ].

% 4 - Sorting the elements in a list
quicksort([]) -> [];
quicksort([Partition | Rest]) ->
    quicksort([X || X <- Rest, X < Partition]) ++
      [Partition] ++
	quicksort([X || X <- Rest, X >= Partition]).

% 5 - Obtaining the degrees of a node
degrees([]) -> [];
degrees([X | Xs]) -> [(length(X) -1) | degrees(Xs)].

% 6 - Table summarization
averages([]) -> [{"Males", 0}, {"Females", 0}];
averages(X) -> [
    {"Males", 
    sum
        (map 
            (fun({_, He}) -> He end, (filter(fun({Gen, _}) -> Gen == "Male" end, X)))
        ) / (length (filter(fun({Gen, _}) -> Gen == "Male" end, X)))},
    
    {"Females",
    sum 
        (map 
            (fun({_, He}) -> He end, filter(fun({Gen, _}) -> Gen == "Female" end, X))) 
            / (length (filter(fun({Gen, _}) -> Gen == "Female" end, X)))}
    ].