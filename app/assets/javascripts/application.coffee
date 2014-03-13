#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require js_stack/base/underscore/
#= require js_stack/base/backbone/
#= require_self
#= require_tree .

window.PingPong =
  RailsViews: {}

  initCurrentView: ->
    if @currentView?
      @currentView.undelegateEvents()
      @currentView = null

    viewName = $('body').data('view-name')
    @currentView = new PingPong.RailsViews[viewName]() if PingPong.RailsViews[viewName]?

  initBaseView: ->
    new PingPong.RailsViews.BaseView()

$ ->
  PingPong.initBaseView()
  PingPong.initCurrentView()
