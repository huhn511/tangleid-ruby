require "tangleid/version"

module TangleID
  class Client
    # Your code goes here...
    require 'uri'
    require 'net/http'
    require 'net/https'
    require 'json'

    def initialize(settings = {})
      pp "initialize - settings #{settings}"
    end

    def create_user(first_name, last_name)
      @toSend = {
        "command":"new_user",
        "first_name": first_name,
        "cosignerp":"SD9BCRDGJYWDHPTDNOPRULFWWG",
        "cosigners":"SD9BCRDGJYWDHPTDNOPRULFWWG",
        "last_name": last_name,
        "profile_picture":"https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg",
        "uuid":"ED9BCRDGJYWDHPTDNOPRULFWWG",
        "pk":"SD9BCRDGJYWDHPTDNOPRULFWWG"
      }.to_json

      uri = URI.parse("http://node2.puyuma.org:8000/")
      https = Net::HTTP.new(uri.host,uri.port)
      #https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
      req['foo'] = 'bar'
      req.body = @toSend
      res = https.request(req)
      puts "Response #{res.code} #{res.message}}"
      if res.code == "200"
        pp "success"
        puts "Address: #{res.body}"
        return res.body
      else
        pp "error"
        pp res.body
        return false
      end
    end

  end
end
