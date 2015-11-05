# Create the schemas namespace if it doesn't already exist
App.Schemas ?= {}

# Define the meta schema
App.Schemas.Meta =

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date
      else if @isUpsert
        $setOnInsert: new Date
      else
        @unset()
    autoform:
      # Hide this from the autoform output
      omit: true

  updatedAt:
    type: Date
    autoValue: ->
      if @isUpdate
        new Date()
    denyInsert: true
    optional: true
    autoform:
      # Hide this from the autoform output
      omit: true

  createdBy:
    type: String
    regEx: /^[23456789ABCDEFGHJKLMNPQRSTWXYZabcdefghijkmnopqrstuvwxyz]{17}$/
    optional: true
    autoValue: ->
      unless @userId?
        @unset()
      else if @isInsert
        @userId
      else if @isUpsert
        $setOnInsert: @userId
      else
        @unset()
    autoform:
      # Hide this from the autoform output
      omit: true
