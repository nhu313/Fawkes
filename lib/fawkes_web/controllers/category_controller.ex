defmodule FawkesWeb.CategoryController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def index(conn, _params) do
    categories = Schedule.all_category()
    render(conn, "index.html", categories: categories)
  end

end
