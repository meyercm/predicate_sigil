defmodule PredicateSigil do
  @moduledoc """
  PredicateSigil is sugar to condense pattern-matching predicate lambdas.  E.g.:

  `fn %MyStruct{} -> true; _ -> false end`

  is equivalent to:

  `~p(%Mystruct{})`
  """

  @doc """
  Predicate Sigil. Expands to an arity-1 lambda that returns true only when
  pattern-matching the sigil string.

  ## Examples

      iex> import PredicateSigil
      ...> [1,2,3,4] |> Enum.reject(~p(2))
      [1, 3, 4]

      iex> import PredicateSigil
      ...> [{1,2}, {1,2,3}, {3,4}] |> Enum.filter(~p({_, _})) # keep size-2 tuples
      [{1, 2}, {3, 4}]

      # supports inverting result
      iex> import PredicateSigil
      ...> f = ~p(!"blah")
      ...> f.("blah")
      false
      ...> f.("foo")
      true

  """
  defmacro sigil_p({:<<>>, [line: line], ["!" <> string]}, _modifiers) do
    final_string = "fn #{string} -> false; _ -> true end"
    Code.string_to_quoted!(final_string, file: __ENV__.file, line: line)
  end
  defmacro sigil_p({:<<>>, [line: line], [string]}, _modifiers) do
    final_string = "fn #{string} -> true; _ -> false end"
    Code.string_to_quoted!(final_string, file: __ENV__.file, line: line)
  end
end
