defmodule FawkesWeb.SharedView do
  use FawkesWeb, :view

  def full_name(people) when is_list(people) do
    people
    |> Enum.map(&full_name/1)
    |> Enum.join(" && ")
  end

  def full_name(person) do
    person.first <> " " <> person.last
  end
end
