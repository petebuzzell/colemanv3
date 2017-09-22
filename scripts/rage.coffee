# Description:
#   WHen you just need to rage
#
# Dependencies:
#   none
#
# Commands:
#   hubot rage - let hubot express your rage in image form
#
# Authors:
#   pbuzzell
rage = [
	"http://media.boingboing.net/wp-content/uploads/2015/12/rage-face.jpg",
    "http://1.images.comedycentral.com/images/shows/chappelle/videos/season_3/CHAPPELLE_03_0303_MONSTER_SHORT_640x360.jpg?width=1200&height=630&crop=true#.png"
]

module.exports = (robot) ->
   robot.hear /\b(rage)\b/i, (msg) ->
      msg.send msg.random rage
