require 'value-domain-ddns/config'
require 'spec_helper'

describe ValueDomainDdns::Config do
  describe '#load' do
    it 'loads config file correctly' do
      file = make_json_file(domain: 'example.com', password: 'hoge', dummy: 100)
      config = ValueDomainDdns::Config.load(file)
      expect(config[:domain]).to eq('example.com')
      expect(config[:password]).to eq('hoge')
      expect(config[:hostname]).to eq(nil)
      expect(config[:ip]).to eq(nil)
      expect(config[:dummy]).to eq(100)
    end
  end
end
