# Description:
#   Rodent Motivation
#
#   Set the environment variable HUBOT_SHIP_EXTRA_SQUIRRELS (to anything)
#   for additional motivation
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SHIP_EXTRA_SQUIRRELS
#
# Commands:
#   ship it - Display a motivation squirrel
#
# Author:
#   maddox

squirrels = [
  "http://shipitsquirrel.github.io/images/ship%20it%20squirrel.png",
  "http://28.media.tumblr.com/tumblr_lybw63nzPp1r5bvcto1_500.jpg",
  "http://i.imgur.com/DPVM1.png",
  "http://d2f8dzk2mhcqts.cloudfront.net/0772_PEW_Roundup/09_Squirrel.jpg",
  "http://www.cybersalt.org/images/funnypictures/s/supersquirrel.jpg",
  "http://www.zmescience.com/wp-content/uploads/2010/09/squirrel.jpg",
  "https://dl.dropboxusercontent.com/u/602885/github/sniper-squirrel.jpg",
  "http://1.bp.blogspot.com/_v0neUj-VDa4/TFBEbqFQcII/AAAAAAAAFBU/E8kPNmF1h1E/s640/squirrelbacca-thumb.jpg",
  "https://dl.dropboxusercontent.com/u/602885/github/soldier-squirrel.jpg",
  "https://dl.dropboxusercontent.com/u/602885/github/squirrelmobster.jpeg",
  "http://www.thetaxidermystore.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/a/canoe-grey-squirrel-taxidermy-mount-_12576-for-sale-_-the-taxidermy-store.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/5f/3a/be/5f3abe69cb332e596d0256bfffd21b0e.jpg",
  "http://conquerweightloss.com/wp-content/uploads/2012/12/lose-abdominal-fat-fast.bmp",
  "http://www.whenshiphappens.com/.a/6a017ee67f6021970d01a73deddfe2970d-pi"
]

module.exports = (robot) ->

  # Enable a looser regex if environment variable is set
  if process.env.HUBOT_SHIP_EXTRA_SQUIRRELS
    regex = /ship(ping|z|s|ped)?\s*it/i
  else
    regex = /ship\s*it/i

  robot.hear regex, (msg) ->
    msg.send msg.random squirrels