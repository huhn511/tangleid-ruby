require 'spec_helper'

describe TangleID do

  before do
    @api = TangleID::Api.new()
  end

  context 'new_user' do
    it 'with valid inputs should return a hash' do
      valid_input = {
        first_name: "First",
        last_name: "Last",
        cosignerp: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        cosigners: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        profile_picture: "https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg",
        uuid: "ED9BCRDGJYWDHPTDNOPRULFWWG",
        pk: "SD9BCRDGJYWDHPTDNOPRULFWWG"
      }
      response = @api.new_user(valid_input)
      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

  context 'login' do
    it 'with valid inputs should return a hash' do

      valid_input = {
        uuid: "ED9BCRDGJYWDHPTDNOPRULFWWG"
      }

      response = @api.login(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("'hashes': []")).not_to be(true)
    end

    it 'with invalid inputs should return a hash' do

      invalid_input = {
        uuid: "INVALIDUUID"
      }

      response = @api.login(invalid_input)

      expect(response.include?("'hashes': []")).to be(true)
    end
  end

  context 'new_group' do
    it 'with valid inputs should return a hash' do

      valid_input = {
        uuid: "ED9BCRDGJYWDHPTDNOPRULFWWG",
        first_name: "First",
        last_name: "Last",
        cosignerp: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        cosigners: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        profile_picture: "https://s3-us-west-1.amazonaws.com/niusnews-imgs/146716_5.jpg",
        pk: "SD9BCRDGJYWDHPTDNOPRULFWWG"
      }

      response = @api.new_group(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

  context 'get_all_claims' do
    it 'with valid inputs should return all claims' do

      valid_input = {
        uuid: "V9TCFLAOGGTAQATTJBLABAG9WY"
      }

      response = @api.get_all_claims(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
    end
  end

  context 'get_claim_info' do
    it 'with valid hash_txn should return a ?' do

      valid_input = {
        hash_txn: "FTFJEAKZTBBFWLD9TWFYLCZABKTMKD9QKYWOZLNMOMNRKCLTNSDAXNFUODFQSSSNRGQTMPMFGPFF99999"
      }

      response = @api.get_claim_info(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
    end
    it 'with invalid hash_txn should return a ?' do

      valid_input = {
        hash_txn: "INVALIDZTBBFWLD9TWFYLCZABKTMKD9QKYWOZLNMOMNRKCLTNSDAXNFUODFQSSSNRGQTMPMFGPFF99999"
      }

      response = @api.get_claim_info(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
    end
  end

  context 'new_claim' do
    it 'with valid inputs should return a hash' do

      valid_input = {
        uuid: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        part_a: "9JVXCXMFAMKLUQQCDACSWJVDLH",
        part_b: "9JVXCXMFAMKLUQQCDACSWJVDLH",
        exp_date: "20190101",
        claim_pic: "https://www.chill.ie/images/Customer-Care/ncb-example.png",
        msg: "testing message"
      }

      response = @api.new_claim(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

  context 'revoke_claim' do
    it 'with valid inputs should return a hash' do

      valid_input = {
        uuid: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        txnhash: "KQD9IKGNUM9ZVMHJHKVZLAAVDNDWJRNTZDYB9SXKMXPMBYNRGCOIMIVLTSRCJEXRAMWDNZODLBVR99999"
      }

      response = @api.revoke_claim(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

  context 'get_all_revoke_claims' do
    it 'should return a array with hashes with valid inputs ' do

      valid_input = {
        uuid: "SD9BCRDGJYWDHPTDNOPRULFWWG"
      }

      response = @api.get_all_revoke_claims(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("'hashes': []")).to_not be(true)
    end
    it 'with invalid inputs should return an empty array' do

      valid_input = {
        uuid: "INVALID"
      }

      response = @api.get_all_revoke_claims(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("'hashes': []")).to be(true)
    end
  end

  context 'get_all_notifies' do
    it 'with valid inputs should return an array with hashes' do

      valid_input = {
        uuid: "SD9BCRDGJYWDHPTDNOPRULFWWG"
      }

      response = @api.get_all_notifies(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("'hashes': []")).to_not be(true)
    end
    it 'with invalid inputs should return an empty array' do

      invalid_input = {
        uuid: "INVALID"
      }

      response = @api.get_all_notifies(invalid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("[]")).to be(true)
    end
  end

  context 'send_notify' do
    it 'with valid inputs should return a hash' do

      valid_input = {
        uuid: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        receiver: "SD9BCRDGJYWDHPTDNOPRULFWWG",
        message: "test message"
      }

      response = @api.send_notify(valid_input)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

end
