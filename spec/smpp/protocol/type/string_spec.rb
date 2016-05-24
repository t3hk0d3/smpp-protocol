require 'spec_helper'

describe Smpp::Protocol::Type::String do
  let(:length_field) do
    double('LengthField').tap do |field|
      allow(field).to receive(:value).and_return(length)
      allow(field).to receive(:value=).with(kind_of(Fixnum))
    end
  end

  let(:pdu) do
    double('TestPDU').tap do |pdu|
      allow(pdu).to receive(:field).with(:length_field).and_return(length_field)
    end
  end

  let(:length) { data.size }
  let(:data) { 'Hello World!' }

  subject { described_class.new(pdu, :test, :length_field, { default: 'Test' }) }

  let(:buffer) { StringIO.new(data) }
  let(:io) { Smpp::Protocol::PDUStream.new(buffer) }

  describe '#value=' do
    before { subject.value = 'FooBar' }

    specify { expect(subject.value).to eq('FooBar') }
    specify { expect(length_field).to have_received(:value=).with(6) }
  end

  describe '#write' do
    let(:buffer) { StringIO.new }

    specify { expect { subject.write(io) }.to change { buffer.string }.to('Test') }
  end

  describe '#read' do
    specify { expect { subject.read(io) }.to change { subject.value }.to('Hello World!') }
  end
end
