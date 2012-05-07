Template.conversation.show = ->
  !!Session.get "currentConversation"

Template.conversation.thoughts = ->
  [
    { name: "Talk Louder",           attribute: "hear",     style: "info" }
    { name: "Let someone else talk", attribute: "talk",     style: "warning" }
    { name: "Agree",                 attribute: "agree",    style: "success" }
    { name: "Disagree",              attribute: "disagree", style: "danger" }
  ]

Template.thought.value = ->
  conversation = Conversations.findOne(_id: Session.get("currentConversation"))
  ((conversation && conversation[@attribute] || 0) * 10 ) + 20

Template.thought.events =
  'click': ->
    console.log "foo!!", @attribute

