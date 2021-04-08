require 'grpc'
require_relative '../protos/protos'
require_relative './server_impl'

port = '0.0.0.0:50051'

server = GRPC::RpcServer.new
server.add_http2_port(port, :this_port_is_insecure)
# sever.add_insecure_port  # for unixdomainsocket??
GRPC.logger.info("... running insecurely on #{port}")

server.handle(LoggerServerImpl.new)
server.run_till_terminated_or_interrupted(%w[SIGINT SIGQUIT])
