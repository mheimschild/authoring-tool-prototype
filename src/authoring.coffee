Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Template.work.events = ->
    'dragstart .text': (e) ->
      e.dataTransfer.effectAllowed = 'move'
      console.log "aaaa"

  Template.toolbar.events
    'dragover #drag_container': (e) ->
      e.preventDefault()
    'drop #drag_container': (e) ->
      console.log "Hoo hoo"

if Meteor.isServer
  Meteor.startup ->