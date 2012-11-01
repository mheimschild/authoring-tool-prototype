Exercises = new Meteor.Collection("exercises")
Unit = new Meteor.Collection("units")

if Meteor.isClient
  Template.work.greeting = ->
    "Welcome to authoring."

  Template.hello.events
    'click input' : ->
      if typeof console != 'undefined'
        console.log "You pressed the button"

if Meteor.isServer
  Meteor.startup ->