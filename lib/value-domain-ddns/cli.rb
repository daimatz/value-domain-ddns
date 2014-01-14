require 'thor'

class ValueDomainDdns::Cli < Thor
  options :domain => :string, :password => :string,
    :hostname => :string, :ip => :string
  options :config => :string
  options :logfile => :string
  desc "sync", "update and sync ddns record"
  long_desc <<-EOD
    Update and sync ddns record.
    Default config file is `./config.json`.
    If other fields are set, it overwrites config file's value.
  EOD
  def sync
    config_file = options[:config] || "./config.json"
    config = ValueDomainDdns::Config.load(config_file)
    ddns = ValueDomainDdns::Core.new(config)
    log = ValueDomainDdns::Logger.new(options[:logfile] || STDOUT, Logger::INFO)
    if !ddns.validate
      STDERR.puts "domain, password, hostname are required."
      exit
    end
    config[:ip] = ddns.get_ip if !config[:ip]
    params = ddns.submit_params
    params["p"] = '******'
    log.info("update to #{ValueDomainDdns::SUBMIT_BASE_URL} with params:"+params.to_s)
    log.info(ddns.sync())
  end
end
