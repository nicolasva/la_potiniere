$(document).ready ->
  #console.log("nicolas")
  if ("#content_comment").length > 0
    CKEDITOR.replace('content_comment',
      filebrowserUploadUrl: '/ckeditor/ckeditorfiles'
    )
