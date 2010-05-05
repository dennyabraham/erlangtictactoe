%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------

-module (jarl_runner).

-export ([run/1]).

run(Tests) ->
    Results = run_all(Tests),
    display(Results).

run_all([]) -> 
    [];
run_all([FirstTest | RemainingTests]) ->
    [run_test(FirstTest) | run_all(RemainingTests)].
    
run_test({Message, Test}) ->
    try Test() of
        Result -> {success, Result, Message, nothing}
    catch
        _:Reason -> {failure, Reason, Message, erlang:get_stacktrace()}
    end.
    
display(Results) ->
    {Successes, Failures} = process(Results),
    io:format(" ~n~w Successes:~n", [length(Successes)]),
    display_successes(lists:reverse(Successes)),
    io:format(" ~n~w Failures:~n", [length(Failures)]),
    display_failures(lists:reverse(Failures)).
    
process(Results) ->
    process(Results, [], []).
    
process([], Successes, Failures) ->
    {Successes, Failures};
process([{success, Result, Message, Something} | RemainingResults], Successes, Failures) ->
    process(RemainingResults, [{success, Result, Message, Something} | Successes], Failures);
process([{failure, Result, Message, StackTrace} | RemainingResults], Successes, Failures) ->
    process(RemainingResults, Successes, [{failure, Result, Message, StackTrace} | Failures]).

display_successes([]) -> 
    done;
display_successes([{success, _, Message, _} | RemainingSuccesses]) ->
    io:format(" * Success:~n"),
    io:format("   It did ~s~n", [Message]),
    display_successes(RemainingSuccesses).

display_failures([]) -> 
    done;
display_failures([{failure, Reason, Message, StackTrace} | RemainingFailures]) ->
    io:format(" * Failure:~n"),
    io:format("   Expected it to ~s~n", [Message]),
    io:format("   ~w~n", [Reason]),
    io:format("   ~w~n", [StackTrace]),
    display_failures(RemainingFailures).

    