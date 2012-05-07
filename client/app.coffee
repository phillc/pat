Meteor.subscribe 'conversations', ->

Template.home.show = ->
  !Session.get "currentConversation"

Template.conversation_list.conversations = ->
  Conversations.find()

Template.createConversation.events =
  submit: ->
    id = Conversations.insert
      name: $("#new-conversations-name").val()
    Router.setConversation id

AppRouter = Backbone.Router.extend
  routes:
    "": "root"
    "conversations/:conversations_id": "conversation"

  root: ->
    Session.set "currentConversation", null

  conversation: (conversation_id) ->
    Session.set "currentConversation", conversation_id

  setHome: ->
    @navigate "", true
  setConversation: (conversation_id) ->
    @navigate "conversations/#{conversation_id}", true

window.Router = new AppRouter

Meteor.startup ->
  Backbone.history.start({ pushState: true })
