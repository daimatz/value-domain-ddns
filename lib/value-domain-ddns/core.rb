require 'open-uri'
require 'uri'

require 'value-domain-ddns/constant'

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

  def submit_params
    {
      'd' => @config[:domain],
      'p' => @config[:password],
      'h' => @config[:hostname],
      'i' => @config[:ip]
    }
  end

  def sync()
    query_string = submit_params.map { |k, v|
      URI.encode(k.to_s) + '=' + URI.encode(v.to_s)
    }.join('&')
    submit_url = ValueDomainDdns::SUBMIT_BASE_URL + '?' + query_string
    open(URI.parse(submit_url)).read
  end
end
