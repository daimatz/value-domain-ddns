require 'value-domain-ddns/core'

describe ValueDomainDdns::Core do
  describe '#validate' do
    it 'succeed when domain, password, hostname exist' do
      config = {domain: 'example.com', password: 'pass', hostname: 'example'}
      core = ValueDomainDdns::Core.new(config)
      expect(core.validate).to eq(true)
    end
    context 'fails when required config lacks' do
      it 'in domain' do
        config = {password: 'pass', hostname: 'example'}
        core = ValueDomainDdns::Core.new(config)
        expect(core.validate).to eq(false)
      end
      it 'in password' do
        config = {domain: 'example.com', hostname: 'example'}
        core = ValueDomainDdns::Core.new(config)
        expect(core.validate).to eq(false)
      end
      it 'in hostname' do
        config = {domain: 'example.com', password: 'pass'}
        core = ValueDomainDdns::Core.new(config)
        expect(core.validate).to eq(false)
      end
    end
  end

  describe '#get_ip' do
    it 'succeed' do
      regex = /^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$/
      expect(ValueDomainDdns::Core.new({}).get_ip).to match(regex)
    end
  end
end
