module PongsHelper

  def points_label score
    pluralize(score, 'pt', 'pts')
  end

end
