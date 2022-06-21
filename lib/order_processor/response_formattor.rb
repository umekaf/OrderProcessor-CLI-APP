# frozen_string_literal: true

module OrderProcessor
  class ResponseFormattor
    def initialize(ordered_items)
      @ordered_items = ordered_items
    end

    attr_reader :ordered_items

    def formatted_response
      print 'Basket'
      sum = ordered_items.inject(0) do |sum, item|
        print " #{item.product_code},"
        sum += item.price
      end
      print "Total: #{sum}"
    end
  end
end
