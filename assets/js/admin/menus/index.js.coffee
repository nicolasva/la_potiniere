jQuery ->
  $("#menus_list").sortable({
    items: '.menus',
    update: ->
      $.ajax({
        url: "/admin/menus/sorts",
        update: "GET",
        data: $(this).sortable('serialize'),
        failure: ->
          alert("Problem sortable list menus")
      })
  })
