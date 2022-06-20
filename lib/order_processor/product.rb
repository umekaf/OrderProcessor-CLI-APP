module OrderProcessor
  class Product
    PRODUCT_LIST = [
      { product_code: 'GR1', product_name: 'Green Tea', price: 3.11 },
      { product_code: 'SR1', product_name: 'Strawberries', price: 5.00 },
      { product_code: 'CF1', product_name: 'Coffee', price: 11.23 }
    ].freeze
    
    def initialize(product_code, product_name, price)
      @product_code = product_code
      @product_name = product_name
      @price = price
    end

    attr_accessor :product_code, :product_name, :price
  end
end