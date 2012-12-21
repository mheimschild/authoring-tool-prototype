Template.toolbar.events
  'dragstart div[draggable="true"]': (e) ->
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData('text', e.srcElement.id);
  'touchstart div[draggable="true"]': (e) ->
    items = Session.get('items')
    return if !items
    items.push 
      index: items.length
      type: e.srcElement.getAttribute('class')
    Session.set('items', items)
