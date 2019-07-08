defmodule LaPotiniereWeb.CommentableController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Commentables.Commentable
  alias LaPotiniere.{
    Commentables,
    Events
  }

  def index(conn, %{"event_id" => event_id}) do
    render(conn, "index.html", commentables: Commentables.list_commentables(Events.get_event!(event_id)))
  end

  def new(conn, %{"event_id" => event_id}) do
    #IO.inspect "nicolas"
    event = Events.get_event!(event_id) 
    changeset = Commentables.change_commentable(%Commentable{}, event.id)
    render(conn, "new.html", menu: event.menu, changeset: changeset, event: event)
  end

  def create(conn, %{"commentable" => commentable_params, "event_id" => event_id}) do
    case Commentables.create_commentable(LaPotiniere.Events.get_event!(event_id), commentable_params) do
      {:ok, commentable} ->
        conn
        |> put_flash(:info, "Ce commentaire à bien été enregistré.")
        |> redirect(to: Routes.event_path(conn, :show, event_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect changeset
        render(conn, "new.html", changeset: changeset, menu: LaPotiniere.Events.get_event!(event_id).menu, event: LaPotiniere.Events.get_event!(event_id), event_id: event_id)
        #|> put_flash(:error, "Veuillez remplir tout les champs afin d'enregistrer votre message.")
        #|> redirect(to: Routes.event_path(conn, :show, event_id))
    end
  end 
end
