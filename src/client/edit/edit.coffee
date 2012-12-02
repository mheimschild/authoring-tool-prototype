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
    value = value == "true"
    no_choices = false
    no_choices = true if !obj || !obj.choices || 0 == obj.choices.length
    no_choices == value

Template.edit.events
  'blur .edit .input': (e) ->
    srcElement = e.srcElement
    obj = get_edited_item()
    obj[srcElement.dataset['attr']] = srcElement.value
    update_obj obj
  'keypress .edit .cb_input': (e) ->
    switch e.keyCode
      when 13
        index = parseInt(e.srcElement.dataset['index'])
        $choices = $(".edit .cb_input")
        obj = get_edited_item()
        obj.choices = [] if !obj.choices
        if $choices.length == (index + 1)
          $choices.last().after('<label>Choice</label><input class="cb_input" data-index="' + $choices.length + '" type="text">')
          obj.choices[index + 1] = { index: index + 1, text: "" }
        obj.choices[index] = { index: index, text: e.srcElement.value }
        update_obj obj
        

get_edited_item = ->
  return Session.get('items')[Session.get('index')]

update_obj = (obj) ->
  items = Session.get('items')
  index = Session.get('index')
  items[index] = obj
  Session.set('items', items)