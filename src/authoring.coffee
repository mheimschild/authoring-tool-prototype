Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Template.work.items = ->
    Session.get('items')

  Template.work.events
    'dragover #drag_container': (e) ->
      e.preventDefault()
    'drop #drag_container': (e) ->
      element = document.createElement 'span'
      element.setAttribute 'class', 'active ' + e.dataTransfer.getData('text')
      e.srcElement.appendChild element
      Session.set('items', e.srcElement.innerHTML)
    'click #clean': ->
      find('#drag_container').innerHTML = ''
      Session.set('items', '')

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