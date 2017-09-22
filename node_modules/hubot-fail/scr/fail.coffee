# Description:
#   Display a fail image
#
# Dependencies:
#   None
# 
# Configuration: 
#   None
#
# Commands:
#   robot fail - Display an image of failure
#
# Author:
#   Jenn Basalone - jbasalone@gmail.com

fail = [
   "http://img4.wikia.nocookie.net/__cb20130914074755/powerlisting/images/1/12/FAIL-Word-art-300x187.png",
   "http://www.dumpaday.com/wp-content/uploads/2012/11/funny-fails-12.jpg",
   "http://www.vitamin-ha.com/wp-content/uploads/2014/03/Funny-Fail-09-024.jpg",
   "http://www.vitamin-ha.com/wp-content/uploads/2013/07/Funny-Fails-01.jpg",
   "http://www.dumpaday.com/wp-content/uploads/2012/11/funny-fails-12.jpg",
   "http://fc07.deviantart.net/fs34/f/2008/299/1/a/There__s_no_word_but_FAIL_by_daveshan.jpg",
   "http://lh3.ggpht.com/_LEDL5eT3epM/Su8AR_JwDBI/AAAAAAAAAPU/BbLaL5GxiQM/img_3.jpg",
   "http://sr.photos2.fotosearch.com/bthumb/CSP/CSP992/k14392274.jpg",
   "http://media.giphy.com/media/Pvd8Gq2sFQ4kE/giphy.gif",
   "http://www.gifbin.com/bin/052011/1304356562_discus-throwing-fail.gif",
   "http://www.gifbin.com/bin/102009/1255084444_ramp-fail.gif",
   "http://fumaga.com/i/trampoline-jumping-fail-animated.gif",
   "http://www.gifbin.com/bin/062011/1309197288_mortar_fail.gif",
   "http://cdn1.smosh.com/sites/default/files/legacy.images/smosh-pit/092010/dancefail-5.gif",
   "http://theunshaven.rooms.cwal.net/Animated%20Gifs/Epic%20Fail.gif",
   "http://www.colectiva.tv/wordpress/wp-content/uploads/2010/01/Girl_owned_treadmillFAIL.gif",
   "http://38.media.tumblr.com/tumblr_lh2hb2oGfM1qe8a0fo1_500.gif",
   "http://www.theditherer.com/pictures/13.01.2014/1389624931.jpg",
   "http://wackymania.com/image/2010/12/funny-fail-photos/funny-fail-photos-07.jpg",
   "http://www.funpedia.net/imgs/aug11/funny-fail-photos-01.jpg",
   "http://mburufleitas.files.wordpress.com/2010/09/fail_08.jpg",
   "http://cdn2.holytaco.com/wp-content/uploads/images/2009/12/fail-cat.jpg",
   "http://www.revenue-engineer.com/wp-content/uploads/2011/08/fail.png",
   "http://www.reactiongifs.us/wp-content/uploads/2014/09/differently_in_my_mind_will_smith.gif",
   "http://www.reactiongifs.us/wp-content/uploads/2014/04/zoidberg_slinky_fail_futurama.gif",
   "http://www.reactiongifs.us/wp-content/uploads/2013/09/fail_three_amigos.gif",
   "http://www.reactiongifs.us/wp-content/uploads/2013/08/i_fucked_up_will_ferrell.gif",
   "http://www.reactiongifs.us/wp-content/uploads/2013/05/at-at_faceplant.gif",
   "http://www.reactiongifs.us/wp-content/uploads/2013/06/now_what_finding_nemo.gif",
   "http://media.tumblr.com/1029626e6c8f487a0d18521eeb043d2d/tumblr_inline_nj4i6cxH1m1raprkq.gif",
   "http://www.readthesmiths.com/articles/Images/Humor/Fail/epic-fail.jpg",
   "https://i.imgflip.com/jbjt9.jpg",
   "http://media.giphy.com/media/12Pq6yTCPMjajS/giphy.gif",
   "http://www.gurl.com/wp-content/uploads/2012/12/ron-burgundy.gif",
   "https://s3.amazonaws.com/uploads.hipchat.com/56752/568848/DwXH520ZVxLFizA/11172441_10205873757298302_607477308_n.gif",
   "https://s3.amazonaws.com/uploads.hipchat.com/56752/1026538/JZGXeOndZbC8hrt/upload.png",
   "http://images.cryhavok.org/d/1291-1/Computer+Rage.gif",
   "http://mrwgifs.com/wp-content/uploads/2013/03/Kronk-And-Ymzas-Bad-Luck-In-Emperors-New-Groove.gif",
   "http://3.bp.blogspot.com/_Nc998m5Qo6c/SoYi7Nxa3OI/AAAAAAAAEUI/L_psdvrPNf4/s400/Welcome_To_Fail.jpg"

]

module.exports = (robot) ->
   robot.hear /\b(fail)\b/i, (msg) ->
      msg.send msg.random fail
