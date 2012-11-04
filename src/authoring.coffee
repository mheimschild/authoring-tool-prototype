Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Template.work.items = ->
    if !Session.get('items')
      Session.set('items', [])
    Session.get('items')

  Template.work.events
    'dragover #drag_container': (e) ->
      e.preventDefault()
    'drop #drag_container': (e) ->
      items = Session.get('items')
      items.push e.dataTransfer.getData('text')
      element = document.createElement 'span'
      element.setAttribute 'class', 'active ' + e.dataTransfer.getData('text')
      e.srcElement.appendChild element
      Session.set('items', items)
    'click #clean': ->
      Session.set('items', [])

  Template.toolbar.events
    'dragstart div[draggable="true"]': (e) ->
      e.dataTransfer.effectAllowed = 'move'
      e.dataTransfer.setData('text', e.srcElement.id);

if Meteor.isServer
  Meteor.startup ->

insertable_before = (item, e) ->
  console.log item.offsetLeft
  console.log item.offsetTop
  console.log item.offsetWidth
  console.log item.offsetHeight
  console.log e