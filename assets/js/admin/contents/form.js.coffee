$(document).ready ->
  #console.log("nicolas")
  if ("#content_comment").length > 0
    CKEDITOR.replace('content_comment',
      extraPlugins: 'imagebrowser',
      imageBrowser_listUrl: '/ckeditor/ckeditorfiles',
      #filebrowserBrowseUrl: '/ckeditor/ckeditorfiles',
      filebrowserUploadUrl: '/ckeditor/ckeditorfiles'
    )
