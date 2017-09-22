# Description:
#   Motivation from Ron Swanson
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot swanson me - Motivates you to be more awesome
#
# Author:
#   danielmurphy

module.exports = (robot) ->
  robot.hear /\b(:swanson:|::swanson::)\b/i, (msg) ->
    images = [
      "http://i.imgur.com/kW0f7.jpg",
      "http://i.imgur.com/vw9gZ.jpg",
      "http://i.imgur.com/aV6ju.jpg",
      "http://i.imgur.com/AQBJW.jpg",
      "http://i.imgur.com/tKkRO.png",
      "http://i.imgur.com/lkbGP.png",
      "http://i.imgur.com/mx54e.jpg",
      "http://i.imgur.com/LASrK.jpg",
      "http://i.imgur.com/zvUBG.jpg",
      "http://i.imgur.com/tjqca.jpg",
      "http://i.imgur.com/q5CYv.jpg",
      "http://i.imgur.com/HsoXm.jpg",
      "http://i.imgur.com/6EGQm.jpg",
      "http://i.imgur.com/DxpKu.jpg",
      "http://i.imgur.com/h2c7L.jpg",
      "http://i.imgur.com/jNyXL.jpg",
      "http://i.imgur.com/K09cJ.jpg",
      "http://i.imgur.com/mO0UE.jpg",
      "http://i.imgur.com/9hhkx.jpg",
      "https://media.giphy.com/media/lfmLzyIbqgCI0/giphy.gif",
      "https://media.giphy.com/media/3oEduEHWLW6UiPA1Ww/giphy.gif",
      "https://media.giphy.com/media/8s1bWO7hckdW/giphy.gif"]
    msg.send msg.random images
  robot.respond /swanson me$/i, (msg) ->
    images = [
      "http://i.imgur.com/kW0f7.jpg",
      "http://i.imgur.com/vw9gZ.jpg",
      "http://i.imgur.com/aV6ju.jpg",
      "http://i.imgur.com/AQBJW.jpg",
      "http://i.imgur.com/tKkRO.png",
      "http://i.imgur.com/lkbGP.png",
      "http://i.imgur.com/mx54e.jpg",
      "http://i.imgur.com/LASrK.jpg",
      "http://i.imgur.com/zvUBG.jpg",
      "http://i.imgur.com/tjqca.jpg",
      "http://i.imgur.com/q5CYv.jpg",
      "http://i.imgur.com/HsoXm.jpg",
      "http://i.imgur.com/6EGQm.jpg",
      "http://i.imgur.com/DxpKu.jpg",
      "http://i.imgur.com/h2c7L.jpg",
      "http://i.imgur.com/jNyXL.jpg",
      "http://i.imgur.com/K09cJ.jpg",
      "http://i.imgur.com/mO0UE.jpg",
      "http://i.imgur.com/9hhkx.jpg",
      "https://media.giphy.com/media/lfmLzyIbqgCI0/giphy.gif",
      "https://media.giphy.com/media/3oEduEHWLW6UiPA1Ww/giphy.gif",
      "https://media.giphy.com/media/8s1bWO7hckdW/giphy.gif"]
    msg.send msg.random images