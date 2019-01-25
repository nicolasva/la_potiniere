defmodule LaPotiniereWeb.AdminPotiniereWeb.CkeditorFileController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.CkeditorFiles
  alias LaPotiniere.CkeditorFiles.CkeditorFile
 
  def index(conn, _params) do
    ckeditor_files = CkeditorFiles.list_ckeditor_files()
    render(conn, "index.json", ckeditor_files: ckeditor_files)
  end

  def create(conn, _params) do
    ckeditor_file = %{"ckeditor_file" => %{"file" => _params["upload"]}}
    case CkeditorFiles.create_ckeditor_file(ckeditor_file["ckeditor_file"]) do
      {:ok, ckeditor_file} ->
        render(conn, "create.json", ckeditor_file: ckeditor_file)
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "create_error.json", ckeditor_file: %{"uploaded" => 0, "error" => %{ "message" => "The file is too big."}})
    end
  end
end
