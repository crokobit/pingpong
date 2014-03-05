class AppConfig

  def self.disqus_name
    @@disqus_name ||= ENV['DISQUS_NAME']
  end

  def self.admins
    @@disqus_name ||= ENV['ADMINS'].split(",")
  end

end
