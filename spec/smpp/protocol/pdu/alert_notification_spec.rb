require 'spec_helper'

describe Smpp::Protocol::PDU::AlertNotification do

  describe '.command_id' do
    specify { expect(described_class.command_id).to eq(0x00000102) }
  end

  describe '.command_name' do
    specify { expect(described_class.command_name).to eq(:alert_notification) }
  end

end