# Description:
#   Praise
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot high five @hubot for being awesome
#   hubot high five @hubot
#   hubot praise @hubot for just being there when i need her
#   hubot praise @hubot
#   hubot who praised
#
# Author:
#   Marthyn (@Marthyn)

highFives = require './data/highfivegifs.json'
fistBumps = require './data/fistbumpgifs.json'

module.exports = (robot) ->
  robot.respond /high five ([^ ]*)( (.*))?/i, (msg) ->
    if praiseUser(msg, robot, 0)
      updatePraises(msg, robot)
  robot.respond /fist bump ([^ ]*)( (.*))?/i, (msg) ->
    if praiseUser(msg, robot, 1)
       updatePraises(msg, robot)
  robot.respond /praise ([^ ]*)( (.*))?/i, (msg) ->
    if praiseUser(msg, robot, 2)
      updatePraises(msg, robot)
  #robot.respond /who praised/i, (msg) ->
    #getPraises(msg, robot)


praiseUser = (msg, robot, type) ->
  user = msg.match[1].replace(/@?(.*)/, '$1')
  message = msg.match[3]
  current_user = msg.message.user.name
  if user == current_user
    if type == 1
      msg.send "you can't fist bump yourself. that's just weird"
      return false
    else
      msg.send "you can’t high five yourself. that’s just clapping"
      return false
  else
    highfive = msg.random highFives
    if type == 1
      highfive = msg. random fistBumps
    praise = msg.random praises(user)
    msg.send highfive
    typeName = "high fives"
    if type == 1
        typeName = "fist bumps"
    msg.send "#{current_user} #{typeName} #{user}.#{if message then " #{message}" else ""}"
    msg.send praise
    return true

praises = (user) ->
  return [
    "Keep on rocking, #{user}!",
    "Keep up the great work, #{user}!",
    "You're awesome, #{user}!",
    "You're doing good work, #{user}!",
    "You're the best, #{user}",
    "Never stop doing what you do #{user}, it's paying off!",
    "Thanks so much, you've been amazing #{user}!",
    "How many people does it take to change a lightbulb? Nvm #{user} changed 100 before you even responded!",
    "Your work is phenomenal, #{user}!",
    "You are changing lives with your work, #{user}!",
    "The world is a better place with you around, #{user}",
    "Is there anything you can't do #{user}? Wow!",
    "#{user}... you're perfectly adequate",
    "Nice work #{user}.  You're not as dumb as you look",
    "I don't care what they say about you #{user}, you're alright",
    "Hey! You didn't suck this time #{user}",
    "#{user} - you're surprisingly high functioning.",
    "Nice. Fucking. Work. #{user}",
    "Nothing's gonna ever keep you down #{user}",
    "You're a wizard, #{user}!",
    "#{user}! AWESOME work",
    "You're extremely reliable sometimes, #{user}",
    "I appreciate you, #{user}",
    "#{user}, you should be proud of yourself.",
    "I bet you sweat glitter, #{user}"
  ]

updatePraises = (msg, robot) ->
  currentPraises = robot.brain.get('praises')
  today = new Date().toLocaleString()

  if !currentPraises || currentPraises.length == 0
    currentPraises = []

  currentPraises.push(
    {
      receiver: msg.match[1].replace(/@?(.*)/, '$1'),
      sender: msg.message.user.name,
      message: msg.match[3],
      date: today
    }
  )

  robot.brain.set('praises', currentPraises)
  robot.brain.save

getPraises = (msg, robot) ->
  msg.send "ALL PRAISES EVER"
  message = ""
  allPraises = robot.brain.get('praises')
  if allPraises
    for praise in allPraises
      message += "#{praise.sender} sent a praise for #{if praise.message then " #{praise.message}" else "awesomeness"} to #{praise.receiver} on #{praise.date} \n\r";
    msg.send message
  else
    msg.send "none"
