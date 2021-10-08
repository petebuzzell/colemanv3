# Description:
#   Motivation from Ted Lasso
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lasso me - Motivates you to be better
#
# Author:
#   pbuzzell

module.exports = (robot) ->
#   robot.hear /\b(:lasso:|::ted lasso::)\b/i, (msg) ->
#     images = [
#       "http://i.imgur.com/kW0f7.jpg",
#       "http://i.imgur.com/vw9gZ.jpg",
#       "http://i.imgur.com/aV6ju.jpg",
#       "http://i.imgur.com/AQBJW.jpg",
#       "http://i.imgur.com/tKkRO.png",
#       "http://i.imgur.com/lkbGP.png",
#       "http://i.imgur.com/mx54e.jpg",
#       "http://i.imgur.com/LASrK.jpg",
#       "http://i.imgur.com/zvUBG.jpg",
#       "http://i.imgur.com/tjqca.jpg",
#       "http://i.imgur.com/q5CYv.jpg",
#       "http://i.imgur.com/HsoXm.jpg",
#       "http://i.imgur.com/6EGQm.jpg",
#       "http://i.imgur.com/DxpKu.jpg",
#       "http://i.imgur.com/h2c7L.jpg",
#       "http://i.imgur.com/jNyXL.jpg",
#       "http://i.imgur.com/K09cJ.jpg",
#       "http://i.imgur.com/mO0UE.jpg",
#       "http://i.imgur.com/9hhkx.jpg",
#       "https://media.giphy.com/media/lfmLzyIbqgCI0/giphy.gif",
#       "https://media.giphy.com/media/3oEduEHWLW6UiPA1Ww/giphy.gif",
#       "https://media.giphy.com/media/8s1bWO7hckdW/giphy.gif"]
#     msg.send msg.random images
  robot.respond /lasso me$/i, (msg) ->
    images = [
        "Takin’ on a challenge is a lot like riding a horse. If you’re comfortable while you’re doin’ it, you’re probably doin’ it wrong.",
        "Hey, hey, hey! If we see each other in our dreams. Let’s goof around a little bit, pretend like we don’t know each other.",
        "Fellas, I could watch you do this jaunty North Korean military thing you do all day, but I need a favor.",
        "When it comes to locker rooms, I like ’em just like my mother’s bathing suits. I only wanna see ’em in one piece.",
        "I always thought that tea was just gonna taste like hot brown water. And you know what? I was right. It’s horrible. No, thank you.",
        "Even Woody and Buzz got under each other’s plastic.",
        "You beating yourself up is like Woody Allen playing the clarinet. I don’t want to hear it.",
        "Don’t let the wisdom of age be wasted on you.",
        "I know change can be scary. One minute, you are playing freeze tag out there at recess with all your buddies. Next thing you know, you’re getting zits, your voice gets low. And every time your art teacher, Ms. Scanlon, leans over your desk to check and see how your project’s going, you feel all squiggly inside.",
        "I think that’s what it’s all about. Embracing change.",
        "One more person says something to me and Beard don’t understand. I’m gonna have one of my son’s classic temper tantrums. It’s basically just him calling me a bunch of silly names, you know, like, I don’t know, dummy head or poo-poo face pee-pee fingers.",
        "Tea and I are still on a lifelong hiatus.",
        "I promise you, there is something worse out there than being sad. And that is being alone and being sad. Ain’t no one in this room alone.",
        "All right, fellas, you gotta remember, your body is like day-old rice. If it ain’t warmed up properly, something real bad could happen.",
        "If God would have wanted games to end in a tie, she wouldn’t have invented numbers.",
        "You gonna give me the cold shoulder and the silent treatment. That’s a combo. Does it come with a medium drink?",
        "I believe in hope. I believe in Believe.",
        "Smells like potential.",
        "Seems like a smurf with an attitude would be a lot of fun to watch.",
        "Sounds to me like someone’s trapped inside life’s most complicated shape. A love triangle. Second place of course is the I just walked in on my mother-in-law changing into her swimsuit dodecahedron.",
        "You tore your butt. That’s nothing to be ashamed of.",
        "Knock-a-doodle-doo!",
        "Early drinkin’ means quick drunken.",
        "I think if you care about someone and you got a little love in your heart, there ain’t nothin you can’t get through together.",
        "Roy, I learned two pretty big lessons on the rough and tumble playgrounds of Bookridge Elementary School. One, if little Ronnie Fouch offers you a candy bar, you immediately say no and get the hell out of there cause there’s a good chance that little son of a gun has pooped inside of a Butterfinger wrapper. No one ever saw him do it, but a couple people ate it. Number two, teacher tells a bully not to pick on someone, it’s just gonna make it worse.",
        "I think I literally have a better understanding of who killed Kennedy than what is offside. (Long pause) It was the mob.",
        "If you would have told me that I’d be drinking tea at three o’clock every day… about a year ago… I would have punched you in the mouth.",
        "In my mind, you gotta have three things to be a Premier League team. 1) You gotta play physical. 2) you gotta give 100 percent until the final whistle and 3) you gotta be sponsored by a Middle-Eastern airline.",
        "How many countries are in this country?",
        "Be curious. Not judgmental.",
        "You know what the happiest animal on Earth is? It’s a goldfish. You know why? Got a ten-second memory. Be a goldfish, Sam.",
        "Hey, takin’ on a challenge is a lot like ridin’ a horse. If you’re comfortable while you’re doin’ it, you’re probably doin’ it wrong.",
        "This woman right here is strong, confident, and powerful. Boss, I tell ya, I’d hate to see you and Michelle Obama arm wrestle, but I wouldn’t be able to take my eyes off it, either.",
        "For me, success is not about the wins and losses. It’s about helping these young fellas be the best versions of themselves on and off the field.",
        "I like the idea of someone becoming rich because of what they gave to the world, not just because of who their family is.",
        "Little girls are mysterious. And silly and powerful. I gave up trying to figure them out years ago.",
        "I want you to know, I value each of your opinions, even when you’re wrong.",
        "Our goal is to go out like Willie Nelson — on a high!",
        "When it comes to locker rooms, I like ’em just like my mother’s bathing suits. I only wanna see ’em in one piece.",
        "I’m looking forward to the definition of relegation.",
        "Ties and no playoffs? Why do you even do this?",
        "Come on Rob! You gotta get it in there to get three points!",
        "Will you explain to me how that was offside? No! I’m asking you. Seriously! Explain offside to me. It makes no sense.",
        "That right there, that’s a scone. Tastes like a muffin except it sucks all the spit out of your mouth.",
        "I have a real tricky time hearing folks that don’t believe in themselves.",
        "That’s the funny thing about coincidences, ain’t it? Sometimes they just happen."
      ]
    msg.send msg.random images