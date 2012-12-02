Template.edit.class = ->
  return "" if Session.equals('edit', undefined)
  return Session.get('edit')

Template.edit.item = ->
  return Session.get('items')[Session.get('index')]

Template.edit.helpers
  is_class: (type) ->
    return Session.equals('edit', type)

Template.edit.events
  'blur .edit .input': (e) ->
    srcElement = e.srcElement
    items = Session.get('items')
    index = Session.get('index')
    obj = items[index]
    obj[srcElement.dataset['attr']] = srcElement.value
    items[index] = obj
    Session.set('items', items)