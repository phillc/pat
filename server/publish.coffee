Rooms = this.Rooms = new Meteor.Collection("rooms")

Meteor.publish 'rooms', ->
  Rooms.find()
