# Find a single record of throw an exception if one was not found
u.findOneOrThrow = (collection, query) ->
  doc = collection.findOne query

  unless doc?
    throw new Meteor.Error 'not-found', 'Failed to get one document #kosuWU'

  doc

# Update exactly one record or throw an exception if one was not found
u.updateOneOrThrow = (collection, query, modifier) ->
  # Run the requested query
  count = collection.update query, modifier

  # Throw unless we updated exactly 1 document
  unless count is 1
    throw new Meteor.Error 'update-failed', 'Failed to update exactly 1 #Ph0IS5'

  # Return the count, just like the regular update() method
  count
