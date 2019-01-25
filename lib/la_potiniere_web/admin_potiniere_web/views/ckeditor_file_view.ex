defmodule LaPotiniereWeb.AdminPotiniereWeb.CkeditorFileView do
  use LaPotiniereWeb.AdminPotiniereWeb, :view

  def render("create.json", %{ckeditor_file: ckeditor_file}) do
    #ckeditor_file
    ckeditor_file_json(ckeditor_file)
  end

  def render("create_error.json", %{ckeditor_file: ckeditor_file}) do
    ckeditor_file
  end

  def render("index.json", %{ckeditor_files: ckeditor_files}) do
    Enum.map(ckeditor_files, &ckeditor_file_browser/1)
  end

  def ckeditor_file_json(ckeditor_file) do
    %{
      uploaded: 1,
      fileName: ckeditor_file.file.file_name,
      url: LaPotiniere.CkeditorFile.url({ckeditor_file.file, ckeditor_file}, :original)
    }
  end

  def ckeditor_file_browser(ckeditor_file) do
    %{
      "image": LaPotiniere.CkeditorFile.url({ckeditor_file.file, ckeditor_file}, :original),
      "thumb": LaPotiniere.CkeditorFile.url({ckeditor_file.file, ckeditor_file}, :thumb),
      "folder": "color"
    }
  end
end
