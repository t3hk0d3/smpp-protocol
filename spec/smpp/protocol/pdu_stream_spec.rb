require 'spec_helper'

describe Smpp::Protocol::PDUStream do
  let(:io) { StringIO.new }

  subject(:stream) { described_class.new(io) }

  context 'read' do
    let(:io) { StringIO.new([buffer].pack('H*')) }

    describe '#read_byte' do
      let(:buffer) { 'FA' }

      specify { expect(subject.read_byte).to eq(250) }
    end

    describe '#read_short' do
      let(:buffer) { 'FDE8' }

      specify { expect(subject.read_short).to eq(65_000) }
    end

    describe '#read_integer' do
      let(:buffer) { 'FFFFFFFF' }

      specify { expect(subject.read_integer).to eq(4_294_967_295) }
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

  context 'write' do
    subject { io.string.unpack('H*').first.upcase }

    describe '#write_byte' do
      context 'integer' do
        before { stream.write_byte(250) }
        specify { is_expected.to eq('FA') }
      end

      context 'null' do
        before { stream.write_byte(nil) }
        specify { is_expected.to eq('00') }
      end
    end

    describe '#write_short' do
      context 'integer' do
        before { stream.write_short(65_000) }
        specify { is_expected.to eq('FDE8') }
      end

      context 'null' do
        before { stream.write_short(nil) }
        specify { is_expected.to eq('0000') }
      end
    end

    describe '#write_integer' do
      context 'integer' do
        before { stream.write_integer(4_294_967_295) }
        specify { is_expected.to eq('FFFFFFFF') }
      end

      context 'null' do
        before { stream.write_integer(nil) }
        specify { is_expected.to eq('00000000') }
      end
    end

    describe '#write_cstring' do
      context 'string' do
        before { stream.write_cstring('Test!') }
        specify { is_expected.to eq('546573742100') }
      end

      context 'null' do
        before { stream.write_cstring(nil) }
        specify { is_expected.to eq('00') }
      end
    end

    describe '#write_string' do
      before { stream.write_string('Test') }
      specify { is_expected.to eq('54657374') }
    end
  end
end
