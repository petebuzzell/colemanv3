# Description:
#   Get Keynote pagesize data for a brand and display it
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot keynote pagesize|size for|me <brand> - Returns page size in MB for the measurement - BETA
#
# Author:
#   buzzelpe

slotIdList = sperry: 1511230, merrell: 1964620, saucony: 2158810, striderite: 2158815, keds: 2158820, ghop: 2158825, cat: 2158830, wolverine: 2158835, cushe: 2158845, bates: 2158850, sebago: 2158855, hp: 2158860, chacos: 2158865, harley: 2158870

module.exports = (robot) ->
	robot.respond /keynote (?:pagesize|size)?\s?(?:for|me)?\s?@?([A-Za-z0-9.-_]+)\s?(\d+\w+)?/i, (msg) ->
		brand = escape(msg.match[1])
		if slotIdList[brand] != undefined
			msg.http('https://api.keynote.com/keynote/api/getgraphdata?api_key=56a2d863-6dfe-364b-8877-213819979452&format=json&pagecomponent=Y&slotidlist=' + slotIdList[brand])
				.get() (error, response, body) ->
					jason = JSON.parse(body)
					total = 0
					count = 0
					for k,v of jason.measurement[0].bucket_data
						if v.perf_data != undefined
							size = v.perf_data
							count += 1
							total += parseFloat(size.value)
					msg.send "Keynote reports that " + brand + " is averaging " +(total/count)/1000000 + " mb over the last " + count + " measurements for all pages in the measurement."
		else
			brandNameList = ""
			for brandName, id of slotIdList
				brandNameList += brandName + "\n"
			msg.send "I do apologise.  I was unable to locate the brand '" + brand + "' in our database."
			msg.send "Could you have meant one of the following?" + "\n\n" + brandNameList






