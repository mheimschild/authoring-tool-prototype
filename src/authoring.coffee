Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Template.work.events
    'dragover #drag_container': (e) ->
      e.preventDefault()
    'drop #drag_container': (e) ->
      console.log "Hoo hoo"

  Template.toolbar.events
    'dragstart .text': (e) ->
      e.dataTransfer.effectAllowed = 'move'

if Meteor.isServer
  Meteor.startup ->