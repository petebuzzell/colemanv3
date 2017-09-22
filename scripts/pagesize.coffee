# Description:
#   Get Google PageSpeed Insights data for any site and display it
#
# Dependencies:
#   npm psi
#
# Configuration:
#   None
#
# Commands:
#   hubot psi <website> - Returns Google PageSpeed Insights Data.  BETA
#
# Author:
#   buzzelpe
module.exports = (robot) ->
	robot.respond /psi ?\s?@?([A-Za-z0-9.-_]+)\s?(\d+\w+)?/i, (msg) ->
		psi = require 'psi'
		url = msg.match[1].replace(/.*?:\/\//g, "")
		msg.send "Fetching Google PageSpeed Insights data for " + msg.match[1] + ".  I should have results momentarily. "
		psi(url)
			.then (data) ->
				attachment = 
					pretext: "Your results for " + url
					title: data.title
					fields : [
						{
							title: "Image Response"
							value: data.pageStats.imageResponseBytes + " bytes"
							short: true
						}
						{
							title: "JS Response"
							value: data.pageStats.javascriptResponseBytes + " bytes"
							short: true
						}
						{
							title: "CSS Response"
							value: data.pageStats.javascriptResponseBytes + " bytes"
							short: true
						}

					]
				msg.robot.adapter.customMessage
                channel: msg.envelope.room
                username: msg.robot.name
                attachments: [attachment]
				#msg.send "Reqested URL:\t" + url + "\n" + "Page Title:\t" + data.title + "\n" + "Image Response:\t" + data.pageStats.imageResponseBytes/1000000.toFixed(2) + " MB" + "\n" + "JS Response:\t" + data.pageStats.javascriptResponseBytes/1000000.toFixed(2) + " MB" + "\n" + "CSS Response:\t" + data.pageStats.cssResponseBytes/1000000.toFixed(2) + " MB"
