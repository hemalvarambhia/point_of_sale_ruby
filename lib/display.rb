# -*- coding: utf-8 -*-
class Display
  attr_accessor :text
  def initialize
    @text = ""
  end

  def total price
    @text = "Total: #{Display.format(price)}"
  end
  
  def no_sale_yet
    @text = "No sale made yet. Begin by scanning an item."
  end

  def display_price price_in_pence
    print(Display.format(price_in_pence))
  end

  def print price
    @text = price
  end

  def product_not_found
    @text = "Product not found"
  end
  
  def error text
    @text = text
  end

  def self.format(price_in_pence)
    price = "%.2f" % (price_in_pence.to_f/100.0)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"
     
    price
  end
end
