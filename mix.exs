defmodule Backdoor.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :backdoor,
      version: @version,
      elixir: "~> 1.7",
      compilers: Mix.compilers(),
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      package: package(),
      name: "Backdoor",
      docs: docs(),
      homepage_url: "https://github.com/amberbit/backdoor",
      description: "Web console for Elixir & Phoenix applications.",
      aliases: aliases()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Backdoor.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      dev: "run --no-halt dev.exs"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_view, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.5", only: :dev},
      {:plug_cowboy, "~> 2.7", only: :dev},
      {:jason, "~> 1.4", only: [:dev, :test, :docs]},
      {:floki, "~> 0.37", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:stream_data, "~> 0.5", only: :test},
      {:puid, "~> 1.0"}
    ]
  end

  defp docs do
    [
      main: "Backdoor",
      source_ref: "v#{@version}",
      source_url: "https://github.com/amberbit/backdoor",
      extra_section: "GUIDES",
      extras: extras(),
      nest_modules_by_prefix: [Backdoor]
    ]
  end

  defp extras do
    []
  end

  defp package do
    [
      maintainers: ["Hubert Łępicki"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/amberbit/backdoor"},
      files: ~w(lib priv CHANGELOG.md LICENSE.md mix.exs README.md)
    ]
  end
end
