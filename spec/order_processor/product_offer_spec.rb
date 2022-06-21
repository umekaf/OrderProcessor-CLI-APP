# frozen_string_literal: true

RSpec.describe OrderProcessor::ProductOffer do
  subject { described_class.new(green_tea_count, strawberry_count, coffee_count).call }

  context 'when green tea ordered only once' do
    let(:green_tea_count) { 1 }
    let(:strawberry_count) { 0 }
    let(:coffee_count) { 0 }

    it { is_expected.to be_an Array }
    it 'returns single instance of a product' do
      expect(subject.first).to be_an_instance_of(OrderProcessor::Product)
      expect(subject.first.price).to eq(3.11)
    end
  end

  context 'when green tea ordered twice' do
    let(:green_tea_count) { 2 }
    let(:strawberry_count) { 0 }
    let(:coffee_count) { 0 }

    it 'sets price as half of the original price' do
      expect(subject.first.price).to eq(3.11 / 2)
    end
  end

  context 'when strawberry is ordered less than 3 times' do
    let(:green_tea_count) { 0 }
    let(:strawberry_count) { 2 }
    let(:coffee_count) { 0 }

    it { is_expected.to be_an Array }
    it 'returns single instance of a product' do
      expect(subject.first).to be_an_instance_of(OrderProcessor::Product)
      expect(subject.first.price).to eq(5.00)
    end
  end

  context 'when straberry is ordered 3 or more than 3 times' do
    let(:green_tea_count) { 0 }
    let(:strawberry_count) { 3 }
    let(:coffee_count) { 0 }

    it 'sets discount on the original price of the strawberry' do
      expect(subject.first.price).to eq(4.50)
    end
  end

  context 'when coffee is ordered less than 3 times' do
    let(:green_tea_count) { 0 }
    let(:strawberry_count) { 0 }
    let(:coffee_count) { 2 }

    it { is_expected.to be_an Array }
    it 'returns single instance of a product' do
      expect(subject.first).to be_an_instance_of(OrderProcessor::Product)
      expect(subject.first.price).to eq(11.23)
    end
  end

  context 'when straberry is ordered 3 or more than 3 times' do
    let(:green_tea_count) { 0 }
    let(:strawberry_count) { 0 }
    let(:coffee_count) { 3 }

    it 'sets discount on the original price of the strawberry' do
      expect(subject.first.price).to eq(11.23 * 2 / 3)
    end
  end
end
