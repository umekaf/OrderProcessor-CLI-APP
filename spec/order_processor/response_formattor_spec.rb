# frozen_string_literal: true

require 'stringio'
require 'order_processor/response_formattor'
require 'order_processor/product'
require 'byebug'

RSpec.describe OrderProcessor::ResponseFormattor do
  subject {described_class.new(ordered_items).formatted_response}  
  
  let(:ordered_items) do
    [
      OrderProcessor::Product.new('GR1', 'green tea', 1.555),
      OrderProcessor::Product.new('GR1', 'green tea', 1.555),
      OrderProcessor::Product.new('SR1', 'strawberry', 5.00),
      OrderProcessor::Product.new('CF1', 'coffee', 11.23)
    ]
  end

  let(:expected_response) { 'Basket GR1, GR1, SR1, CF1,Total: 19.34'}

  describe '#formatted_response' do
    it 'returns the ordered items with total price' do
      response = capture_stdout do
        subject
      end
      expect(response).to eq(expected_response)
    end
  end

  def capture_stdout(&blk)
    old = $stdout
    $stdout = fake = StringIO.new
    blk.call
    fake.string
  ensure
    $stdout = old
  end
end
