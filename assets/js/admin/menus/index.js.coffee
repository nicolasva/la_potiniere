jQuery ->
  console.log(window.location.href)
  if location_ajax(window.location.href)
    console.log location_ajax(window.location.href)
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

get_id_sortable = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    if get_page[0][0] == 'menus' then ".menus"
    if get_page[0][0] == 'contents' then ".contents"
  else
    return nil

get_id_for_sortable_item = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    if get_page[0][0] == 'menus' then $("#menus_list")
    if get_page[0][0] == 'contents' then $("#contents_list")
  else
    return nil

location_ajax = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/(menus|contents|events|photos)$", "g")
  get_page = location_href.scan(regex_location_href)
  if get_page.length > 0
    if get_page[0][0] == 'menus' then "/admin/menus/sorts"
    if get_page[0][0] == 'contents' then "/admin/menus/#{get_menu_id(location_href)}/contents/sorts"
  else
    return nil

get_menu_id = (location_href) ->
  regex_location_href = new RegExp("^.{1,}\/([0-9]+)\/.{1,}$", "g")
  return location_href.scan(regex_location_href)[0][0]
