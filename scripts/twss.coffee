# Description:
#   Hubot will respond to (in)appropriate lines with "That's what she said"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot <anything related to size, speed, quality, specific body parts> - Hubot will "that's what she said" that ish
#
# Author:
#   dhchow

require './twss/unrepeat'
require './twss/tokenize'
require './twss/stop'
require './twss/stem'
require './twss/bigram'

module.exports = (robot) ->
  robot.hear /.*/i, (msg) ->
    natural = require 'natural'
    # path from the root of hubot
    natural.BayesClassifier.load './scripts/twss/classifier-twss.json', null, (err, classifier) ->
      check = (grams) ->
        c = classifier.getClassifications(grams)
        cmp = {}
        cmp[c[0].label] = c[0].value
        cmp[c[1].label] = c[1].value
        perc = cmp['positive']/cmp['negative']
        if perc > 6 # the lower this number, the more often it will trigger
          return 'positive'
        return false
      if check(msg.message.text.unrepeat().tokenize().stop().stem().bigram()) == 'positive'
        s = ["that's what she said","phrasing","said the actress to the bishop","said the girl to the sailor","giggity"]
        i = Math.floor(Math.random()*s.length)
        msg.send s[i]
