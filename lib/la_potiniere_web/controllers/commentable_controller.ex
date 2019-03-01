defmodule LaPotiniereWeb.CommentableController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Commentables.Commentable
  alias LaPotiniere.{
    Commentables,
    Events
  }

  def new(conn, %{"event_id" => event_id}) do
    IO.inspect "dfdsf"
    event = Events.get_event!(event_id) 
    changeset = Commentables.change_commentable(%Commentable{}, event_id)
    render(conn, "new.html", menu: event.menu, changeset: changeset, event_id: event_id, event: event)
  end

  def create(conn, %{"commentable" => commentable_params, "event_id" => event_id}) do
    case Commentables.create_commentable(LaPotiniere.Events.get_event!(event_id), commentable_params) do
      {:ok, commentable} ->
        conn
        |> put_flash(:info, "Ce commentaire à bien été enregistré.")
        |> redirect(to: Routes.event_path(conn, :show, event_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Veuillez remplir tout les champs afin d'enregistrer votre message.")
        |> redirect(to: Routes.event_path(conn, :show, event_id))
    end
  end 
end
