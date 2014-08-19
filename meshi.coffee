# Description:
#   飯テロ
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_MESHI_ERROR_MESSAGE - エラーが発生した場合のメッセージ
#
# Commands:
#   hubot meshi - Receive meshitero

module.exports = (robot) ->

  robot.respond /meshi/i, (msg) ->
    msg.http("http://mstr.aozora0000.biz/")
      .get() (err, res, body) ->
        if err
          msg.send process.env.HUBOT_MESHI_ERROR_MESSAGE or "エラーっぽい"
        else
          msg.send JSON.parse(body).image
          if JSON.parse(body).tags
            msg.send JSON.parse(body).tags