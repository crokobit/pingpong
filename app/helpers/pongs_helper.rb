module PongsHelper

  def points_label score
    pluralize(score, 'vote', 'votes')
  end

end
