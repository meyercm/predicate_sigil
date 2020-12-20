# PredicateSigil


`PredicateSigil` is sugar to condense pattern-matching predicate lambdas.  E.g.:

`~p(%Mystruct{})` is equivalent to:

```elixir
fn %MyStruct{} -> true
             _ -> false
end
```



This is especially useful for methods in the `Enum` and `Stream` modules, like `filter` and
`reject`, `take_while`, `drop_while`, etc.

To negate a pattern, throw a `!` in front of your pattern:

```elixir
iex> import PredicateSigil # Don't forget!
...> Enum.take_while([1,2,3,4,:error, :garbage, 7, :corrupted_results], ~p(!:error))
[1,2,3,4]
```

Add to your mix deps: 
```elixir
[
  {:predicate_sigil, "~> 0.2.0"},
]
```
