Template.buttons.events
  'click #button_save': ->
    items = []
    $("#workarea ul li").each (index) ->
      items.push this.dataset['type']
    console.log items