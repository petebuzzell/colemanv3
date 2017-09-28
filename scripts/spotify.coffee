# Description:
# Basically "hubot image me <something>" for spotify
# The normal usage is just to write hubot spotify me <something> and hubot will query tracks on spotify
# There is a bonus feature where you type "roulette" and it will get a random word and search for a track
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot spotify me <search string>
#   hubot spotify me roulette
#
# Author:
#   Fredrik Jönsson


module.exports = (robot) ->
  robot.respond /spotify( me)? (.*)/i, (msg) ->
    query = msg.match[2]
    track = "track"

    if query is 'roulette'
      roulette msg, (response) -> spotify robot, msg, response, track, callback
    else
      spotify robot, msg, query, track, callback

roulette = (msg, cb) ->
  msg.http('http://randomword.setgetgo.com/get.php')
  .get() (err, res, body) ->
      if err
        msg.send "Heeeeelp, something is going terribly wrong: #{err}"
        return
      else if res.statusCode / 100 == 2
        cb body
      else
        msg.send "Call for backup, unknown error calling randomword: " + JSON.parse(body).message
        return

callback = (query, response, msg) ->
        if response.tracks.items.length > 0 && response.tracks.items[0].external_urls != null
          msg.send response.tracks.items[0].external_urls.spotify
          return
        else
          msg.send "Even I can't find that crappy song called \"" + query + "\"! I guess that's for the best."
          return

spotify = (robot, msg, query, type, cb) ->
  if msg.message.user.real_name
    realName = msg.message.user.real_name.split " ", 1
  else
    realName = msg.message.user.name
  errorMessage = [
    "I'm sorry #{realName}. I'm afraid I can't do that.",
    "No one wants to listen to that crappy song.",
    "#{query}? Never heard of it. Probably sucks.",
    "I only listen to Norwegian vegan straight edge which #{query} clearly is not.",
    "No music today folks. All used up.",
    "   ...uhhh... I got nothing. Sorry"
  ]
  authToken = "Bearer BQD5ruKsPx2JiDxNsvxc1A01v8fgFpyNQRKCTSRqCoHh-yJIovrzqQarg_cf-q7UoBh7dSKI_ajFbGBRgdw4Lr3uT_k7ABLMwihJArGsNBWxr1He6X9-pxE67rWE-dtQy6fFK0JpACl5"
  q = q: query, type: type, limit: 1
  msg.http("https://api.spotify.com/v1/search")
    .query(q)
    .headers(Authorization: authToken, 'Content-Type': 'application/json')
    .get() (err, res, body) ->
      if err
        msg.send "Heeeeelp, something is going terribly wrong: #{err}"
        return
      else if res.statusCode / 100 == 2
        cb query, JSON.parse(body), msg
      else
        msg.send msg.random errorMessage
        #msg.send "Call for backup, unknown error calling spotify: " + JSON.parse(body).message
        return