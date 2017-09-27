# Description:
#   hubot zoom integration!
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_ZOOM_API_KEY
#   HUBOT_ZOOM_API_SECRET
#
# Commands:
#   hubot zoom - start a zoom meeting and return the meeting link
#   zoom @username - get the zoom room for a specific user
#
# Author:
#   Gad Berger

account = [
  "pete": "https://wwwinczoommeeting.zoom.us/my/buzzelpe",
  "jeff": "https://wwwinczoommeeting.zoom.us/j/797370968"
]

module.exports = (robot) ->

  # copied from remember.coffee
  memories = () -> robot.brain.data.remember ?= {}

  # @hubot remember @username zoomroom is https://zoom.us/...
  robot.hear /^zoom\s@([a-zA-Z0-9]+)\s?$/i, (msg) ->
    if msg.message.user.id is robot.name
      return

    name = msg.match[1].toLowerCase()
    key = '@' + name + ' zoomroom'
    value = memories()[key]
    if value
      msg.send value
    else
      msg.send "I don't remember any zoomroom for @" + name

  robot.respond /zoom$/i, (msg) ->
    username = msg.message.user.name
    console.log(account.pete)
    url = account[username]
    if url
      msg.send "#{username} started a zoom session: #{url}"
    else
       msg.send "zoom? more like doom! there was a problem with your request"