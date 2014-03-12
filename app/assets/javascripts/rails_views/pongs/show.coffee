class PingPong.RailsViews.PongsShowView extends Backbone.View
  el: 'body'

  initialize: () ->
    @setBubblesHeight()
    $(window).resize =>
      @setBubblesHeight()

  setBubblesHeight: () ->
    $left_par = $('.player--left .player__bubble__info p')
    $right_par = $('.player--right .player__bubble__info p')
    new_height = if window.innerWidth > 1200 then Math.max($left_par.height(), $right_par.height()) else 'auto'
    $.merge($left_par, $right_par).css('min-height', new_height)
