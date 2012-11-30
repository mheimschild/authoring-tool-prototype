Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

Meteor.startup ->
  Session.set('items', []) if Session.equals('items', undefined)
  Session.set('items', []) if !Session.get('items') instanceof Array

Template.work.items = ->
  Session.get('items')

Template.work.events
  'dragover #drag_container': (e) ->
    e.preventDefault()
  'drop #drag_container': (e) ->
    items = Session.get('items')
    return if !items
    items.push 
      index: items.length
      type: e.dataTransfer.getData('text')
    Session.set('items', items)
  'click #clean': ->
    Session.set('items', undefined)
  'click .item': (e) ->
    Session.set 'edit', e.srcElement.dataset['type']
    Session.set 'item', e.srcElement.dataset['index']
  'mouseover .active': (e) ->
    append_controls e.srcElement
  'mouseout .active': (e) ->
    remove_controls (e.srcElement)