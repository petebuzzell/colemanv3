# Description:
#   Listen for mention of someone and respond
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   buzzelpe

alots = [
  "http://4.bp.blogspot.com/_D_Z-D2tzi14/S8TRIo4br3I/AAAAAAAACv4/Zh7_GcMlRKo/s400/ALOT.png",
  "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TTPQCPA6I/AAAAAAAACwA/ZHZH-Bi8OmI/s1600/ALOT2.png",
  "http://2.bp.blogspot.com/_D_Z-D2tzi14/S8TiTtIFjpI/AAAAAAAACxQ/HXLdiZZ0goU/s320/ALOT14.png",
  "http://fc02.deviantart.net/fs70/f/2010/210/1/9/Alot_by_chrispygraphics.jpg"
]

module.exports = (robot) ->
	robot.hear /\b(jaws|shark|sharks|sea whore|sperry|boat)\b/i, (msg) ->
		msg.send "dant dant dant dant"
	robot.hear /\b(ban|kick)\b/i, (msg) ->
			robot.reply "I really don't think that is necessary."
	robot.hear /\b(leadership|dew bong|j_paw|laser ladies)\b/i, (msg) ->
		if msg.message.user.name in ["monitorpop", "brownji", "pete", "matt", "tiffany"]
			msg.send "http://carphotos.cardomain.com/ride_images/1/122/4401/304700003_large.jpg"
			
	robot.respond /troll (.*) with (.*)/, (msg) ->
		room = msg.match[1]
		message = msg.match[2]

		msg.send "Tee hee... Trolled #{room}."
		robot.logger.info "Trolled #{room} with #{message}"
		robot.messageRoom room, message
