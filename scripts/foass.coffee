# Description:
#   Basic interface for FOAAS.com
#
# Commands
#   insult|berate|piss on|trash|slam|bash|belittle|offend|castigate <object> - tells <object> to f off  with random response from FOAAS
#
# Dependencies:
#   None
#
# Author:
#   zacechola


module.exports = (robot) ->
  robot.respond /(insult|berate|piss on|trash|slam|bash|belittle|offend|castigate|bitch about) (.*)/i, (msg) ->
    options = [
      'off',
      'you',
      'ing',
      'donut',
      'king',
      'chainsaw',
      'outside',
      'yoda',
      'shutup'
      'family'
      'think',
      'back',
      'keep',
      'look',
      'thinking',
      'bag',
      'too',
      'horse',
      'blackadder',
      'deraadt',
      'holygrail',
      'immensity'

    ]

    from = "Coleman"

    to = msg.match[2].trim()

    robotName = /(coleman)/i

    if msg.message.user.real_name
      realName = msg.message.user.real_name.split " ", 1
    else
      realName = msg.message.user.name

    if to.match robotName
      msg.send "I'm sorry, #{realName}. I'm afraid I can't do that."
      return


    if to
      options.push(to)
      random_fu = msg.random options
      if random_fu is to
        # if our random fu matched to, call /to/from
        url = "https://foaas.com/#{random_fu}/#{from}/"
      else if random_fu in ['family', 'maybe', 'horse', 'too', 'bag', 'bucket', 'sake', 'give', 'no', 'looking', 'single', 'zayn', 'awesome', 'bye', 'beacuse', 'what', 'cool', 'flying', 'thing', 'life', 'pink', 'this', 'that', 'everything', 'everyone']
          url = "https://foaas.com/#{random_fu}/#{from}/"
      else
        # else use default /option/to/from
        url = "https://foaas.com/#{random_fu}/#{to}/#{from}/"

    else
      # or if we have no parameter for to, use these options
      options = [
        'this',
        'that',
        'everything',
        'everyone',
        'pink',
        'life',
        'thanks',
        'flying',
        'fascinating',
        'cool',
        'what',
        'because'
      ]
      random_fu = msg.random options
      # call /option/to
      url = "https://foaas.com/#{random_fu}/#{from}/"

    msg.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        try
          json = JSON.parse body
          if random_fu in ['immensity','holygrail','family','horse', 'too', 'bag', 'bucket', 'sake', 'give', 'no', 'looking', 'single', 'zayn', 'awesome', 'bye', 'beacuse', 'what', 'cool', 'flying', 'thing', 'life', 'pink', 'this', 'that', 'everything', 'everyone']
              msg.send "#{to}, #{json.message}"
          else
            msg.send "#{json.message}"
          #msg.send "#{json.message}\n#{json.subtitle}"
        catch error
          msg.send "Fuck this error! And fuck you too! "
