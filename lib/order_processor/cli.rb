# frozen_string_literal: true

module OrderProcessor
  class Cli
    loop do
      puts "Enter the item you like to add. (type 'stop' to exit purchase)"
      input = gets.chomp
      user_input = input.upcase
      break if user_input == 'STOP'
    end
  end
end
