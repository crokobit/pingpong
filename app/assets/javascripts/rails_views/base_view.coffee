class PingPong.RailsViews.BaseView extends Backbone.View
  el: 'body'

  initialize: () ->
    @initFacebook()
    @initTwitter()

  initFacebook: () ->
    ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      return  if d.getElementById(id)
      js = d.createElement(s)
      js.id = id
      js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=551190461638252"
      fjs.parentNode.insertBefore js, fjs
      return
    ) document, "script", "facebook-jssdk"

  initTwitter: () ->
    not ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      unless d.getElementById(id)
        js = d.createElement(s)
        js.id = id
        js.src = "//platform.twitter.com/widgets.js"
        fjs.parentNode.insertBefore js, fjs
    ) document, "script", "twitter-wjs"
