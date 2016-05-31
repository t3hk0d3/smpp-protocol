require 'spec_helper'

describe Smpp::Protocol::Type::DateTime do

  subject { described_class.new(double('PDU'), :test) }

  describe '#value' do
    context 'absolute' do
      before { subject.raw_value = '160504030201604+' }

      specify { expect(subject.value).to eq(DateTime.new(2016, 5, 4, 3, 2, 1.6, '+04')) }
    end

    context 'relative' do
      before { subject.raw_value = '070605040302100R' }

      specify { expect(subject.value).to eq(236901782.1) }

    end
  end

  describe '#value=' do
    context 'string' do
      before { subject.value = '160504030201604+' }
      specify { expect(subject.raw_value).to eq('160504030201604+') }
    end

    context 'datetime' do
      before { subject.value = DateTime.new(2016, 5, 4, 3, 2, 1.6, '+04') }
      specify { expect(subject.raw_value).to eq('160504030201604+') }
    end

    context 'time' do
      before { subject.value = Time.new(2016, 5, 4, 3, 2, 1.6, 4 * 3600) }
      specify { expect(subject.raw_value).to eq('160504030201604+') }
    end

    context 'number' do
      before { subject.value = 236901782.1 }
      specify { expect(subject.raw_value).to eq('070605040302100R') }
    end
  end
end
