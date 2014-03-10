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
