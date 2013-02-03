Meteor.startup ->
  $("#elements li").draggable(
    helper: "clone"
  )
  $("#workarea ul").droppable(
    drop: (e, ui) ->
      $(this).find(".placeholder").remove()
      $("<li></li>").addClass(ui.draggable.attr("class")).appendTo( this );
  )