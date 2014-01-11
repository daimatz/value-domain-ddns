require 'json'

module ValueDomainDdns::Config
  def self.keys
    [:domain, :password, :hostname, :ip]
  end
  def self.load(filepath)
    hash = {}
    open(filepath) do |io|
      JSON.load(io).each do |key, value|
        hash[key.to_sym] = value
      end
    end
    hash
  end
end
