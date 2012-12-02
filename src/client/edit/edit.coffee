Template.edit.class = ->
  return "" if Session.equals('edit', undefined)
  return Session.get('edit')

Template.edit.item = ->
  return get_edited_item()

Template.edit.helpers
  is_class: (type) ->
    return Session.equals('edit', type)
  noChoices: (value) ->
    obj = get_edited_item()
    no_choices = false
    no_choices = true if !obj || !obj.choices || 0 == obj.choices.length
    no_choices == (value == "true")

Template.edit.events
  'blur .edit .input': (e) ->
    srcElement = e.srcElement
    obj = get_edited_item()
    obj[srcElement.dataset['attr']] = srcElement.value
    update_obj obj
  'keyup .edit .cb_input': (e) ->
    switch e.keyCode
      when 13, 9
        e.preventDefault()
        handle_choice_event e, true
  'blur .edit .cb_input': (e) ->
    handle_choice_event e, false
  'click .edit .cb_input': (e) ->
    return if e.offsetX <= e.srcElement.clientWidth - 16
    index = parseInt(e.srcElement.dataset['index'])
    obj = get_edited_item()
    return if !obj || !obj.choices || 0 == obj.choices.length
    obj.choices.splice(index, 1)
    choice.index = i for choice, i in obj.choices
    update_obj obj
  'mousemove .edit .cb_input': (e) ->
    e.srcElement.style.cursor = 'pointer' if e.offsetX > e.srcElement.clientWidth - 16
    e.srcElement.style.cursor = 'text' if e.offsetX <= e.srcElement.clientWidth - 16

get_edited_item = ->
  return Session.get('items')[Session.get('index')]

update_obj = (obj) ->
  items = Session.get('items')
  index = Session.get('index')
  items[index] = obj
  Session.set('items', items)

handle_choice_event = (e, may_create_new) ->
  index = parseInt(e.srcElement.dataset['index'])
  obj = get_edited_item()
  obj.choices = [] if !obj.choices
  obj.choices[index] = { index: index, text: e.srcElement.value }
  update_obj obj
  $choices = $(".edit .cb_input")
  if may_create_new && $choices.length == (index + 1)
    $choices.last().after('<label>Choice</label><input class="cb_input" data-index="' + $choices.length + '" type="text">')
    obj.choices[index + 1] = { index: index + 1, text: "" }
    update_obj obj