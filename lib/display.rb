class Display
  attr_reader :text
  def initialize
    @text = ""
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
