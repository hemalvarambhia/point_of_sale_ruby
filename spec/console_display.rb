# coding: utf-8
class ConsoleDisplay
  def display_price price
    p format price
  end
  
  def display_product_not_found_message barcode
    p "Product not found for %s" % barcode
  end

  def display_empty_barcode_message
    p "Scanning error: empty barcode"
  end

  private
  def format(price)
    price = "%.2f" % (price.in_pounds)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"
     
    price
  end

end
