require 'spec_helper'

describe Smpp::Protocol do
  it 'has a version number' do
    expect(Smpp::Protocol::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
