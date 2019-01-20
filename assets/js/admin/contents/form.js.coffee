$(document).ready ->
  #console.log("nicolas")
  CKEDITOR.replace('content_comment',
    filebrowserUploadUrl: '/admin/ckeditorfiles'
  )
