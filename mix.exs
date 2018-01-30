defmodule PredicateSigil.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @repo_url "https://github.com/meyercm/predicate_sigil"

  def project do
    [
      app: :predicate_sigil,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      package: hex_package(),
      description: "~p sigil for predicate shorthand. `~p(expr) ~> fn expr -> true; _ -> false end`",
      deps: deps(),
      name: "Predicate Sigil",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
    ]
  end

  defp hex_package do
    [maintainers: ["Chris Meyer"],
     licenses: ["MIT"],
     links: %{"GitHub" => @repo_url}]
  end
end
