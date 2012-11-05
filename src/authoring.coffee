Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Meteor.startup ->
    document.getElementById('drag_container').innerHTML = Session.get('items') if Session.get('items')

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
      document.getElementById('drag_container').innerHTML = ''
      Session.set('items', '')
    'mouseover .active': (e) ->
      append_controls e.srcElement
    'mouseout .active': (e) ->
      remove_controls (e.srcElement)

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

append_controls = (src) ->
  console.log "1"
  controls_wrapper = document.createElement('div')
  controls_wrapper.setAttribute 'class', 'controls_wrapper'
  src.appendChild controls_wrapper

remove_controls = (src) ->
  console.log "2"
  src.innerHTML = ''
