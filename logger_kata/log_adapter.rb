require 'logger'
require 'debug'

class ConcurrentLogger < Logger
  def initialize(output_channel:)
    @output_channel = output_channel
    super(output_channel)
    self.formatter = set_formatter
  end

  private

  attr_reader :output_channel

  def set_formatter
    proc do |severity, time, progname, msg|
      thread_id = Thread.current.native_thread_id
      "#{severity} #{time.strftime(datetime_format)} [#{Process.pid} - #{thread_id}]: #{msg}\n"
    end
  end

  def datetime_format
    "%m-%d-%y %k:%M:%S:%L"
  end
end



logger = ConcurrentLogger.new(output_channel: $stdout)
logger.add(Logger::WARN, 'add')
puts 'Hi mom'

