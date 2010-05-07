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
            {display:board({{"", "", ""},{"", "", ""},{"", "", ""}}), should(equal(empty_board()))}
        ),
        
        it_should("construct an arbitrary board", 
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}}), should(equal(arbitrary_board()))}
        ),
        
        it_should("cross out all horizontal matches",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{horizontal, [1,2,3]}), should(equal(horizontal_rows()))}
        ),
        
        it_should("cross out only what matches horizontally",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{horizontal, [1,3]}), should(equal(rows_1_and_3()))}
        ),
        
        it_should("cross out all vertical matches",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{vertical, [1,2,3]}), should(equal(vertical_matches()))}
        ),

        it_should("cross out only what matches vertically",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{vertical, [1,2]}), should(equal(cols_1_and_2()))}
        ),
        
        it_should("cross out all diagonal matches",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{diagonal, [1,2]}), should(equal(diagonal_matches()))}
        ),
        
        it_should("cross out only what matches diagonally",
            {display:board({{"a","b", "c"},{"d", "e", "f"},{"g", "h", "i"}},{diagonal, [2]}), should(equal(diag_2()))}
        )
    ].
    
empty_board() -> 
    "   |   |   ~n---+---+---~n   |   |   ~n---+---+---~n   |   |   ".

arbitrary_board() -> 
    " a | b | c ~n---+---+---~n d | e | f ~n---+---+---~n g | h | i ".
    
horizontal_rows() -> 
    " - | - | - ~n---+---+---~n - | - | - ~n---+---+---~n - | - | - ".
    
rows_1_and_3() -> 
    " - | - | - ~n---+---+---~n d | e | f ~n---+---+---~n - | - | - ".

vertical_matches() -> 
    " | | | | | ~n---+---+---~n | | | | | ~n---+---+---~n | | | | | ".
    
cols_1_and_2() ->
    " | | | | c ~n---+---+---~n | | | | f ~n---+---+---~n | | | | i ".

diagonal_matches() ->
    " \\ | b | / ~n---+---+---~n d | / | f ~n---+---+---~n / | h | \\ ".
    
diag_2() -> 
    " a | b | / ~n---+---+---~n d | / | f ~n---+---+---~n / | h | i ".
    