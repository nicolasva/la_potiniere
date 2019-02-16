jQuery ->
  unless location_ajax(window.location.href)
    get_id_for_sortable_item(window.location.href).sortable({
      items: get_id_sortable(window.location.href),
      update: ->
        $.ajax({
          url: location_ajax(window.location.href),
          update: "GET",
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list menus")
        })
    })
  else
    return false

get_id_sortable = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    return ".#{get_page[0][0]}"
  else
    return false

get_id_for_sortable_item = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    return $("##{get_page[0][0]}_list")
  else
    return $("")

location_ajax = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    if get_page[0][0] == 'menus' then return "/admin/menus/sorts"
    if get_page[0][0] == 'contents' then  return "/admin/menus/#{get_menu_id(location_href)}/contents/sorts"
    if get_page[0][0] == 'photos' then return "/admin/menus/#{get_menu_id(location_href)}/photos/sorts"
    if get_page[0][0] == 'events' then return "/admin/menus/#{get_menu_id(location_href)}/events/sorts"
  else
    return false

get_menu_id = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/([0-9]+)\/.{1,}$", "g")
  return location_href.scan(regex_location_href)[0][0]
