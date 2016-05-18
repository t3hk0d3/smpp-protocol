require 'spec_helper'

describe Smpp::Protocol::PDUStream do

  let(:io) { StringIO.new }

  subject(:stream) { described_class.new(io) }

  describe 'read' do
    let(:io) { StringIO.new([buffer].pack('H*')) }

    describe '#read_byte' do
      let(:buffer) { 'FA' }

      specify { expect(subject.read_byte).to eq(250) }
    end

    describe '#read_short' do
      let(:buffer) { 'FDE8' }

      specify { expect(subject.read_short).to eq(65000) }
    end

    describe '#read_integer' do
      let(:buffer) { 'FFFFFFFF' }

      specify { expect(subject.read_integer).to eq(4294967295) }
    end

    describe '#read_cstring' do
      let(:buffer) { '546573742100' }

      specify { expect(subject.read_cstring).to eq('Test!') }
    end

    describe '#read_string' do
      let(:buffer) { '54657374' }

      specify { expect(subject.read_string(4)).to eq('Test') }
    end
  end

  describe 'write' do
    subject { io.string.unpack('H*').first.upcase }

    describe '#write_byte' do
      before do
        stream.write_byte(250)
      end

      specify { is_expected.to eq('FA') }
    end

    describe '#write_short' do
      before do
        stream.write_short(65000)
      end

      specify { is_expected.to eq('FDE8') }
    end

    describe '#write_integer' do
      before do
        stream.write_integer(4294967295)
      end

      specify { is_expected.to eq('FFFFFFFF') }
    end

    describe '#write_cstring' do
      before do
        stream.write_cstring('Test!')
      end

      specify { is_expected.to eq('546573742100') }
    end

    describe '#write_string' do
      before do
        stream.write_string('Test')
      end

      specify { is_expected.to eq('54657374') }
    end
  end
end
