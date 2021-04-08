#!/bin/bash
bundle exec grpc_tools_ruby_protoc -I ./../protos --ruby_out=./lib/protos --grpc_out=./lib/protos ./../protos/logger.proto
