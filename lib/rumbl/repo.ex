defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In-memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "John Smith", username: "jsmith1", password: "smithy"},
      %Rumbl.User{id: "2", name: "Jane Smith", username: "jsmith2", password: "janejane"},
      %Rumbl.User{id: "3", name: "Foo Bar", username: "foomaster", password: "foofooyou"},
      %Rumbl.User{id: "4", name: "Oren Kanner", username: "orenyk", password: "you'llneverguess"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), fn map -> map.id == id end)
  end

  def get_by(module, params) do
    Enum.find(all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
