# PredicateSigil


`PredicateSigil` is sugar to condense pattern-matching predicate lambdas.  E.g.:

`~p(%Mystruct{})` is equivalent to:

```elixir
fn %MyStruct{} -> true
             _ -> false
end
```

This is especially useful for methods in the `Enum` module, like `filter` and
`reject`


`{:predicate_sigil, "~> 0.1.0"},`
