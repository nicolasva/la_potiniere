jQuery ->
  $("#menus_list").sortable({
    items: '.menus',
    update: ->
      $.ajax({
        url: "/admin/menus/:menu_id/sorts",
        update: "GET",
        data: $(this).sortable('serialize'),
        failure: ->
          alert("Problem sortable list menus")
      })
  })
