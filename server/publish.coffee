Meteor.publish 'conversations', ->
  Conversations.find()

Meteor.methods
  think: (conversation_id, component) ->
    Conversations.update {  _id: conversation_id }, { $inc: { talk: 1 } }

