require 'rails_helper'

RSpec.describe Code, type: :model do
  before(:each) do
    @code = Code.new(raw_code: 'rspec_test')
  end

  it 'should be valid' do
    expect(@code[:raw_code]).to eq 'rspec_test'
  end

  
end
