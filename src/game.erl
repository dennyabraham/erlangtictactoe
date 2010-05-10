%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (game).

-export ([play/0]).

play() -> 
    Arguments = "",
    play(Arguments).

play(Arguments) -> 
    GameOver = true,
    case GameOver of
        true -> game_over;
        false -> play(Arguments)
    end.