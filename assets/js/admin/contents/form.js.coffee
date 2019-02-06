$(document).ready ->
  #console.log("nicolas")
  if ("#ckeditor_text").length > 0
    CKEDITOR.replace('ckeditor_text',
      extraPlugins: 'imagebrowser',
      imageBrowser_listUrl: '/ckeditor/ckeditorfiles',
      #filebrowserBrowseUrl: '/ckeditor/ckeditorfiles',
      filebrowserUploadUrl: '/ckeditor/ckeditorfiles'
    )
