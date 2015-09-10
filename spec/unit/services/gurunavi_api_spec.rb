require 'spec_helper'
require 'rest-client'
include Oishinbo

RSpec.describe GurunaviApi do
  before do
    @service ||= GurunaviApi.new
  end

  it 'return informations about restaurant by free word searching' do
    # allow call request function
    expect(@service).to receive(:request).and_return '[ "hoge" ]'

    # assertion
    expect(@service.search_restaurant_by_fw 'moge', 1).to eq [ "hoge" ]
  end

  it 'return information about information by id' do
    # allow call request function
    expect(@service).to receive(:request).and_return '[ "moge" ]'

    # assertion
    expect(@service.get_restaurant_info_by_id 1).to eq [ "moge" ]
  end
end
