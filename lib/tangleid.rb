require "tangleid/version"

module TangleID
  class Api
    require 'uri'
    require 'net/http'
    require 'net/https'
    require 'json'

    attr_reader :swarm_node_url

    def initialize(settings = {})
      setSettings(settings)
    end

    def new_user(first_name:, last_name:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/new_user.sh
      # POST '{"command":"new_user","first_name":"Huang","cosignerp":"SD9BCRDGJYWDHPTDNOPRULFWWG","cosigners":"SD9BCRDGJYWDHPTDNOPRULFWWG","last_name":"JyunYu","profile_picture":"https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg","uuid":"ED9BCRDGJYWDHPTDNOPRULFWWG","pk":"SD9BCRDGJYWDHPTDNOPRULFWWG"}'

      data = {
        "command":"new_user",
        "first_name": first_name,
        "cosignerp":"SD9BCRDGJYWDHPTDNOPRULFWWG",
        "cosigners":"SD9BCRDGJYWDHPTDNOPRULFWWG",
        "last_name": last_name,
        "profile_picture":"https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg",
        "uuid":"ED9BCRDGJYWDHPTDNOPRULFWWG",
        "pk":"SD9BCRDGJYWDHPTDNOPRULFWWG"
      }

      return send data
    end

    def login(uuid:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/login.sh
      # POST '{"command":"login","uuid": "ED9BCRDGJYWDHPTDNOPRULFWWG"}'
      data = {
        "command":"login",
        "uuid": uuid
      }

      return send data
    end

    def new_group(uuid:, first_name:, last_name:, cosignerp:, cosigners:, profile_picture:, pk:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/new_group.sh
      # POST '{"command":"new_group","first_name":"Huang", "cosignerp":"SD9BCRDGJYWDHPTDNOPRULFWWG","cosigners":"SD9BCRDGJYWDHPTDNOPRULFWWG", "last_name":"JyunYu","profile_picture":"https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg", "uuid":"ED9BCRDGJYWDHPTDNOPRULFWWG","pk":"SD9BCRDGJYWDHPTDNOPRULFWWG"}'
      data = {
        "command": "new_group",
        "first_name": first_name,
        "cosignerp": cosignerp,
        "cosigners": cosigners,
        "last_name": last_name,
        "profile_picture": profile_picture,
        "uuid": uuid,
        "pk": pk
      }

      return send data
    end

    def get_all_claims(uuid:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/get_all_claims.sh
      # POST '{"command":"get_all_claims","uuid": "V9TCFLAOGGTAQATTJBLABAG9WY"}'
      data = {
        "command":"get_all_claims",
        "uuid": "V9TCFLAOGGTAQATTJBLABAG9WY"
      }

      return send data
    end


    def get_claim_info(hash_txn:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/get_claim_info.sh
      # POST '{"command":"get_claim_info","hash_txn": "FTFJEAKZTBBFWLD9TWFYLCZABKTMKD9QKYWOZLNMOMNRKCLTNSDAXNFUODFQSSSNRGQTMPMFGPFF99999"}'
       data = {
         "command": "get_claim_info",
         "hash_txn": hash_txn
       }

       return send data
    end

    def new_claim(uuid:, part_a:, part_b:, exp_date:, claim_pic:, msg:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/new_claim.sh
      # POST '{"command":"new_claim","uuid": "SD9BCRDGJYWDHPTDNOPRULFWWG","part_a":"9JVXCXMFAMKLUQQCDACSWJVDLH","part_b":"9JVXCXMFAMKLUQQCDACSWJVDLH","exp_date":"20190101","claim_pic":"https://www.chill.ie/images/Customer-Care/ncb-example.png","msg":"testing message"}'
      data = {
        "command":"new_claim",
        "uuid": uuid,
        "part_a": part_a,
        "part_b": part_b,
        "exp_date": exp_date,
        "claim_pic": claim_pic,
        "msg": msg
      }
      return send data
    end

    def revoke_claim(uuid:, txnhash:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/revoke_claim.sh
      # POST '{"command":"revoke_claim","uuid": "SD9BCRDGJYWDHPTDNOPRULFWWG","txnhash":"KQD9IKGNUM9ZVMHJHKVZLAAVDNDWJRNTZDYB9SXKMXPMBYNRGCOIMIVLTSRCJEXRAMWDNZODLBVR99999"}'
      data = {
        "command":"revoke_claim",
        "uuid": "SD9BCRDGJYWDHPTDNOPRULFWWG",
        "txnhash":"KQD9IKGNUM9ZVMHJHKVZLAAVDNDWJRNTZDYB9SXKMXPMBYNRGCOIMIVLTSRCJEXRAMWDNZODLBVR99999"
      }

      return send data
    end

    def get_all_revoke_claims(uuid:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/get_all_revoke_claims.sh
      # POST '{"command":"get_all_revoke_claims","uuid": "SD9BCRDGJYWDHPTDNOPRULFWWG"}'
      data = {
        "command":"get_all_revoke_claims",
        "uuid": uuid
      }

      return send data
    end

    def get_all_notifies(uuid:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/get_all_notifies.sh
      # POST '{"command":"get_all_notifies","uuid": "SD9BCRDGJYWDHPTDNOPRULFWWG"}'
      data = {
        "command":"get_all_notifies",
        "uuid": uuid
      }

      return send data
    end

    def send_notify(uuid:, receiver:, message:)
      # https://github.com/TangleID/tangleid-api-examples/blob/master/send_notify.sh
      # POST '{"command":"send_notify","uuid":"SD9BCRDGJYWDHPTDNOPRULFWWG","receiver": "SD9BCRDGJYWDHPTDNOPRULFWWG","message":"HAPPYBIRTHDAY"}'
      data = {
        "command": "send_notify",
        "uuid": uuid,
        "receiver": receiver,
        "message": message
      }

      return send data
    end

    private

    def setSettings(settings)
      settings = symbolize_keys(settings)

      @swarm_node_url = settings[:swarm_node_url] || 'http://node2.puyuma.org:8000/'
    end

    def symbolize_keys(hash)
      hash.inject({}){ |h,(k,v)| h[k.to_sym] = v; h }
    end

    def send(data)

      uri = URI.parse(@swarm_node_url)
      https = Net::HTTP.new(uri.host,uri.port)
      # TODO: comment in line blow
      #https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
      req.body = data.to_json
      res = https.request(req)
      
      if res.code == "200"
        return res.body
      else
        return false
      end
    end
  end
end
