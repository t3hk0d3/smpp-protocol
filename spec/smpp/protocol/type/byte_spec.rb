require 'spec_helper'

describe Smpp::Protocol::Type::Byte do
  let(:pdu) { double('TestPDU') }

  subject { described_class.new(pdu, :test, { default: 123 }) }

  let(:buffer) { StringIO.new }
  let(:io) { Smpp::Protocol::PDUStream.new(buffer) }

  describe '#write' do
    specify { expect { subject.write(io) }.to change { buffer.string }.to("{") }
  end

  describe '#read' do
    let(:buffer) { StringIO.new("\xFA") }

    specify { expect { subject.read(io) }.to change { subject.value }.to(250) }
  end
end
