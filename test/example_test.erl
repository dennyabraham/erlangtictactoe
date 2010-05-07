%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (example_test).

-export ([factorial_tests/0]).

-import(jarl_matchers, [it_should/2, should/1, equal/1]).
    
factorial_tests() -> 
    [   
        it_should("equal one", 
            {factorial(1), should(equal(1))}
        )
        ,
        it_should("equal two", 
            {factorial(2), should(equal(2))}
        )
        ,
        it_should("equal six", 
            {factorial(3), should(equal(6))}
        )
        ,
        it_should("equal one if the input is zero", 
            {factorial(0), should(equal(1))}
        )
        ,
        it_should("equal one if the input is less than zero", 
            {factorial(-12), should(equal(1))}
        )
        
        
    ].

factorial(N) when N =< 1 -> 1;
factorial(N) -> N * factorial(N-1).