defmodule Tail.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tail,
      version: "1.0.1",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: [
        readme: "README.md",
        main: "README",
        source_url: "https://github.com/TheFirstAvenger/elixir-tail.git"
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      extra_applications: [:logger, :kafka_ex, :snappy]
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
      {:kafka_ex, "~> 0.8.2"},
      {:snappy, git: "https://github.com/fdmanana/snappy-erlang-nif"},
      {:poison, "~> 3.1"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev}
    ]
  end

  defp description do
    "A simple file tail functionality. Calls a callback function whenever new lines are detected on a file."
  end

  defp package do
    [
      contributors: ["Mike Binns", "Jordan Day"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/TheFirstAvenger/elixir-tail.git"}
    ]
  end
end
