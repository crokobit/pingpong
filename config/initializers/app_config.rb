class AppConfig

  def self.disqus_name
    @@disqus_name ||= ENV['DISQUS_NAME']
  end

  def self.admins
    @@admins ||= ENV['ADMINS'].split(",")
  end

  def self.reviewers
    @@reviewers = ENV['REVIEWERS'].present? ? ENV['REVIEWERS'].split(",") : []
  end

end
