%%%----------------------------------------------------------------
%%% @author denny abraham <email@dennyabraham.com>
%%% @doc
%%%
%%% @end
%%% @copyright 2010 Denny Abraham
%%%----------------------------------------------------------------,

-module (jarl_matchers).

-export ([it_should/2, should/1, equal/1]).

    
it_should(Message, Assertion) ->
    {Message, process_assertion(Assertion)}.
    
should(Matcher) -> 
    {should, Matcher}.
    
equal(Entity) -> 
    fun(Value) -> Entity = Value end.

process_assertion({Function, {should, Matcher}}) -> 
    fun() -> Matcher(Function) end.
