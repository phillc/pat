this.Rooms = new Meteor.Collection("rooms")

Meteor.subscribe 'rooms', ->

Template.home.show = ->
  !Session.get "currentRoom"

Template.rooms_list.rooms = ->
  Rooms.find()

Template.createRoom.events =
  submit: ->
    id = Rooms.insert
      name: $("#new-rooms-name").val()
    console.log id
    console.log Rooms.find().fetch()
    Router.setRoom id

AppRouter = Backbone.Router.extend
  routes:
    "": "root"
    "rooms/:rooms_id": "room"

  root: ->
    Session.set "currentRoom", null

  room: (room_id) ->
    Session.set "currentRoom", room_id

  setHome: ->
    @navigate "", true
  setRoom: (room_id) ->
    @navigate "rooms/#{room_id}", true

this.Router = new AppRouter

Meteor.startup ->
  Backbone.history.start({ pushState: true })
