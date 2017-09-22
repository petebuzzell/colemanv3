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

sys = require 'sys'
zoom_meeting_create = "https://api.zoom.us/v1/meeting/create"

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
    zoom_host_id = zoomHostId(username)

    # according to zoom support, only scheduled and recurring
    # meetings can have the join before host option set to true

    params = {}
    params.api_key = process.env.HUBOT_ZOOM_API_KEY
    params.api_secret = process.env.HUBOT_ZOOM_API_SECRET
    params.data_type = "JSON"
    params.host_id = zoom_host_id
    params.start_time = Date().toString('yyyy-MM-ddTHH:mm:ssZ')
    params.duration = 60
    params.timezone = "GMT-5:00"
    params.topic = "scheduled meeting"
    params.type = 2
    params.option_start_type = "video"
    params.option_jbh = true

    try
      msg.http(zoom_meeting_create)
        .header("content-type", "application/x-www-form-urlencoded")
        .query(params)
        .post() (error, response, body) ->
          switch response.statusCode
            when 200
              json_body = JSON.parse(body)
              if json_body.error?
                msg.send "zoom error: #{json_body.error.message}"
              else
                msg.send "#{username} started a zoom session: #{json_body.join_url}"
            else
              msg.send "zoom? more like doom! there was a problem sending the request :("
    catch e then msg.send e