# frozen_string_literal: true

require 'order_processor/product'
require 'order_processor/product_offer'
require 'order_processor/response_formattor'

module OrderProcessor
  class Cli
    green_tea_count = 0
    strawberry_count = 0
    coffee_count = 0

    loop do
      puts "Enter the item you like to add. (type 'stop' to exit purchase)"
      input = gets.chomp
      user_input = input.upcase
      break if user_input == 'STOP'

      item = Product::PRODUCT_LIST.find { |product| product[:product_code] == user_input }
      if item.nil?
        puts 'Item you have entered is not valid. Please enter a valid item'
      elsif user_input == 'GR1'
        green_tea_count += 1
      elsif user_input == 'SR1'
        strawberry_count += 1
      elsif user_input == 'CF1'
        coffee_count += 1
      end
    end

    order_items_after_offer = ProductOffer.new(green_tea_count, strawberry_count, coffee_count).call
    all_order_items = ResponseFormattor.new(order_items_after_offer).formatted_response
    puts all_order_items
  end
end
