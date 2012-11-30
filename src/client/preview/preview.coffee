Template.preview.items = ->
  Session.get("items")

Template.preview.helpers
  isOf: (arg1, arg2) ->
    arg1 == arg2