# frozen_string_literal: true

module OrderProcessor
  class ProductOffer
    def initialize(green_tea_count, strawberry_count, coffee_count)
      @green_tea_count = green_tea_count
      @strawberry_count = strawberry_count
      @coffee_count = coffee_count
    end

    attr_reader :green_tea_count, :strawberry_count, :coffee_count

    def call
      ordered_items = []
      if green_tea_count.even?
        green_tea_count.times { ordered_items << Product.new('GR1', 'green tea', 3.11 / 2) }
      else
        (green_tea_count - 1).times { ordered_items << Product.new('GR1', 'green tea', 1.55) }
        ordered_items << Product.new('GR1', 'green tea', 3.11)
      end

      strawberry_price = strawberry_count >= 3 ? 4.50 : 5.00
      strawberry_count.times { ordered_items << Product.new('SR1', 'strawberry', strawberry_price) }

      coffee_price = coffee_count >= 3 ? (11.23 * 2 / 3) : 11.23
      coffee_count.times { ordered_items << Product.new('CF1', 'coffee', coffee_price) }

      ordered_items
    end
  end
end
