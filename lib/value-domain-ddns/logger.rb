require 'logger'

class ValueDomainDdns::Logger < ::Logger
  def initialize(out, level)
    super(out)
    self.level = level
  end
end
