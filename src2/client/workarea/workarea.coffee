Template.workarea.events
  'click .editable': (e) ->

    $("#editDialog-" + e.srcElement.dataset['type']).reveal()