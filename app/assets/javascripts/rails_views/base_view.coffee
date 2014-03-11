class PingPong.RailsViews.BaseView extends Backbone.View
  el: 'body'

  events:
    'click a[href=#fb-share]': 'shareOnFacebook'
    'click a[href=#tweet]': 'tweet'

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

  shareOnFacebook: (e) ->
    img_url = $(e.target).attr('data-img')
    e.preventDefault()
    @shareBase('fb', '', '', img_url)

  tweet: (e) ->
    e.preventDefault()
    $link = $(e.target)
    via = $link.attr('data-via')
    text = $link.attr('data-text')
    @shareBase('twitter', text, via, '')

  shareBase: (method, text, via, img_url) ->
    window_width = window.innerWidth
    width = Math.max(320, window_width / 2)
    left = (window_width - width) / 2 + 15
    url = location.href
    full_url = "https://twitter.com/intent/tweet?original_referer=#{url}&text=#{text}&tw_p=tweetbutton&url=#{url}&via=#{via}" if method == 'twitter'
    full_url = "https://www.facebook.com/sharer/sharer.php?u=#{url}&[images][0]=#{img_url}" if method == 'fb'
    window.open(full_url, '', "width=#{width}, height=320, top=#{left / 2}, left=#{left}")
