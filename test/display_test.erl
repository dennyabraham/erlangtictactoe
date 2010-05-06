%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%---------------------------------------------------------------e,

-module (display_test).

-export ([tests/0]).

-import (jarl_matchers, [it_should/2, should/1, equal/1]).

tests() -> 
    [ 
        it_should("construct an empty board", 
            {display:board({{e, e, e},{e, e, e},{e, e, e}}), should(equal(empty_board()))}
        )
    ].
    
empty_board() -> 
    " - | - | - ~n---+---+---~n  - | - | - ~n---+---+---~n - | - | - ".