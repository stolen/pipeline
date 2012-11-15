-module(pipeline_demo).
-export([local/1, remote/2, cut/1, match/1]).
-compile({parse_transform, pipeline}).

x2(X) -> X * 2.
str(X) -> erlang:integer_to_list(X).
print(X) -> io:format("~p~n", [X]), X.

local(Arg) ->
  [
    x2,
    str,
    print
  ](Arg).

remote(Arg1, Arg2) ->
  [ erlang:max,
    erlang:integer_to_list,
    io:format] (Arg1, Arg2).

cut(Arg) ->
  [ erlang:max(__, 8),
    io_lib:format("~B", [__]),
    io:format("~s~n", [__]) ] (Arg).

seq(N) -> lists:seq(1, N).
match(Arg) ->
  Config = [{x, 1}, {y, 2}, {z, 3}],
  [ {_, __} = lists:keyfind(__, 1, Config),
    [1|__] = seq] (Arg).
