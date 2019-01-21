defmodule LaPotiniereWeb.AdminPotiniereWeb.CkeditorFileController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.CkeditorFiles
  alias LaPotiniere.CkeditorFiles.CkeditorFile
  
  def create(conn, _params) do
    ckeditor_file = %{"ckeditor_file" => %{"file" => _params["upload"]}}
    #case CkeditorFiles.create_ckeditor_file(ckeditor_file["ckeditor_file"]) do
      #{:ok, ckeditor_file} ->
      #{:error, %Ecto.Changeset{} = changeset} ->
    #end
  end
end
