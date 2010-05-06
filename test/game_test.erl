%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (game_test).

-export ([tests/0]).

-import(jarl_matchers).

tests() -> 
    [ 
        it_should("equal four", 
            {game:four(), should(equal(4))}
        )
    ].
    