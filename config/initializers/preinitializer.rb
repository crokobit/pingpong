pub_config = YAML.load(File.read(File.expand_path('../../public_config.yml',     __FILE__)))
PublicConfig = RecursiveOpenStruct.new(pub_config)
