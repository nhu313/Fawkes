defmodule Fawkes.Agenda do
  @moduledoc """
  The Agenda context.
  """

  import Ecto.Query, warn: false
  alias Fawkes.Repo

  alias Fawkes.Agenda.UserTalk
  alias Fawkes.Schedule.Talk

  def list_talk_for_user(%{id: id}) do
    Talk
    |> preload([:slot, :speakers, :categories, :audience, :location])
    |> join(:inner, [talk], user_talk in UserTalk, user_talk.talk_id == talk.id)
    |> Repo.all()
  end


  @doc """
  Returns the list of users_talks.

  ## Examples

      iex> list_users_talks()
      [%UserTalk{}, ...]

  """
  def list_users_talks do
    Repo.all(UserTalk)
  end

  @doc """
  Gets a single user_talk.

  Raises `Ecto.NoResultsError` if the User talk does not exist.

  ## Examples

      iex> get_user_talk!(123)
      %UserTalk{}

      iex> get_user_talk!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_talk!(id), do: Repo.get!(UserTalk, id)

  @doc """
  Creates a user_talk.

  ## Examples

      iex> create_user_talk(%{field: value})
      {:ok, %UserTalk{}}

      iex> create_user_talk(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_talk(attrs \\ %{}) do
    %UserTalk{}
    |> UserTalk.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_talk.

  ## Examples

      iex> update_user_talk(user_talk, %{field: new_value})
      {:ok, %UserTalk{}}

      iex> update_user_talk(user_talk, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_talk(%UserTalk{} = user_talk, attrs) do
    user_talk
    |> UserTalk.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserTalk.

  ## Examples

      iex> delete_user_talk(user_talk)
      {:ok, %UserTalk{}}

      iex> delete_user_talk(user_talk)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_talk(%UserTalk{} = user_talk) do
    Repo.delete(user_talk)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_talk changes.

  ## Examples

      iex> change_user_talk(user_talk)
      %Ecto.Changeset{source: %UserTalk{}}

  """
  def change_user_talk(%UserTalk{} = user_talk) do
    UserTalk.changeset(user_talk, %{})
  end
end
