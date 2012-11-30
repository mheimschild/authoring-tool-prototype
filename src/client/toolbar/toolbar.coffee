Template.toolbar.events
  'dragstart div[draggable="true"]': (e) ->
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData('text', e.srcElement.id);