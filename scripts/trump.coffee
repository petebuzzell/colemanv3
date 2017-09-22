# Description:
#   Basic interface for whatdoestrumpthink.com
#
# Commands
#   trump me - Returns a random Trump quote
#   trump insult <something> - Returns random trump insult for <something>
#
# Dependencies:
#   None
#
# Author:
#   CalvinOnce

module.exports = (robot) ->
  myArray = [
    ":donald_trump:",
    ":trump_smug:",
    ":trump_yelling:",
    ":angry_trump:",
    ":trump-hair:"
  ]
  robot.hear /\b(chuck norris|chuck norris me|norris me|chuck me)\b/i, (msg) ->
    url = "http://api.icndb.com/jokes/random"
    msg.http(url)
    .header(Accept: 'application/json')
    .get() (err,res,body) ->
      try
        json = JSON.parse body
        msg.send json.value.joke
      catch error
        msg.send "This script failed.  It wasn't written by Chuck Norris."

  robot.respond /trump insult (.*)/i, (msg) ->
    to = msg.match[1].trim()
    url = "https://api.whatdoestrumpthink.com/api/v1/quotes/personalized?q=#{to}"
    trump = myArray[Math.floor(Math.random() * myArray.length)]
    msg.http(url)
        .headers(Accept: 'application/json')
        .get() (err, res, body) ->
          try
              json = JSON.parse body
              msg.send "#{trump} #{json.message}"
            catch error
              msg.send "I don't throw an error often.  I almost never throw an error."

  robot.respond /trump me$/i, (msg) ->
    url = "https://api.whatdoestrumpthink.com/api/v1/quotes/random"
    trump = myArray[Math.floor(Math.random() * myArray.length)]
    msg.http(url)
        .headers(Accept: 'application/json')
        .get() (err, res, body) ->
          try
              json = JSON.parse body
              msg.send "#{trump} #{json.message}"
            catch error
              msg.send "I don't throw an error often.  I almost never throw an error."
