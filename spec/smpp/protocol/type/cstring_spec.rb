require 'spec_helper'

describe Smpp::Protocol::Type::CString do
  let(:pdu) { double('TestPDU') }

  subject { described_class.new(pdu, :test, { default: 'Test' }) }

  let(:buffer) { StringIO.new }
  let(:io) { Smpp::Protocol::PDUStream.new(buffer) }

  describe '#write' do
    specify { expect { subject.write(io) }.to change { buffer.string }.to("Test\x0") }
  end

  describe '#read' do
    let(:buffer) { StringIO.new("FooBar\x0") }

    specify { expect { subject.read(io) }.to change { subject.value }.to('FooBar') }
  end
end
