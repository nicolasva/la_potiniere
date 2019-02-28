defmodule LaPotiniereWeb.CommentableController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.{
    Commentables,
    Events,
  }

  def create(conn, %{"commentable" => commentable_params, "event_id" => event_id}) do
    case Commentables.create_commentable(LaPotiniere.Events.get_event!(event_id), commentable_params) do
      {:ok, commentable} ->
        conn
        |> put_flash(:info, "Ce commentaire à bien été enregistré.")
        |> redirect(to: Routes.event_path(conn, :show, event_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(LaPotiniereWeb.EventView, "show.html", changeset: changeset, id: event_id)
    end
  end 
end
