require 'grpc'
require_relative '../protos/protos'

stub = Logger::Logger::Stub.new('localhost:50051', :this_channel_is_insecure)

puts 'connect ok.'
puts 'what do you want?'
puts '[1] print_text'
puts '[2] print_text_stream'
puts '[3] pull_history'

case gets&.chomp
when '1'
  puts 'write something'
  l = gets || 'none'
  res = stub.print_text(Logger::SimpleText.new(text: l))
  p [res.success, res.length]
when '2'
  puts 'write something or ctrl+D'
  stream = Enumerator.new do |yielder|
    while l = gets
      yielder << Logger::SimpleText.new(text: l.chomp)
    end
  end
  res = stub.print_text_stream(stream)
  p [res.success, res.length]
when '3'
  stub.pull_history(Google::Protobuf::Empty.new).each do |simple_text|
    text = simple_text.text
    puts text
  end
end
