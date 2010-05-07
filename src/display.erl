%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%---------------------------------------------------------------_,

-module (display).

-export ([board/1, board/2, show_board/2, show_board/1]).


show_board(Rows, Matches) -> 
    io:format("~n"),
    io:format(board(Rows, Matches)).
show_board(Rows) ->
    io:format("~n"),
    io:format(board(Rows)).
    
board({InputRow1, InputRow2, InputRow3}, {diagonal, Matches}) ->
    OutputRow1 = cross_out_diagonal_matches(InputRow1, 1, Matches),
    OutputRow2 = cross_out_diagonal_matches(InputRow2, 2, Matches),
    OutputRow3 = cross_out_diagonal_matches(InputRow3, 3, Matches),
    board({OutputRow1, OutputRow2, OutputRow3});    
board({InputRow1, InputRow2, InputRow3}, {vertical, Matches}) ->
    OutputRow1 = cross_out_vertical_matches(InputRow1, Matches),
    OutputRow2 = cross_out_vertical_matches(InputRow2, Matches),
    OutputRow3 = cross_out_vertical_matches(InputRow3, Matches),
    board({OutputRow1, OutputRow2, OutputRow3});    
board({InputRow1, InputRow2, InputRow3}, {horizontal, Matches}) ->
    OutputRow1 = cross_out_horizontal_matches(InputRow1, 1, Matches),
    OutputRow2 = cross_out_horizontal_matches(InputRow2, 2, Matches),
    OutputRow3 = cross_out_horizontal_matches(InputRow3, 3, Matches),
    board({OutputRow1, OutputRow2, OutputRow3}).
    
board({{"","",""},{"","",""},{"","",""}}) ->
    board({{" "," "," "},{" "," "," "},{" "," "," "}});
board({{A1,A2,A3}, {B1,B2,B3}, {C1,C2,C3}}) ->
    " "++ A1 ++ " | " ++ A2 ++ " | " ++ A3 ++ " ~n---+---+---~n " ++ 
          B1 ++ " | " ++ B2 ++ " | " ++ B3 ++ " ~n---+---+---~n " ++ 
          C1 ++ " | " ++ C2 ++ " | " ++ C3 ++ " ".
          
crossed_out_row() -> {"-", "-", "-"}.    

cross_out_horizontal_matches(InputRow, RowNumber, Matches) ->
    case lists:member(RowNumber, Matches) of
        true -> crossed_out_row();
        false -> InputRow
    end.     
     
cross_out_vertical_matches({Col1, Col2, Col3}, Matches) ->
    OutputCol1 = cross_out_vertical_matches(Col1, 1, Matches),
    OutputCol2 = cross_out_vertical_matches(Col2, 2, Matches),
    OutputCol3 = cross_out_vertical_matches(Col3, 3, Matches),
    {OutputCol1, OutputCol2, OutputCol3}.
    
cross_out_vertical_matches(Column, ColNumber, Matches) ->
    case lists:member(ColNumber, Matches) of
        true ->  "|";
        false -> Column
    end.   
    
cross_out_diagonal_matches({Col1, Col2, Col3}, RowNumber, Matches) ->    
    OutputCol1 = cross_out_diagonal_matches(Col1, RowNumber, 1, Matches),
    OutputCol2 = cross_out_diagonal_matches(Col2, RowNumber, 2, Matches),
    OutputCol3 = cross_out_diagonal_matches(Col3, RowNumber, 3, Matches),
    {OutputCol1, OutputCol2, OutputCol3}.
    
cross_out_diagonal_matches(Column, _, _, []) -> Column;
cross_out_diagonal_matches(Column, RowNumber, ColNumber, [FirstMatch | OtherMatch]) ->
    case FirstMatch of
        1 -> 
            Symbol = crossed_out_diagonal_for(Column, RowNumber, ColNumber, FirstMatch),
            cross_out_diagonal_matches(Symbol, RowNumber, ColNumber, OtherMatch);
        2 -> 
            Symbol = crossed_out_diagonal_for(Column, RowNumber, ColNumber, FirstMatch),
            cross_out_diagonal_matches(Symbol, RowNumber, ColNumber, OtherMatch);        
        _ -> Column
    end.
    
crossed_out_diagonal_for(_, 1, 1, 1) -> "\\";
crossed_out_diagonal_for(_, 2, 2, 1) -> "\\";
crossed_out_diagonal_for(_, 3, 3, 1) -> "\\";
crossed_out_diagonal_for(_, 3, 1, 2) -> "/";
crossed_out_diagonal_for(_, 2, 2, 2) -> "/";
crossed_out_diagonal_for(_, 1, 3, 2) -> "/";
crossed_out_diagonal_for(Column, _, _, _) -> Column.




