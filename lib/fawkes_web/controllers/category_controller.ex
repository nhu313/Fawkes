defmodule FawkesWeb.CategoryController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def index(conn, _params) do
    categories = Schedule.all_category()
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Schedule.category_changeset())
  end

  def create(conn, %{"category" => params}) do
    case Schedule.create_category(params) do
      {:ok, _category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: category_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Schedule.get_category!(id)
    render(conn, "show.html", category: category)
  end

  def delete(conn, %{"id" => id}) do
      category = Schedule.get_category!(id)
      {:ok, _category} = Schedule.delete_category(category)

      conn
      |> put_flash(:info, "Category deleted.")
      |> redirect(to: category_path(conn, :index))
  end
end
