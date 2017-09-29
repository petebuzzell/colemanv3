# Description
#   Allows the ability to add/remove/findTracks to a Spotify Playlist.
#
# Configuration:
#   SPOTIFY_APP_CLIENT_ID
#   SPOTIFY_APP_CLIENT_SECRET
#   SPOTIFY_USER_ID
#   SPOTIFY_PLAYLIST_ID
#   SPOTIFY_OAUTH_CODE
#   SPOTIFY_REDIRECT_URI
#
# Commands:
#   hubot spotify <search string> - searches for a track
#
# Author:
#   Kevin Ngao (kev5873) <kevgong@yahoo.com>
#   Pete Buzzell


playListID = "6gBK0XCGpe0rx3yGsTQHUl"



module.exports = (robot) ->

  # Authorize app, only authorizes non-user specific functions for the app, like Searching.
  # See: https://developer.spotify.com/web-api/authorization-guide/#client_credentials_flow

  authorizeApp = (res, func) ->
    encodedAppId = new Buffer(process.env.SPOTIFY_APP_CLIENT_ID + ":" + process.env.SPOTIFY_APP_CLIENT_SECRET).toString('base64')
    data = "grant_type=client_credentials"
    res.http("https://accounts.spotify.com/api/token")
      .header("Authorization", "Basic " + encodedAppId)
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post(data) (err, resp, body) =>
        response = JSON.parse(body)
        func(res, response.access_token)

  # Authorize App User Flow, authorizes user specific functions, like modifying playlists
  # See: https://developer.spotify.com/web-api/authorization-guide/#authorization_code_flow

  requestInitialTokens = (res, func) ->
    encodedAppId = new Buffer(process.env.SPOTIFY_APP_CLIENT_ID + ":" + process.env.SPOTIFY_APP_CLIENT_SECRET).toString('base64')
    data = "grant_type=authorization_code&code=" + process.env.SPOTIFY_OAUTH_CODE +  "&redirect_uri=" + process.env.SPOTIFY_REDIRECT_URI
    res.http("https://accounts.spotify.com/api/token")
      .header("Authorization", "Basic " + encodedAppId)
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post(data) (err, resp, body) =>
        response = JSON.parse(body)
        if response.error
          res.send "An error occured, " + response.error_description
        robot.brain.set 'access_token', response.access_token
        robot.brain.set 'refresh_token', response.refresh_token
        robot.brain.set 'expires', (new Date().getTime() + (response.expires_in * 1000))
        func(res)

  refreshAccessToken = (res, func) ->
    console.log 'refreshAccessToken', robot
    encodedAppId = new Buffer(process.env.SPOTIFY_APP_CLIENT_ID + ":" + process.env.SPOTIFY_APP_CLIENT_SECRET).toString('base64')
    data = "grant_type=refresh_token&refresh_token=" + robot.brain.get('refresh_token')
    res.http("https://accounts.spotify.com/api/token")
      .header("Authorization", "Basic " + encodedAppId)
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post(data) (err, resp, body) =>
        response = JSON.parse(body)
        if response.refresh_token
          robot.brain.set 'refresh_token', response.refresh_token
        robot.brain.set 'access_token', response.access_token
        robot.brain.set 'expires', (new Date().getTime() + (response.expires_in * 1000))
        func(res)

  authorizeAppUser = (res, func) ->
    if (robot.brain.get('access_token') != null) # Access Token Exists
      if ((new Date().getTime()) > robot.brain.get('expires')) # Token expired
        refreshAccessToken(res, func)
      else # Token has not expired, continue using it
        func(res)
    else # access token doesn't exist
      requestInitialTokens(res, func)

  # Spotify Web API Functions

  addTrack = (res) ->
    res.http("https://api.spotify.com/v1/users/" + process.env.SPOTIFY_USER_ID + "/playlists/" + playListID + "/tracks?uris=spotify%3Atrack%3A" + res.match[1])
      .header("Authorization", "Bearer " + robot.brain.get('access_token'))
      .header('Content-Type', 'application/json')
      .header('Accept', 'application/json')
      .post() (err, resp, body) =>
        response = JSON.parse(body)
        if response.snapshot_id
          res.send "Track added"

  findAndAddFirstTrack = (res, token) ->
    res.http("https://api.spotify.com/v1/search?q=" + res.match[1] + "&type=track&market=US&limit=1")
      .header("Authorization", "Bearer " + token)
      .header('Accept', 'application/json')
      .get() (err, resp, body) =>
        response = JSON.parse body
        for item in response.tracks.items
          res.match[1] = item.id
        authorizeAppUser(res, addTrack)

  removeTrack = (res) ->
    data = JSON.stringify({
      tracks: [
        uri : "spotify:track:" + res.match[1]
      ]
    })
    res.http("https://api.spotify.com/v1/users/" + process.env.SPOTIFY_USER_ID + "/playlists/" + playListID + "/tracks")
      .header("Authorization", "Bearer " + robot.brain.get('access_token'))
      .header('Content-Type', 'application/json')
      .delete(data) (err, resp, body) =>
        response = JSON.parse(body)
        if response.snapshot_id
          res.send "Track removed"

  callback = (query, response, msg) ->
    if msg.message.user.real_name
      realName = msg.message.user.real_name.split " ", 1
    else
      realName = msg.message.user.name
    errorMessage = [
      "I'm sorry #{realName}. I'm afraid I can't do that.",
      "#{realName}, No one wants to listen to that crappy song.",
      "#{query}? Never heard of it. Probably sucks.",
      "I only listen to Norwegian vegan straight edge which #{query} clearly is not.",
      "No more music for you, #{realName}",
      "Why would you want to listen to #{query}?"
    ]
    if response.tracks.items.length > 0 && response.tracks.items[0].external_urls != null
      #msg.send "Response: " + response + " query: " + query
      msg.send response.tracks.items[0].external_urls.spotify
      return
    else
      msg.send msg.random errorMessage
      return

  findTrack = (res, token) ->
    res.http("https://api.spotify.com/v1/search?q=" + res.match[1] + "&type=track")
      .header("Authorization", "Bearer " + token)
      .header('Accept', 'application/json')
      .get() (err, resp, body) =>
        response = JSON.parse body
        callback res.match[1], response, res
#        string = ""
#        for item in response.tracks.items
#          string = string + "#{item.name} - #{item.artists[0].name} - #{item.album.name} - #{item.id} \n"
#        res.send string

  robot.respond /spotify (.*)/i, (res) ->
    authorizeApp(res, findTrack)

#  robot.hear /playlist add (.*)/i, (res) ->
#    authorizeApp(res, findAndAddFirstTrack)
#
#  robot.hear /playlist addid (.*)/i, (res) ->
#    authorizeAppUser(res, addTrack)
#
#  robot.hear /playlist remove (.*)/i, (res) ->
#    authorizeAppUser(res, removeTrack)
#
#  robot.hear /playlist find (.*)/i, (res) ->
#    authorizeApp(res, findTrack)