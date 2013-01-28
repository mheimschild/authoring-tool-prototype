Template.workarea.events
  'dragover #workarea': (e) ->
    e.preventDefault()
  'dragenter #workarea': (e) ->
    $srcElem = $(e.srcElement)
    $srcElem.toggleClass "green"
  'dragleave #workarea': (e) ->
    $srcElem = $(e.srcElement)
    $srcElem.toggleClass "green"
  'dragend #workarea': (e) ->
    $srcElem = $(e.srcElement)
    $srcElem.toggleClass "green"
  'drop #workarea': (e) ->
    $srcElem = $(e.srcElement)
    $srcElem.toggleClass "green"