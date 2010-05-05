%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (example_test).

-export ([run/0]).

-import(jarl_matchers, [it_should/2, should/1, equal/1]).

run() ->
    jarl_runner:run(tests()).
    
tests() -> 
    [ 
        it_should("equal four", 
            {four(), should(equal(4))}
        ),
        
        it_should("equal five", 
            {four(), should(equal(5))}
        ),

        it_should("equal seven", 
            {four(), should(equal(7))}
        )
    ].
    
four() -> 4.