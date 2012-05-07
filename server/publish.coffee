Meteor.publish 'conversations', ->
  Conversations.find()

Meteor.methods
  think: (conversation_id, attribute) ->
    selector = { _id: conversation_id }

    inc = {}
    inc[attribute] = 1

    dec = {}
    dec[attribute] = -1

    Meteor.setTimeout ->
      Conversations.update { _id: conversation_id }, { $inc: dec}
    , 5000

    Conversations.update selector, { $inc: inc }


