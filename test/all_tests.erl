%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (all_tests).

-export ([run/0]).

run() ->
    io:format("~n::Example Tests::~n"),
    example_test:run(),
    io:format("~n::Game Tests::~n"),
    game_test:run().
