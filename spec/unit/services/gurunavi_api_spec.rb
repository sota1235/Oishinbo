require 'spec_helper'
require 'rest-client'

RSpec.describe Oishinbo::GurunaviApi do
  before do
    @service = Oishinbo::GurunaviApi.new
  end

  it 'return informations of restaurant by free word searching' do
    # allow call get function
    rest_client = RestClient
    expect(rest_client).to receive(:get).and_return '[ "hoge" ]'

    # assertion
    expect(@service.search_restaurant_by_fw 'moge', 1).to eq [ "hoge" ]
  end

  it 'return hello' do
    expect(@service.get_restaurant_info).to eq 'hello'
  end
end
