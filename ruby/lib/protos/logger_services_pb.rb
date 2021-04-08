# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: logger.proto for package 'logger'

require 'grpc'
require 'logger_pb'

module Logger
  module Logger
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'logger.Logger'

      rpc :PrintText, ::Logger::SimpleText, ::Logger::Result
      rpc :PrintTextStream, stream(::Logger::SimpleText), ::Logger::Result
      rpc :PullHistory, ::Google::Protobuf::Empty, stream(::Logger::SimpleText)
    end

    Stub = Service.rpc_stub_class
  end
end