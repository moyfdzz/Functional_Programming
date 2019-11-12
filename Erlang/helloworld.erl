-module(helloworld). 
-export([start/0]). 
start() -> 
   Pid = spawn(fun() -> server("Hello") end), 
   Pid ! {hello}. 

server(Message) ->
   io:fwrite("~p",[Message]).