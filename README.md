# practice-grpc

## sample

テキストを保存したり、それを取り出したりする実装  
`protos/logger.proto` を読むと大体把握できる

## how to run

### ruby

```
cd ruby
bundle install
```

```
# server
ruby ruby/lib/logger/server.rb
# client
ruby ruby/lib/logger/client.rb
```
