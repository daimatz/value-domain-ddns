class ValueDomainDdns::Core
  def initialize(config)
    @config = config
  end

  def validate
    !!@config[:domain] && !!@config[:password] && !!@config[:hostname]
  end

  def get_ip()

  end

  def sync()

  end
end
