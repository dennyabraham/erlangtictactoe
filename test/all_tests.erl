%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (all_tests).

-export ([run/0]).

-import(jarl_runner, [run/1]).

run() ->
    % io:format("~n::Example Tests::~n"),
    % run(example_test:tests()),
    % io:format("~n::Game Tests::~n"),
    % run(game_test:tests()),
    io:format("~n::Display Tests::~n"),
    run(display_test:tests()).
