class Display
  attr_accessor :text
  def initialize
    @text = ""
  end

  def total price
    @text = "Total: #{price}"
  end
  
  def no_sale_yet
    @text = "No sale made yet. Begin by scanning an item."
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
end
