%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (game_test).

-export ([run/0]).

-import(jarl_matchers, [it_should/2, should/1, equal/1]).

run() ->
    jarl_runner:run(tests()).
    
tests() -> 
    [ 
        it_should("equal four", 
            {game:four(), should(equal(4))}
        )
    ].
    