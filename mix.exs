defmodule IntellijElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :intellij_elixir,
      deps: deps(),
      description: description(),
      docs: docs(),
      elixir: "~> 1.9",
      package: package(),
      version: "2.3.0",
      releases: releases()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {IntellijElixir, []}
    ]
  end

  def cli do
  [
    preferred_envs: [credo: :test, dialyzer: :test]
  ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:credo, "~> 1.7.14", only: :test},
      {:dialyxir, "~> 1.4.7", only: :test, runtime: false},
      {:ex_doc, "~> 0.39.3", only: [:dev, :test], runtime: false},
      {:burrito, "~> 1.5"}
    ]
  end

  defp description do
    """
    IntellijElixir allows intellij-elixir to ask Elixir for the native quoted form of code to check that
    intellij-elixir's quoted form matches.
    """
  end

  defp docs do
    [
      extras: extras()
    ]
  end

  defp extras do
    [
      "CHANGELOG.md",
      "LICENSE.md",
      "README.md",
      "UPGRADING.md"
    ]
  end

  defp package do
    [
      file: ["lib", "mix.exs" | extras()],
      licenses: ["Apache 2.0"],
      links: %{
        "Docs" => "https://hexdocs.pm/intellij_elixir",
        "Github" => "https://github.com/KronicDeth/intellij_elixir"
      },
      maintainers: [
        "Luke Imhoff"
      ]
    ]
  end

  def releases do
    [
      intellij_elixir: [
        applications: [runtime_tools: :permanent, logger: :permanent],
        cookie: "intellij_elixir",
        include_erts: true,
        strip_beams: false
      ],
      intellij_elixir_burrito: [
        applications: [runtime_tools: :permanent, logger: :permanent],
        cookie: "intellij_elixir",
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            darwin_amd64: [os: :darwin, cpu: :x86_64],
            darwin_arm64: [os: :darwin, cpu: :aarch64],
            linux_amd64: [os: :linux, cpu: :x86_64],
            linux_arm64: [os: :linux, cpu: :aarch64],
            windows_amd64: [os: :windows, cpu: :x86_64],
            windows_arm64: [os: :windows, cpu: :aarch64]
          ]
        ]
      ]
    ]
  end
end
