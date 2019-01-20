defmodule LaPotiniereWeb.AdminPotiniereWeb.CkeditorFileController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.CkeditorFiles
  alias LaPotiniere.CkeditorFiles.CkeditorFile
  
  def create(conn, _params) do
    IO.inspect "-=-=-=-=-=-=-=-#{_params}"
    #case CkeditorFiles.create_ckeditor_file()
  end
end
