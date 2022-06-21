# frozen_string_literal: true

module OrderProcessor
  class Cli
    ordered_items = []
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

      if green_tea_count.even?
        green_tea_count.times { order_items << Product.new('GR1', 'green tea', 3.11 / 2) }
      else
        (green_tea_count - 1).times { order_items << Product.new('GR1', 'green tea', 1.55) }
        order_items << Product.new('GR1', 'green tea', 3.11)
      end

      strawberry_price = strawberry_count >= 3 ? 4.50 : 5.00
      strawberry_count.times { order_items << Product.new('SR1', 'strawberry', strawberry_price) }

      coffee_price = coffee_count >= 3 ? (11.23 * 2 / 3) : 11.23
      coffee_count.times { order_items << Product.new('CF1', 'coffee', coffee_price) }
    end
  end
end
