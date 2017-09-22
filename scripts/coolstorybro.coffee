# Description
#   Cool story, bro.  Hubot hears it and responds with an random image.
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   pbuzzell

bro = [
	"http://i.imgur.com/Q7qHm9H.png",
	"http://i.imgur.com/zPRBW7k.gif",
	"http://i.imgur.com/u94fq.jpg",
	"http://img4.wikia.nocookie.net/__cb20131026212425/trollpasta/images/4/4a/Cool_story_bro_tell_it_again.jpg",
	"http://threadbombing.com/data/media/68/csb1.jpg",
	"http://static4.fjcdn.com/comments/3417846+_5187a2a496b2fa867bf8902815dc05f4.jpg",
	"https://cdn.meme.am/instances/13123257.jpg",
	"http://i1.kym-cdn.com/photos/images/facebook/000/061/294/1106514-cool_story_bro_super.jpg",
	"http://i.imgur.com/FOlYip6.jpg",
	"https://s-media-cache-ak0.pinimg.com/236x/7f/69/0a/7f690a86b88c192b2c57caea56a0d1e5.jpg",
	"https://cdn.meme.am/instances/61419234.jpg",
	"http://i693.photobucket.com/albums/vv291/03HawaiiantypeS/cool-story-bro-tell-it-again-.jpg"
]
module.exports = (robot) ->
	robot.hear /(cool story bro)/i, (msg) ->
		msg.send msg.random bro