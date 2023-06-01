require 'logger'
require 'debug'

class ConcurrentLogger < Logger
  attr_reader :output_channel

  def initialize(output_channel:)
    @output_channel = output_channel
    super(output_channel)
  end
end



logger = ConcurrentLogger.new(output_channel: $stdout)
logger.add(Logger::WARN, 'add')
puts 'Hi mom'

