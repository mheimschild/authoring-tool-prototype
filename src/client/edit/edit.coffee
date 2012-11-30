Template.edit.class = ->
	return "" if Session.equals('edit', undefined)
	return Session.get('edit')

Template.edit.helpers
	is_class: (type) ->
		return Session.equals('edit', type)