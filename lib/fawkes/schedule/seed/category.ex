defmodule Fawkes.Schedule.Seed.Category do
  alias Fawkes.Schedule.Category
  alias Fawkes.Repo

  def perform do
    Enum.each(data(), fn(attrs) ->
      %Category{}
      |> Category.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "blockchain",
        name: "Blockchain"
      },
      %{
        slug: "bots",
        name: "Bots"
      },
      %{
        slug: "code_quality",
        name: "Code Quality"
      },
      %{
        slug: "deployment",
        name: "Deployment"
      },
      %{
        slug: "distributed_systems",
        name: "Distributed Systems"
      },
      %{
        slug: "elixir",
        name: "Elixir"
      },
      %{
        slug: "genstage",
        name: "GenStage"
      },
      %{
        slug: "hex",
        name: "Hex"
      },
      %{
        slug: "keynote",
        name: "Keynote"
      },
      %{
        slug: "nerves",
        name: "Nerves",
        icon_url: "https://nhu313.github.io/phoenix_basic_instructions/images/icons/nerves.svg"
      },
      %{
        slug: "nif",
        name: "NIF"
      },
      %{
        slug: "phoenix",
        name: "Phoenix",
        icon_url: "https://nhu313.github.io/phoenix_basic_instructions/images/icons/phoenix.svg"
      },
      %{
        slug: "production",
        name: "Production"
      },
      %{
        slug: "testing",
        name: "Testing"
      },
      %{
        slug: "ui",
        name: "UI"
      },
      %{
        slug: "otp",
        name: "OTP",
        icon_url: "https://nhu313.github.io/phoenix_basic_instructions/images/icons/otp.svg"
      },
      %{
        slug: "monitoring",
        name: "Monitoring"
      }
    ]
  end
end
