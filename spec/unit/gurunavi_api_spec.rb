require 'spec_helper'

RSpec.describe Oishinbo::GurunaviApi do
  it 'return hello' do
    expect(Oishinbo::GurunaviApi.new.get_restaurant_info).to eq 'hello'
  end
end
