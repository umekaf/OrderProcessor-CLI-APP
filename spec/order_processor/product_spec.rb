require 'order_processor/product'

RSpec.describe OrderProcessor::Product do
  describe '#initialize' do
    context 'when item parameters provided' do
      subject {described_class.new('GR1', 'apple', 1.2)}

      it 'initialize the product data' do
        expect(subject.product_name).to eq('apple')
      end
    end

    context 'when item parameter is not provided' do
      subject { described_class.new()}

      it 'raises an argument error' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end
  end
end