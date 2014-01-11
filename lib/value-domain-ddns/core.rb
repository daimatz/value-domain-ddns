require 'value-domain-ddns/constant'
require 'open-uri'

class ValueDomainDdns::Core
  def initialize(config)
    @config = config
  end

  def validate
    !!@config[:domain] && !!@config[:password] && !!@config[:hostname]
  end

  def get_ip()
    open(ValueDomainDdns::GET_IP_URL).read
  end

  def sync()

  end
end
