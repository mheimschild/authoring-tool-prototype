Meteor.startup ->
  $("#elements li").draggable(
    helper: "clone"
  )
  $("#workarea ul").droppable(
    accept: ":not(.ui-sortable-helper)"
    drop: (e, ui) ->
      $(this).find(".placeholder").remove()
      $("<li></li>").addClass(ui.draggable.attr("class")).appendTo( this );
  ).sortable(
    items: "li:not(.placeholder)"
    $(this).removeClass "ui-state-default"
  )