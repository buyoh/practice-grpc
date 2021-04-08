require_relative '../protos/protos'

class LoggerServerImpl < Logger::Logger::Service
  def print_text(simple_text, _call)
    text = simple_text.text
    @history ||= []
    @history << text
    puts text
    Logger::Result.new(success: true, length: @history.size)
  end

  def print_text_stream(call)
    call.each_remote_read do |simple_text|
      text = simple_text.text
      @history ||= []
      @history << text
      puts text
    end
    Logger::Result.new(success: true, length: @history.size)
  end

  def pull_history(_empty, _call)
    # return @history.each
    Enumerator.new do |yielder|
      @history ||= []
      @history.each do |l|
        sleep 0.5
        yielder << Logger::SimpleText.new(text: l)
      end
    end
  end
end
