hubot-lb.cm
===========

[Hubot](https://github.com/github/hubot) script for creating or expanding [lb.cm](http://lb.cm/) shortened URLs.

## Installing

1. Add `hubot-lb.cm` as a dependency to your hubot:
    `"hubot-lb.cm": ""`
2. Tell hubot to load it. Add `"hubot-lb.cm"` to the `external-scripts.json` list in the hubot root folder.
3. Run `npm install` while you grab a beer.
4. Set environment variable `HUBOT_LBCM_API_KEY` to an administrative user's API key from [lb.cm](http://lb.cm/).

## Usage

* Create new short URLs by using `hubot shorten|lb.cm (me) <url>`
  * `hubot lb.cm http://www.lullabot.com` will reply with `Shortening for http://www.lullabot.com returned http://lb.cm/Zk5`
* Expand URLs by simply posting the lb.cm URL
  * `http://lb.cm/Zk5` will automatically trigger the bot to reply with `Lookup for http://lb.cm/Zk5 returned http://www.lullabot.com`
