Meteor.startup ->
  $("#elements li").draggable(
    helper: "clone"
  )
  $("#workarea ul").droppable(
    accept: ":not(.ui-sortable-helper)"
    drop: (e, ui) ->
      $(this).find(".placeholder").remove()
      $newElem = $("<li></li>").addClass(ui.draggable.attr("class")).addClass("editable")
      $newElem[0].dataset['type'] = ui.draggable[0].dataset['type']
      $newElem.appendTo( this );
  ).sortable(
    items: "li:not(.placeholder)"
    $(this).removeClass "ui-state-default"
  )