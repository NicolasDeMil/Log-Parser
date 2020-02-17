class Record
  attr_reader :path, :ip
  attr_accessor :unique
  def initialize(attributes = {})
    @path = attributes[:path]
    @ip = attributes[:ip]
    @unique = 0
  end
end
