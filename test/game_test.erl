%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (game_test).

-export ([tests/0]).

-import(jarl_matchers, [it_should/2, should/1, equal/1]).

tests() -> 
    [ 
        % it_should("equal four", 
        %     {game:four(), should(equal(4))}
        % )
    ].
    