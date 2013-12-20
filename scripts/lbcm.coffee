# Description:
#   Shorten URLs with lb.cm & expand detected lb.cm URLs
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_LBCM_API_KEY
#
# Commands:
#   hubot (lb.cm|shorten) (me) <url> - Shorten the URL using lb.cm
#   http://lb.cm/[name] - looks up the real url
#
# Author:
#   Dave Reid

module.exports = (robot) ->
  robot.respond /(lb\.cm|shorten)\s?(me)?\s?(.+)$/i, (msg) ->
    msg
      .http("http://lb.cm/shurly/api/shorten")
      .query
        apiKey: process.env.HUBOT_LBCM_API_KEY
        longUrl: msg.match[3]
      .get() (err, res, body) ->
        if err
          msg.send "Shortening for #{msg.match[3]} returned #{err}"
          return

        response = JSON.parse body
        if response.success is false
          msg.send "Shortening for #{response.longUrl} returned #{response.error}"
          return

        msg.send "Shortening for #{response.longUrl} returned #{response.shortUrl}"

   robot.hear /(https?:\/\/(lb.cm)\/.+)/ig, (msg) ->
     msg
       .http("http://lb.cm/shurly/api/expand")
       .query
         apiKey: process.env.HUBOT_LBCM_API_KEY
         shortUrl: msg.match
       .get() (err, res, body) ->
         if err
           msg.send "Lookup for {#msg.match} returned #{err}"
           return

         response = JSON.parse body
         if response.success is false
           msg.send "Lookup for #{response.shortUrl} returned #{response.error}"
           return

         msg.send "Lookup for #{response.shortUrl} returned #{response.longUrl}"
