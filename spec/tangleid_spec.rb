require 'spec_helper'

describe TangleID do

  before do
    @api = TangleID::Api.new()
  end

  context 'new_user' do
    it 'with valid inputs should return a hash' do
      @valid_input = {
        first_name: "First",
        last_name: "Last"
      }
      response = @api.new_user(@valid_input)
      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.length).to be(81)
    end
  end

  context 'login' do
    it 'with valid inputs should return a hash' do

      valid_uuid = "ED9BCRDGJYWDHPTDNOPRULFWWG"

      response = @api.login(valid_uuid)

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response.include?("'hashes': []")).not_to be(true)
    end

    it 'with invalid inputs should return a hash' do

      invalid_uuid = "INVALIDUUID"

      response = @api.login(invalid_uuid)

      expect(response.include?("'hashes': []")).to be(true)
    end
  end
end
