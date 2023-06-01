require 'logger'
require 'debug'

class ConcurrentLogger < Logger
  def initialize(level = Logger::WARN, output_channel:)
    @output_channel = output_channel
    super(output_channel)
    self.formatter = set_formatter
    self.level = level
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
logger.debug("I shouldn't see this message at all")
logger.add(Logger::ERROR, 'this is a serious error')
logger.level = Logger::DEBUG
logger.debug("But I should see this one I should see")

